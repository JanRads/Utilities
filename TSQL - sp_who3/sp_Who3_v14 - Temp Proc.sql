CREATE PROCEDURE ##sp_Who3
     @FastWhere varchar(10) = NULL  
   , @Where nvarchar(1000) = NULL
   , @OrderBy varchar(500) = NULL
   , @SQLfmt varchar(10) = NULL
   , @SQLmaxlen smallint = 1000
   , @ShowHeader bit=1
   , @IncludePlanXML bit=0
   , @Debug bit=0
   , @Help char(1) = NULL
AS
/*=====================================================================================================
Procedure Name : sp_Who3
Author         : Tim Barry
Date           : 2009-01-05
Version        : 14
Description    : This is the abominable love child of SQL2000's sp_who and sp_who2... that works with
                 SQL2005 & SQL2008.  It has several advantages over its parents, including filtering, sorting,
                 and SQL buffer retrieval.
                 
                 --- Relationship between Connections, Sessions, and Requests ---
                 Connections are the channels that connects an external client with SQL Server and Sessions are internal to SQL Server. 
                 When both exist, there is usually a one-to-one relastionship.  However, there are exceptions too. Under some scenarios 
                 such as MARS (Multiple Active Record Sets), a Connection may contain more than one Session. Similarly, certain type of 
                 Sessions may not have a Connection associated, such as Service Broker sessions.

                 Requests refers to the TSQL statements being executed from each Connection/Session.  A singe Request may be broking up
                 into multiple threads (execution context, ECID), some which may be waiting for resources, waiting for CPU, or running.
                 
Parameters     : execute sp_Who3 @Help='y' for a full list of parameter descriptions.
                 @FastWhere  varchar(10)
                 @Where      nvarchar(1000)
                 @OrderBy    varchar(500)
                 @SQLfmt     varchar(10)
                 @SQLmaxlen  smallint
                 @ShowHeader bit
                 @IncludePlanXML bit
                 @Debug      bit
                 @Help       char(1)
Depends On     : sys.object
                 sys.dm_tran_session_transactions 
                 sys.dm_exec_sessions
                 sys.dm_exec_connections
                 sys.dm_exec_requests
                 sys.dm_exec_sql_text
                 sp_Usage	
Objects Altered: NA
Calls          : NA
Returns        : Information on connections per parameters
Remarks        : 
History        :

=====================================================================================================*/

--============================================== Environment Section =====================================================
SET NOCOUNT ON
SET ANSI_WARNINGS OFF

--============================================== Declaration Section =====================================================
DECLARE -- maximum column length for dynamic column width adjustment
     @max_len_session varchar(5)
   , @max_len_session_status varchar(5)
   , @max_len_request_status varchar(5)
   , @max_len_loginname varchar(5)
   , @max_len_dbname varchar(5)
   , @max_len_command varchar(5)
   , @max_len_hostname varchar(5)
   , @max_len_memusage varchar(5)
   , @max_len_physical_io varchar(5)
   , @max_len_TranIsoLvl varchar(5)
   , @max_len_program_name varchar(5)
   , @max_len_cpu varchar(5)
   , @max_len_reads varchar(5)
   , @max_len_writes varchar(5)
   , @max_len_r_cpu varchar(5)
   , @max_len_r_reads_phy varchar(5)
   , @max_len_r_reads_Log varchar(5)
   , @max_len_r_writes varchar(5)
   , @max_len_r_memory varchar(5)
   , @max_len_opentran varchar(5)
   , @max_len_blocked varchar(5)
   , @max_len_waittime varchar(5)
   , @max_len_waittype varchar(5)
   , @max_len_waitresource varchar(5)
   , @max_len_requestid varchar(5)
   , @max_len_transport varchar(5) 
   , @max_len_connectionid varchar(5)

DECLARE -- other
    @Error int
    , @ErrorMsg varchar(500)
    , @SQL nvarchar(4000)
    , @SelectClause nvarchar(2000)
    , @FromClause nvarchar(1000)
    , @WhereClause nvarchar(1000)
    , @OrderByClause nvarchar(1000)
    , @SessionsFilteredSQL nvarchar(4000)
    , @header varchar(500)
    , @SessionCount int
    , @RunnableCount int
    , @ProcStartTime datetime
    , @ProcName sysname
    , @SessionID int
    , @ConnectionID uniqueidentifier
    , @RequestID int
    , @SqlHandle varbinary(64), @CorrectSQLhandle varbinary(64)
    , @PlanHandle varbinary(64)
    , @MostRecentSqlHandle varbinary(64)
    , @Statement_Start_Offset int
    , @Statement_End_Offset int
    , @BatchSqlText varchar(8000)

--============================================== Initialization Section =====================================================
SET @Error  = 0 
SET @ProcStartTime = GETDATE()
SET @ProcName = (SELECT [name] FROM master.sys.objects WHERE object_id = @@PROCID)


--============================================== Processing Section =====================================================
------- Parameter Checking --------
IF (@Help IN ('?','Y','1','T')) GOTO Help

IF @OrderBy IS NOT NULL BEGIN
   IF (PATINDEX('%[-/*;''"]%', @orderby) >= 1 
      OR @orderby LIKE '%order%'
      OR DATALENGTH(@orderby) > 100) BEGIN
      SELECT @Error = 1, @ErrorMsg = N'@OrderBy clause is incorrect.'
      GOTO Terminate
   END
END

IF @SQLmaxlen > 8000 BEGIN
    SELECT @Error = 1, @ErrorMsg = N'@SQLMaxLen cannot exceed 8000.'
    GOTO Terminate
END


------- Processing --------
CREATE TABLE #tmp_SessionsFiltered (RowID smallint IDENTITY(1,1), SessionRowID int)

-- Collect all Sessions and thieir Request and Connection info.
IF OBJECT_ID('tempdb..#tmp_SysSessions') IS NOT NULL DROP TABLE #tmp_SysSessions

