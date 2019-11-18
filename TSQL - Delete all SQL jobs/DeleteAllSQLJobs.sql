USE msdb
GO

IF OBJECT_ID('tempdb..#JobName') IS NOT NULL
	DROP TABLE #JobName

;WITH Exclude_Jobs (JobName) AS
	(
	SELECT '' AS JobName
	)

SELECT name AS JobName
INTO #JobName
FROM msdb..sysjobs sj
where name not like 'sys%'
and not exists
	(
	select 1
	from Exclude_Jobs e
	where e.JobName = sj.name
	)

DECLARE @JobName AS NVARCHAR(255)
DECLARE JOB_cursor CURSOR FOR  
SELECT JobName
FROM #JobName

OPEN JOB_cursor

FETCH NEXT FROM JOB_cursor   
INTO @JobName

WHILE @@FETCH_STATUS = 0  
BEGIN
	EXECUTE sp_delete_job @job_name = @JobName
	PRINT 'Deleteing job ' + @JobName
	FETCH NEXT FROM JOB_cursor   
	INTO @JobName
END

CLOSE JOB_cursor;  
DEALLOCATE JOB_cursor; 