;WITH RequestThreads AS (
   SELECT 
      session_id, request_id, COUNT(*) AS WorkerThreads,
      SUM(CASE WHEN task_state = 'SUSPENDED' THEN 1 ELSE 0 END) AS WT_SUSPENDED,
      SUM(CASE WHEN task_state = 'RUNNABLE' THEN 1 ELSE 0 END) AS WT_RUNNABLE,
      SUM(CASE WHEN task_state = 'RUNNING' THEN 1 ELSE 0 END) AS WT_RUNNING,
      SUM(CASE WHEN task_state = 'DONE' THEN 1 ELSE 0 END) AS WT_DONE
   FROM sys.dm_os_tasks 
   GROUP BY session_id, request_id
   ) 
SELECT 
    IDENTITY(smallint, 1,1)               AS RowID
    , S.session_id                        AS s_SessionID    -- smallint
    , S.status                            AS s_Status       -- nvarchar(30)
    , S.login_name                        AS s_LoginName    -- nvarchar(128)
    , S.host_name                         AS s_HostName     -- nvarchar(128)
    , S.memory_usage                      AS s_Memory       -- int
    , S.cpu_time                          AS s_CPU          -- int
    , S.reads                             AS s_Reads        -- bigint
    , S.writes                            AS s_Writes       -- bigint
    , S.last_request_start_time           AS s_LastRequestOn -- datetim
    , S.program_name                      AS s_ProgramName  -- nvarchar(128)
    , R.request_id                        AS r_RequestID
    , R.start_time                        AS r_StartedOn    -- datetime
    , DATEDIFF(mi, R.start_time, GETDATE()) AS r_DurMins 

    , R.status                            AS r_Status
    , R.database_id                       AS r_DBid			-- int		-- ID of the database against which the request was submitted.
    , R.command                           AS r_Command      -- nvarchar(32)
    , DB_NAME(R.database_id)              AS r_DBname
    , R.cpu_time                          AS r_CPU          -- int
    , R.reads                             AS r_ReadsPhy		-- bigint
    , R.logical_reads                     AS r_ReadsLog		-- bigint
    , R.writes                            AS r_Writes     -- bigint
    , R.granted_query_memory              AS r_Memory       -- int
    , R.wait_time                         AS r_WaitTime		-- int
    , R.wait_type                         AS r_WaitType		-- smallint
    , R.wait_resource                     AS r_WaitResource	-- nvarchar(512)
    , R.sql_handle                        AS r_SQLhandle
    , R.plan_handle                       AS r_Planhandle
    , R.statement_start_offset            AS r_Statement_Start_Offset
    , R.statement_end_offset              AS r_Statement_End_Offset
    , ISNULL(R.blocking_session_id,0)     AS r_BlockedBy    -- smallint
    , ISNULL(RT.WorkerThreads,0)          AS r_WThreads
    , ISNULL(RT.WT_RUNNING,0)             AS r_WTRunning
    , ISNULL(RT.WT_RUNNABLE,0)            AS r_WTRunnable
    , ISNULL(RT.WT_SUSPENDED,0)           AS r_WTSusp
    , ISNULL(RT.WT_DONE,0)                AS r_WTDone
    , (CASE R.transaction_isolation_level							
    WHEN 1 THEN 'ReadUncomm'
    WHEN 2 THEN 'ReadComm'
    WHEN 3 THEN 'Repeatable'
    WHEN 4 THEN 'Serial'
    WHEN 5 THEN 'Snapshot'
    END)                                  AS r_TranIsoLvl   -- smallint

    , C.connection_id                     AS c_ConnectionID -- nvarchar(40)
    , CONVERT(bit, (CASE WHEN C.parent_connection_id IS NULL THEN 1 ELSE 0 END)) AS c_IsParent
    , C.net_transport                     AS c_Transport    -- nvarchar(40)
    , C.connect_time                      AS c_ConnectedOn  -- datetime
    , C.most_recent_sql_handle            AS c_MostRecentSQLhandle

    , (SELECT ISNULL(COUNT(*),0) FROM sys.dm_tran_session_transactions 
    WHERE session_id = S.session_id)      AS OpenTran       -- int

    -- Columns used for sorting/filtering.
    , S.session_id                        AS session_numeric
    , S.cpu_time                          AS s_cpu_numeric
    , S.reads                             AS s_reads_numeric
    , S.writes                            AS s_writes_numeric
    , S.memory_usage                      AS s_memusage_numeric
    , R.cpu_time                          AS r_cpu_numeric
    , R.reads                             AS r_reads_phy_numeric
    , R.logical_reads                     AS r_reads_log_numeric
    , R.writes                            AS r_writes_numeric
    , R.wait_time                         AS r_waittime_numeric
    , R.granted_query_memory              AS r_memusage_numeric
    , ISNULL(RT.WorkerThreads,0)          AS r_worker_threads_numeric
    , ISNULL(RT.WT_RUNNING,0)             AS r_worker_threads_running_numeric
INTO #tmp_SysSessions 
FROM sys.dm_exec_sessions S 					
   LEFT JOIN sys.dm_exec_requests    R ON R.session_id = S.session_id AND R.[sql_handle] IS NOT NULL
   LEFT JOIN sys.dm_exec_connections C ON C.session_id = S.session_id
      LEFT JOIN RequestThreads RT ON RT.session_id = R.session_id AND RT.request_id = R.request_id
WHERE S.session_id != @@SPID
ORDER BY S.session_id

SET @SessionCount = @@ROWCOUNT

SELECT @RunnableCount = COUNT(s_SessionID) FROM #tmp_SysSessions WHERE [s_Status] ='RUNNING'

SET @header = '***  sp_Who3' +
   '     SampledOn:' + CONVERT(CHAR(19), @ProcStartTime, 121) + 
   '     Server: ' + UPPER(@@SERVERNAME) + 
   '     Session count: ' + LTRIM(STR(@SessionCount)) + '     ' + 
   '     Runnable count: ' + LTRIM(STR(@RunnableCount)) + CHAR(10)

IF @ShowHeader = 1 PRINT @header


-- Obtain the input buffers for each non-system session.
IF @SQLfmt IS NOT NULL BEGIN
    SELECT RowID, s_SessionID, c_ConnectionID, c_IsParent, r_RequestID, r_SQLhandle, r_Planhandle, r_Statement_Start_Offset, r_Statement_End_Offset, c_MostRecentSQLhandle
    INTO #tmp_SQL
    FROM #tmp_SysSessions S
    WHERE COALESCE(r_SQLhandle, c_MostRecentSQLhandle) IS NOT NULL
END

-- Compose the OrderBy clause
IF @OrderBy IS NULL BEGIN
    SET @OrderByClause = 'session_numeric asc, r_DBname asc, s_LoginName asc, s_status asc, r_Command asc'
    SET @OrderByClause = 'session_numeric asc, c_IsParent desc, c_ConnectionID asc, r_RequestID asc'
END ELSE BEGIN
    -- Numerics have been converted to alphas, which don't sort the way you want.  If the user wanted to sort via a numeric,
    -- replace their alpha column with the corresponding numeric.
    SET @OrderBy = REPLACE(@OrderBy, 's_SessionID', 'session_numeric')
    SET @OrderBy = REPLACE(@OrderBy, 's_CPU', 's_cpu_numeric')
    SET @OrderBy = REPLACE(@OrderBy, 's_Reads', 's_reads_numeric')
    SET @OrderBy = REPLACE(@OrderBy, 's_Writes', 's_writes_numeric')
    SET @OrderBy = REPLACE(@OrderBy, 's_Memory', 's_memusage_numeric')
    SET @OrderBy = REPLACE(@OrderBy, 'r_Waittime', 'r_waittime_numeric')
    SET @OrderBy = REPLACE(@OrderBy, 'r_CPU', 'r_cpu_numeric')
    SET @OrderBy = REPLACE(@OrderBy, 'r_ReadsLog', 'r_reads_log_numeric')
    SET @OrderBy = REPLACE(@OrderBy, 'r_ReadsPhy', 'r_reads_phy_numeric')
    SET @OrderBy = REPLACE(@OrderBy, 'r_Writes', 'r_writes_numeric')
    SET @OrderBy = REPLACE(@OrderBy, 'r_Memory', 'r_memusage_numeric')
    SET @OrderBy = REPLACE(@OrderBy, 'r_WThreads', 'r_worker_threads_numeric')
    SET @OrderBy = REPLACE(@OrderBy, 'r_WTRunning', 'r_worker_threads_running_numeric')

    SET @OrderByClause = @OrderBy
END
SET @OrderByClause = CHAR(10) + 'ORDER BY ' + @OrderByClause

-- Assemble the SQL statement used to populate #tmp_SessionsFiltered, which will contain session id's after the @Where and @OrderBy clauses 
-- have been applied.  This table is used to filter and order target sessions, and then filter their SQL statements but still display them
-- in session order (user cannot override).
IF (@FastWhere = 'BLOCK') BEGIN 
    -- User wants to see only Sessions involved with resource blocking.

    SET @SessionsFilteredSQL = '
        INSERT #tmp_SessionsFiltered (SessionRowID)
        SELECT SESS.RowID
        FROM 
            #tmp_SysSessions SESS
            JOIN 
            (
            SELECT s_SessionID
            FROM #tmp_SysSessions
            WHERE r_BlockedBy > 0
            UNION
            SELECT s_SessionID
            FROM #tmp_SysSessions S
            WHERE EXISTS (
               SELECT s_SessionID
               FROM #tmp_SysSessions
               WHERE r_BlockedBy > 0 AND r_BlockedBy = S.s_SessionID
               )
            ) AS X ON X.s_SessionID = SESS.s_SessionID'

END ELSE IF @FastWhere = 'ACTIVE' BEGIN
    -- User wants to see only Sessions that are engaged in some kind of operation..

    SET @SessionsFilteredSQL = '
        INSERT #tmp_SessionsFiltered (SessionRowID)
        SELECT SESS.RowID
        FROM #tmp_SysSessions SESS
        WHERE (SESS.s_Status IN (''RUNNING'',''RUNNABLE'')) OR (SESS.OpenTran > 0) OR (SESS.r_Status IN (''BACKGROUND''))'

END ELSE IF @FastWhere = 'SYS' BEGIN
    -- User wants to see only System Sessions.

    SET @SessionsFilteredSQL = '
        INSERT #tmp_SessionsFiltered (SessionRowID)
        SELECT SESS.RowID
        FROM #tmp_SysSessions SESS
        WHERE (SESS.s_SessionID <= 50)'

END ELSE IF @FastWhere = 'NONSYS' BEGIN
    -- User wants to see only Non-System Sessions.

    SET @SessionsFilteredSQL = '
        INSERT #tmp_SessionsFiltered (SessionRowID)
        SELECT SESS.RowID
        FROM #tmp_SysSessions SESS
        WHERE (SESS.s_SessionID > 50)'

END ELSE IF @Where IS NULL OR LEN(@Where) = 0 BEGIN
    -- User wants to see ALL Sessions.

    SET @SessionsFilteredSQL = '
        INSERT #tmp_SessionsFiltered (SessionRowID)
        SELECT SESS.RowID
        FROM #tmp_SysSessions SESS'

END ELSE BEGIN 
    -- User has specified their own WHERE clause.
    -- Numerics have been converted to alphas to make it easier to shrink their display columns, however, they don't sort the way you want.  
    -- If the user wanted to sort via what they think is a numeric column (s_Session), replace their alpha column with the corresponding numeric (session_numeric).

    SET @Where = REPLACE(@Where, 's_SessionID', 'session_numeric')
    SET @Where = REPLACE(@Where, 's_CPU', 's_cpu_numeric')
    SET @Where = REPLACE(@Where, 's_Reads', 's_reads_numeric')
    SET @Where = REPLACE(@Where, 's_Writes', 's_writes_numeric')
    SET @Where = REPLACE(@Where, 's_Memory', 's_memusage_numeric')
    SET @Where = REPLACE(@Where, 'r_Waittime', 'r_waittime_numeric')
    SET @Where = REPLACE(@Where, 'r_CPU', 'r_cpu_numeric')
    SET @Where = REPLACE(@Where, 'r_ReadsLog', 'r_reads_log_numeric')
    SET @Where = REPLACE(@Where, 'r_ReadsPhy', 'r_reads_phy_numeric')
    SET @Where = REPLACE(@Where, 'r_Writes', 'r_writes_numeric')
    SET @Where = REPLACE(@Where, 'r_Memory', 'r_memusage_numeric')
    SET @Where = REPLACE(@Where, 'r_WThreads', 'r_worker_threads_numeric')
    SET @Where = REPLACE(@Where, 'r_WTRunning', 'r_worker_threads_running_numeric')

    -- Change double quote to 2 single quotes.
    SET @Where = REPLACE(@Where, '"', '''')  -- 'changes r_WaitType IN ("BROKER_TRANSMITTER","KSOURCE_WAKEUP") to r_WaitType IN (''BROKER_TRANSMITTER",''KSOURCE_WAKEUP'')

    SET @WhereClause = CHAR(10) + 'WHERE ' + @Where

    SET @SessionsFilteredSQL = '
        INSERT #tmp_SessionsFiltered (SessionRowID)
        SELECT SESS.RowID
        FROM #tmp_SysSessions SESS' + @WhereClause 
END

-- Append the OrderBy clause.
SET @SessionsFilteredSQL = @SessionsFilteredSQL + @OrderByClause

IF (@Debug = 1) BEGIN
    -- Print the compiled strings.
    PRINT ''
    PRINT '----- @WhereClause='
    PRINT @WhereClause

    PRINT ''
    PRINT '----- @OrderByClause='
    PRINT @OrderByClause

    PRINT ''
    PRINT '----- @SessionsFilteredSQL=' 
    PRINT @SessionsFilteredSQL
END

-- Create a list of only the target sessions.
IF @Debug = 1 PRINT 'Executing @SessionsFilteredSQL'
EXEC (@SessionsFilteredSQL)


-- Identify the maximum lengths of the values in every column.  This is to reduce the column widths as much as possible for display.
-- The ISNULL(<column>,'*') ensure that the column never has a zero-length, which breaks the assembly of @SelectClause.
SELECT 
    @max_len_session = MAX(LEN(RTRIM(LTRIM(STR(s_SessionID))))) 
    , @max_len_session_status = MAX(LEN(RTRIM(LTRIM(s_Status)))) 
    , @max_len_hostname = MAX(LEN(RTRIM(LTRIM(ISNULL(s_Hostname,'*')))))
    , @max_len_loginname = MAX(LEN(RTRIM(LTRIM(ISNULL(s_LoginName,'*')))))
    , @max_len_opentran = MAX(LEN(RTRIM(LTRIM(STR(OpenTran))))) 
    , @max_len_CPU = MAX(LEN(RTRIM(LTRIM(STR(s_CPU)))))
    , @max_len_Reads = MAX(LEN(RTRIM(LTRIM(STR(s_Reads)))))
    , @max_len_Writes = MAX(LEN(RTRIM(LTRIM(STR(s_Writes)))))
    , @max_len_memusage = MAX(LEN(RTRIM(LTRIM(STR(s_Memory)))))
    , @max_len_requestid = MAX(LEN(RTRIM(LTRIM(ISNULL(STR(r_RequestID),'*')))))
    , @max_len_request_status = MAX(LEN(RTRIM(LTRIM(ISNULL(r_Status,'*')))))
    , @max_len_dbname = MAX(LEN(RTRIM(LTRIM(ISNULL(r_DBname,'*')))))
    , @max_len_command = MAX(LEN(RTRIM(LTRIM(ISNULL(r_Command,'*')))))
    , @max_len_r_CPU = MAX(LEN(RTRIM(LTRIM(ISNULL(STR(r_CPU),'*')))))
    , @max_len_r_Reads_Phy = MAX(LEN(RTRIM(LTRIM(ISNULL(STR(r_ReadsPhy),'*')))))
    , @max_len_r_Reads_Log = MAX(LEN(RTRIM(LTRIM(ISNULL(STR(r_ReadsLog),'*')))))
    , @max_len_r_Writes = MAX(LEN(RTRIM(LTRIM(ISNULL(STR(r_Writes),'*')))))
    , @max_len_r_Memory = MAX(LEN(RTRIM(LTRIM(ISNULL(STR(r_Memory),'*')))))
    , @max_len_waittime = MAX(LEN(RTRIM(LTRIM(ISNULL(STR(r_Waittime),'*')))))
    , @max_len_waittype = MAX(LEN(RTRIM(LTRIM(ISNULL(r_Waittype,'*')))))
    , @max_len_waitresource = CASE WHEN MAX(LEN(RTRIM(LTRIM(ISNULL(r_Waitresource,'*'))))) < 50 THEN MAX(LEN(RTRIM(LTRIM(ISNULL(r_Waitresource,'*'))))) ELSE 50 END
    , @max_len_TranIsoLvl = MAX(LEN(RTRIM(LTRIM(r_TranIsoLvl))))
    , @max_len_program_name = MAX(LEN(RTRIM(LTRIM(ISNULL(s_ProgramName,'*')))))
    , @max_len_transport = MAX(LEN(RTRIM(LTRIM(ISNULL(c_Transport,'*')))))
    , @max_len_connectionid = MAX(LEN(RTRIM(LTRIM(ISNULL(CONVERT(char(36), c_ConnectionID),'*')))))

FROM #tmp_SysSessions SESS
    JOIN #tmp_SessionsFiltered SF ON SF.SessionRowID = SESS.RowID


IF (@Debug = 1) BEGIN
    PRINT ''
    PRINT '@max_len_session = ' + CONVERT(varchar, @max_len_session)
    PRINT '@max_len_session_status = ' + CONVERT(varchar, @max_len_session_status)
    PRINT '@max_len_hostname = ' + CONVERT(varchar, @max_len_hostname)
    PRINT '@max_len_loginname = ' + CONVERT(varchar, @max_len_loginname)
    PRINT '@max_len_opentran = ' + CONVERT(varchar, @max_len_opentran)
    PRINT '@max_len_CPU = ' + CONVERT(varchar, @max_len_CPU)
    PRINT '@max_len_Reads = ' + CONVERT(varchar, @max_len_Reads)
    PRINT '@max_len_Writes = ' + CONVERT(varchar, @max_len_Writes)
    PRINT '@max_len_memusage = ' + CONVERT(varchar, @max_len_memusage)
    PRINT '@max_len_requestid = ' + CONVERT(varchar, @max_len_requestid)
    PRINT '@max_len_request_status = ' + CONVERT(varchar, @max_len_request_status)
    PRINT '@max_len_dbname = ' + CONVERT(varchar, @max_len_dbname)
    PRINT '@max_len_command = ' + CONVERT(varchar, @max_len_command)
    PRINT '@max_len_r_CPU = ' + CONVERT(varchar, @max_len_r_CPU)
    PRINT '@max_len_r_Reads_Phy = ' + CONVERT(varchar, @max_len_r_Reads_Phy)
    PRINT '@max_len_r_Reads_Log = ' + CONVERT(varchar, @max_len_r_Reads_Log)
    PRINT '@max_len_r_Writes = ' + CONVERT(varchar, @max_len_r_Writes)
    PRINT '@max_len_r_Memory = ' + CONVERT(varchar, @max_len_r_Memory)
    PRINT '@max_len_waittime = ' + CONVERT(varchar, @max_len_waittime)
    PRINT '@max_len_waittype = ' + CONVERT(varchar, @max_len_waittype)
    PRINT '@max_len_waitresource = ' + CONVERT(varchar, @max_len_waitresource)
    PRINT '@max_len_TranIsoLvl = ' + CONVERT(varchar, @max_len_TranIsoLvl)
    PRINT '@max_len_program_name = ' + CONVERT(varchar, @max_len_program_name)
    PRINT '@max_len_transport = ' + CONVERT(varchar, @max_len_transport)
    PRINT '@max_len_connectionid = ' + CONVERT(varchar, @max_len_connectionid)
END


-- Build the SELECT clause.
SET @SelectClause = N'SELECT 
   LEFT(s_SessionID, ' + @max_len_session + ') AS ''s_SessionID''
   ,LEFT(s_Status, ' + @max_len_session_status + ') AS ''s_Status''
   ,LEFT(s_Hostname,' + @max_len_hostname + ') AS ''s_Hostname''
   ,LEFT(s_LoginName, ' + @max_len_loginname + ') AS ''s_LoginName'' 
   ,LEFT(OpenTran, ' + @max_len_opentran + ') AS ''OpenTran''
   ,r_BlockedBy
   ,LEFT(s_CPU, ' + @max_len_cpu + ') AS ''s_CPU''
   ,LEFT(s_Reads, ' + @max_len_reads + ') AS ''s_Reads''
   ,LEFT(s_Writes, ' + @max_len_writes + ') AS ''s_Writes''
   ,LEFT(s_Memory, ' + @max_len_memusage + ') AS ''s_Memory''
   ,CONVERT(CHAR(19), s_LastRequestOn, 121) AS ''s_LastRequestOn''

   ,LEFT(r_RequestID, ' + @max_len_requestid + ') AS ''r_RequestID''
   ,LEFT(r_Status, ' + @max_len_request_status + ') AS ''r_Status''
   ,LEFT(r_DBname, ' + @max_len_dbname + ') AS ''r_DBname''
   ,LEFT(r_Command, ' + @max_len_command + ') AS ''r_Command''
   ,LEFT(r_CPU, ' + @max_len_r_cpu + ') AS ''r_CPU''
   ,LEFT(r_ReadsPhy, ' + @max_len_r_reads_phy + ') AS ''r_ReadsPhy ''
   ,LEFT(r_ReadsLog, ' + @max_len_r_reads_log + ') AS ''r_ReadsLog''
   ,LEFT(r_Writes, ' + @max_len_r_writes + ') AS ''r_Writes''
   ,LEFT(r_Memory, ' + @max_len_r_cpu + ') AS ''r_Memory''
   ,LEFT(r_Waittime, ' + @max_len_waittime + ') AS ''r_Waittime''
   ,LEFT(r_Waittype, ' + @max_len_waittype + ') AS ''r_Waittype''
   ,LEFT(r_Waitresource, ' + @max_len_waitresource + ') AS ''r_Waitresource''
   ,r_WThreads
   ,r_WTRunning
   ,r_WTRunnable
   ,r_WTSusp
   ,r_WTDone
   ,CONVERT(CHAR(19), r_StartedOn, 121) AS ''r_StartedOn''
   ,CONVERT(CHAR(7), r_DurMins) AS ''r_DurMins''
   ,LEFT(r_TranIsoLvl, ' + @max_len_TranIsoLvl + ') AS ''r_TranIsoLvl''
   ,LEFT(s_ProgramName, ' + @max_len_program_name + ') AS ''s_ProgramName''
   ,LEFT(c_ConnectionID, ' + @max_len_connectionid + ') AS ''c_ConnectionID''
   ,c_IsParent
   ,CONVERT(CHAR(19), c_ConnectedOn, 121) AS ''c_ConnectedOn'' 
   ,LEFT(c_Transport, ' + @max_len_transport + ') AS ''c_Transport''

   ,LEFT(s_SessionID, ' + @max_len_session + ') AS ''s_SessionID'''

-- If the header is being stripped, append a SampledOn column to the result set.
IF @ShowHeader = 0 SET @SelectClause = @SelectClause + ', ''' + CONVERT(nchar(23), @ProcStartTime, 121) + ''' AS SampledOn'

SET @FromClause = CHAR(10) + N'FROM #tmp_SysSessions SESS
    JOIN #tmp_SessionsFiltered SF ON SF.SessionRowID = SESS.RowID
ORDER BY SF.RowID'

SET @SQL = @SelectClause + @FromClause

IF (@Debug = 1) BEGIN
    -- Print the compiled strings.
    PRINT ''
    PRINT '----- @SelectClause=' 
    PRINT @SelectClause
    PRINT ''
    PRINT '----- @FromClause=' 
    PRINT @FromClause
    PRINT ''
    PRINT '----- @SQL=' 
    PRINT @SQL
END

-- Return all of the session/request/connection data for the filtered sessions.
IF @Debug = 1 PRINT 'Executing @SQL'
EXEC (@SQL)


IF @SQLfmt = 'GRID' BEGIN

   -- Occasionally, retrieving the XML Query Plan via sys.dm_exec_query_plan is blocked.  This option allows you to move on without the query plan.
   IF @IncludePlanXML = 1 BEGIN

      SET @SQL = '
         SELECT SQ.s_SessionID, 
            COALESCE(SQ.r_SQLhandle, SQ.c_MostRecentSQLhandle) AS SQLHandle,
            SQ.r_Planhandle AS PlanHandle,
            (CASE WHEN r_SQLhandle IS NOT NULL THEN ''current'' WHEN c_MostRecentSQLhandle IS NOT NULL THEN ''most recent'' END) AS Latency,
            LEFT(SQtext.text, ' + CONVERT(varchar,@SQLmaxlen) + ') AS [Batch],
            (CASE WHEN ISNULL(SQ.r_Statement_End_Offset, -1) != -1 AND SQ.r_Statement_End_Offset > 0 
            THEN LEFT(SUBSTRING(SQtext.text, (SQ.r_Statement_Start_Offset/2)+1, ((SQ.r_Statement_End_Offset - SQ.r_Statement_Start_Offset)/2)-1), ' + CONVERT(varchar,@SQLmaxlen) + ')
            END) AS [Statement],
            SQplan.query_plan AS [Plan]
         FROM #tmp_SQL SQ
            JOIN #tmp_SessionsFiltered SF ON SF.SessionRowID = SQ.RowID
               OUTER APPLY sys.dm_exec_sql_text(SQ.r_SQLHandle) SQtext
               OUTER APPLY sys.dm_exec_query_plan(SQ.r_PlanHandle) SQplan
         ORDER BY SQ.s_SessionID, c_IsParent DESC, c_ConnectionID'

   END ELSE IF @IncludePlanXML = 0 BEGIN

      SET @SQL = '
         SELECT SQ.s_SessionID, 
            COALESCE(SQ.r_SQLhandle, SQ.c_MostRecentSQLhandle) AS SQLHandle,
            SQ.r_Planhandle AS PlanHandle,
            (CASE WHEN r_SQLhandle IS NOT NULL THEN ''current'' WHEN c_MostRecentSQLhandle IS NOT NULL THEN ''most recent'' END) AS Latency,
            LEFT(SQtext.text, ' + CONVERT(varchar,@SQLmaxlen) + ') AS [Batch],
            (CASE WHEN ISNULL(SQ.r_Statement_End_Offset, -1) != -1 AND SQ.r_Statement_End_Offset > 0 
            THEN LEFT(SUBSTRING(SQtext.text, (SQ.r_Statement_Start_Offset/2)+1, ((SQ.r_Statement_End_Offset - SQ.r_Statement_Start_Offset)/2)-1), ' + CONVERT(varchar,@SQLmaxlen) + ')
            END) AS [Statement]
         FROM #tmp_SQL SQ
            JOIN #tmp_SessionsFiltered SF ON SF.SessionRowID = SQ.RowID
               OUTER APPLY sys.dm_exec_sql_text(SQ.r_SQLHandle) SQtext
         ORDER BY SQ.s_SessionID, c_IsParent DESC, c_ConnectionID'
   
   END

    IF @Debug = 1 PRINT @SQL
   EXEC (@SQL)

END ELSE IF @SQLfmt = 'TEXT' BEGIN

    -- Try and get the information from the request first.  If it doesn't exist, fall back to the session.
    DECLARE curSQLHandle CURSOR LOCAL FAST_FORWARD FOR 
    SELECT
        SQ.s_SessionID,
          SQ.c_ConnectionID, 
        SQ.c_MostRecentSQLhandle, 
        SQ.r_RequestID,
        SQ.r_SQLhandle, 
        SQ.r_Planhandle, 
        SQ.r_Statement_Start_Offset,
        SQ.r_Statement_End_Offset
    FROM #tmp_SQL SQ
       JOIN #tmp_SessionsFiltered SF ON SF.SessionRowID = SQ.RowID
    ORDER BY SQ.s_SessionID, c_IsParent DESC, c_ConnectionID

    OPEN curSQLHandle

    FETCH curSQLHandle
    INTO @SessionID, @ConnectionID, @MostRecentSqlHandle, @RequestID, @SqlHandle, @PlanHandle, @Statement_Start_Offset, @Statement_End_Offset


    WHILE @@FETCH_STATUS = 0 BEGIN

      PRINT ''
      PRINT '--------------------------------------------- INPUT BUFFER for s_SessionID=' + CONVERT(varchar, @SessionID) + ', r_RequestID=' + ISNULL(CONVERT(varchar, @RequestID), 'NULL') + ', c_ConnectionID=' + 
      ISNULL(CONVERT(varchar(36), @ConnectionID),'NULL') + (CASE WHEN @SqlHandle IS NOT NULL THEN ' (current)' WHEN @MostRecentSqlHandle IS NOT NULL THEN ' (most recent)' END) 

      -- Get the SQL batch.
      SET @CorrectSQLhandle = ISNULL(@SqlHandle, @MostRecentSqlHandle)
      PRINT @CorrectSQLhandle
      IF @PlanHandle IS NOT NULL PRINT @PlanHandle

      SET @BatchSqlText=''
      SELECT @BatchSqlText = ISNULL(SQ.text,'')
      FROM sys.dm_exec_sql_text(@CorrectSQLhandle) SQ

      PRINT LEFT(@BatchSqlText, @SQLmaxlen)

      IF ISNULL(@Statement_End_Offset, -1) != -1 AND @Statement_End_Offset > 0 BEGIN
         PRINT ''
         PRINT '----------------------- statement in batch/proc'

         SELECT @BatchSqlText = SUBSTRING(SQ.text, (@Statement_Start_Offset/2)+1, ((@Statement_End_Offset - @Statement_Start_Offset)/2)-1)
         FROM sys.dm_exec_sql_text(@CorrectSQLhandle) SQ

         PRINT LEFT(@BatchSqlText, @SQLmaxlen)
      END

      FETCH curSQLHandle
      INTO @SessionID, @ConnectionID, @MostRecentSqlHandle, @RequestID, @SqlHandle, @PlanHandle, @Statement_Start_Offset, @Statement_End_Offset
    END

    CLOSE curSQLHandle
    DEALLOCATE curSQLHandle

END


--============================================== Termination Section =====================================================

Terminate:

-- Cleanup.
IF OBJECT_ID('tempdb..#tmp_SysSessions') IS NOT NULL  DROP TABLE #tmp_SysSessions
IF OBJECT_ID('tempdb..#tmp_BlockedSessions') IS NOT NULL DROP TABLE #tmp_BlockedSessions
IF OBJECT_ID('tempdb..#tmp_BlockingSessions') IS NOT NULL DROP TABLE #tmp_BlockingSessions
IF OBJECT_ID('tempdb..#tmp_BlockedBlockingSessions') IS NOT NULL DROP TABLE #tmp_BlockedBlockingSessions
IF OBJECT_ID('tempdb..#tmp_SQL') IS NOT NULL DROP TABLE #tmp_SQL
IF OBJECT_ID('tempdb..#tmp_SessionsFiltered') IS NOT NULL DROP TABLE #tmp_SessionsFiltered

IF CURSOR_STATUS('local', 'curSQLHandle') >= 0 BEGIN
   CLOSE curSQLHandle
   DEALLOCATE curSQLHandle
END

-- Error handling.
IF @Error != 0 BEGIN
   IF @Error NOT BETWEEN 1 AND 9 BEGIN
      -- Developer defined error.
      -- SQL Server/Windows error.
      SELECT @ErrorMsg = text FROM master.sys.messages WHERE message_id = @Error
      SET @ErrorMsg = @ErrorMsg + ' ;' + @ProcName
   END
   RAISERROR(@ErrorMsg,16,1)
END

-- Return success/failure value.
RETURN @Error


--============================================== Help Section ============================================================
Help:
-- Place the build of documentation in the assignment of these variables.
EXEC sp_Usage @objectname=@ProcName,
   @desc='This is a modified version of sp_who and sp_who2 that works with SQL Server 2000 and has more input 
             parameters to filter out unwanted information. In addition to inheriting the beneficial features of its 
             predecessors, the new stored procedure provides a flexible way to investigate SQL Server connections by session, 
             status, login, command, database, host, last batch, program, or any combination of these factors. sp_Who3 
             also helps troubleshoot performance by detecting waiting processes and potential blocking.

			 --- Relationship between Connections, Sessions, and Requests ---
             Connections are the channels that connects an external client with SQL Server and Sessions are internal to SQL Server. 
             When both exist, there is usually a one-to-one relastionship.  However, there are exceptions too. Under some scenarios 
             such as MARS (Multiple Active Record Sets), a Connection may contain more than one Session. Similarly, certain type of 
             Sessions may not have a Connection associated, such as Service Broker sessions.

             Requests refers to the TSQL statements being executed from each Connection/Session.  A singe Request may be broking up
             into multiple threads (execution context, ECID), some which may be waiting for resources, waiting for CPU, or running.

             This procedure examines Sessions, Requests, and Connections.
             Sessions (columns with "s_" prefix)...
                ...are joined to their Requests (columns with "r_" prefix) 
                ...and Connections (columns with "c_" prefix)',
   @version='14', @revision='1',
   @author='Tim Barry',
   @datecreated='2005-05-09', @datelastchanged='2014-06-17',
   @parameters= '
            [   [ @FastWhere = ] ''BLOCK'' or ''ACTIVE'' or ''SYS'' or ''NONSYS'' ]
            [ , [ @Where = ] ''where clause'' ]
            [ , [ @OrderBy = ] ''order by clause'' ]
            [ , [ @SQLfmt = ] ''TEXT'' or ''GRID'']
            [ , [ @SQLmaxlen = ] ''sql truncation length'' ]
            [ , [ @ShowHeader = ] ''boolean indicator to display header'' ]
            [ , [ @IncludedPlanXML = ] ''boolean indicator to return the query plan XML (valid in GRID mode only)'' ]
            [ , [ @Help = ] ''boolean indicator for help information'' ]
            [ , [ @Debug = ] ''boolean indicator for debug information'' ]

Name        Data Type       Description 
----------- --------------- -------------------------------------------------------------------------------------------------------------------
@FastWhere  varchar(10)     Used for quick filtering of the session types below.  "Overrides" anything supplied to @Where.
                            Null      - Parameter is ignored.
                            "BLOCK"   - Any blocking or blocked session.
                            "ACTIVE"  - Any session with a status IN (RUNNING, RUNNABLE), or, a session with an open transaction.
                            "SYS"     - Sessions belonging to system processes.
                            "NONSYS"  - Sessions belonging to non-system processes.

@Where      nvarchar(1000)  Where clause used to filter rows.  Parameter will not work if @FastWhere is also supplied.
                            For strings values, use a double quote instead of 2 single quotes (i.e.  s_Status IN ("RUNNING","RUNNABLE").

@OrderBy    varchar(500)    Order By clause to order rows.
                            Can combine single or multiple columns.  Use just like any other ORDER BY clause.

@SQLfmt     varchar(10)     Specifies whether to return session SQL, and in what format.
                            Null      - No SQL is returned.
                            "GRID"    - Better for displaying SQL in grid-based results.  SQL is returned in a column.
                            "TEXT"    - Better for displaying SQL in text-based results.  SQL is returned underneath the table of session/requests.

@SQLmaxlen  smallint        Maximum length of characters to display for the both the SQL batch or procedure, as well as the 
                            statement running in the SQL batch or procedure. 
                            Particularly useful in limiting the SQL if the sstatement is the full text of a stored procedure.                          

@ShowHeader bit             When supplied a "0", turns off displaying the header, useful for running sp_who3 in a timed loop.

@IncludePlanXML bit         When supplied a "1", turns on returning the query plan XML in GRID mode. Turn off if query plan retrieval is being blocked.

@Debug      bit             When supplied a "1", returns debug information about the execution.

@Help       char(1)         When supplied a "1", returns help about the procedure.', 
   @example='
EXEC sp_Who3
    @SQLMaxLen = 500
--	 ,@Where = ''s_SessionID IN (15,16,17)''
--	 ,@Where = ''r_WaitType IN ("BROKER_TRANSMITTER","KSOURCE_WAKEUP")''
--	 ,@Where = ''r_WaitTime < 50000''
--	 ,@FastWhere = ''BLOCK''  -- BLOCK, ACTIVE, SYS, NONSYS
--	 ,@OrderBy =''r_DBName, s_Session''
--	 ,@SQLfmt = ''TEXT'' -- TEXT, GRID
--	 ,@ShowHeader = 1
--   ,@IncludePlanXML = 1
--	 ,@Debug = 0',
   @returns='0 - No error.
@@Error - SQLServer specific error.'

RETURN (0)
GO


SET NOCOUNT ON
WHILE 1=1 BEGIN

   IF NOT EXISTS(SELECT * FROM sys.dm_exec_requests WHERE session_id > 50) GOTO Skip

   PRINT ''
   PRINT '--############################################### SampledOn:' + CONVERT(varchar,GETDATE(),121) + '    ServerName:' + @@SERVERNAME
   PRINT '-- sys.dm_os_sys_memory'
   SELECT
   	total_physical_memory_kb, available_physical_memory_kb, available_physical_memory_kb/ CONVERT(float, total_physical_memory_kb) AS available_physical_memory_perc,
   	total_page_file_kb, available_page_file_kb, available_page_file_kb / CONVERT(float, total_page_file_kb) AS available_page_file_perc,
   	system_cache_kb, kernel_paged_pool_kb, kernel_nonpaged_pool_kb, system_high_memory_signal_state, system_low_memory_signal_state, CONVERT(varchar(60), system_memory_state_desc) AS system_memory_state_desc
   FROM sys.dm_os_sys_memory
   PRINT '-- sys.dm_os_process_memory'
   SELECT * FROM sys.dm_os_process_memory
   PRINT '-- sys.dm_exec_query_resource_semaphores'
   SELECT * FROM sys.dm_exec_query_resource_semaphores
   PRINT '-- sys.dm_exec_query_memory_grants'
   SELECT * FROM sys.dm_exec_query_memory_grants MG WHERE EXISTS (SELECT 1 FROM sys.dm_exec_requests R WHERE R.session_id = MG.session_id) ORDER BY granted_memory_kb DESC

   -- To get the Free Space, YOU MUST CONNECT TO INDIVIDUAL DATABASES!
   USE tempdb;
   DECLARE @DatabaseFileSizes TABLE (DataSpaceID int,DataSpaceName sysname NULL,IsDef bit,FileID int,FileNameLog nvarchar(128),DBSize int,Size numeric(19,3),rSize numeric(19,3),Used int, KB numeric(3,3), MB numeric(4,1), GB numeric(7,1), Growth int,FileNamePhys nvarchar(260))
   INSERT INTO @DatabaseFileSizes SELECT DS.data_space_id AS DataSpaceID, DS.name AS DataSpaceName, DS.is_default AS IsDef, File_ID AS FileID, F.Name AS FileNameLog, SUM(size) OVER () AS DBSize, Size, Size*1.0 AS rSize, FILEPROPERTY(F.name,'SpaceUsed') AS Used, .125 AS KB, 128.0 AS MB, 131072.0 AS GB, Growth, Physical_name AS FileNamePhys FROM sys.database_files F LEFT JOIN sys.data_spaces DS ON DS.data_space_id = F.data_space_id

   -- Database as a whole.
   SELECT CAST(DB_NAME() AS varchar(20)) AS DBName
      --, SUM(Size/KB) AS DBSizeKB, SUM(IIF(FileID=2,0,Used)/KB) AS UsedSpaceKB, (SUM(IIF(FileID=2,0,Size)/KB)-SUM(IIF(FileID=2,0,Used)/KB)) AS FreeSpaceKB
      , SUM(Size/MB) AS DBSizeMB, SUM(IIF(FileID=2,0,Used)/MB) AS UsedSpaceMB, (SUM(IIF(FileID=2,0,Size)/MB)-SUM(IIF(FileID=2,0,Used)/MB)) AS FreeSpaceMB
      --, SUM(Size/GB) AS DBSizeGB, SUM(IIF(FileID=2,0,Used)/GB) AS UsedSpaceGB, (SUM(IIF(FileID=2,0,Size)/GB)-SUM(IIF(FileID=2,0,Used)/GB)) AS FreeSpaceGB
   FROM @DatabaseFileSizes 

   EXEC ##sp_Who3
   @SQLMaxLen = 5000
   ,@Where = 's_SessionID > 50'
   --    ,@Where = 'r_WaitType IN ("BROKER_TRANSMITTER","KSOURCE_WAKEUP")'
   --    ,@Where = 'r_WaitTime < 50000'
   ,@FastWhere = 'ACTIVE'  -- BLOCK, ACTIVE, SYS, NONSYS
   --    ,@OrderBy ='r_DBName, s_Session'
   ,@SQLfmt = 'TEXT' -- TEXT, GRID
   --    ,@ShowHeader = 1
   --    ,@Debug = 0
   -- SELECT * FROM sys.dm_exec_sql_text(0x020000000B946E1E96B8B65F23E35A014572E2702A34B2FF0000000000000000000000000000000000000000)
   -- SELECT * FROM sys.dm_exec_query_plan(0x060005003297A80560AB479F0200000001000000000000000000000000000000000000000000000000000000)
   -- SELECT * FROM master.dbo.sysprocesses WHERE spid=000

Skip: 
   WAITFOR DELAY '00:00:30'
END
