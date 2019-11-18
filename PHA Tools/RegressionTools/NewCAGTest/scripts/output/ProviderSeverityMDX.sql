---NEW TEST 117
SET NOCOUNT ON
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
if  exists(select * from sys.servers where name = N'FDX_3')
EXEC sp_dropserver 'FDX_3', 'droplogins'


EXEC sp_addlinkedserver
     @server='FDX_3',   /* local SQL name given to the 
                                 linked server */
     @srvproduct='',          /* not used */
     @provider='MSOLAP',      /* OLE DB provider */
     @datasrc='$(OlapServer)',   /* analysis server name (machine name) */
   --  @datasrc='dbm8-data112\inst02',   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */

GO

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname = N'FDX_3'
       ,@useself = N'False'

DECLARE @ThisMonth VARCHAR(7) = cast(datepart(yyyy, getdate()) AS VARCHAR) + '_01'
declare @ThisYear varchar(7) =cast( datepart(yyyy,getdate())as varchar)
declare @Myquery varchar (max) = 
'select 
cast("[Primary Care Provider].[Care Provider].[Care Provider].[MEMBER_CAPTION]" as varchar(100)) as Provider,
cast("[Severity Combs].[Severity].[Severity_type].[MEMBER_CAPTION]" as varchar(100)) as Severity_type,
cast(convert(FLOAT,"[Measures].[Severity_Score]") AS DECIMAL(6, 4)) as Severity_Score

from openquery(FDX_3, ''

SELECT NON EMPTY { [Measures].[Severity_Score]   } ON COLUMNS, 
  NON EMPTY { (filter([Primary Care Provider].[Care Provider].[Care Provider].ALLMEMBERS,(   [Severity Combs].[Severity].[All] ,[Measures].[Community]  ) >0) )  } *
  [Severity Combs].[Severity].[Severity_type].allmembers
  ON ROWS FROM [CPM] where ([Date].[Month Year].&[' + @ThisMonth + ']    )   

'') order by 1,2
'

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname = N'FDX_3'
       ,@useself = N'False'

EXEC (@Myquery)

EXEC sp_dropserver 'FDX_3'
       ,'droplogins'




-------------------------old test----------
--SET ANSI_NULLS ON
--GO

--SET QUOTED_IDENTIFIER ON
--GO

--IF EXISTS (
--		SELECT *
--		FROM sys.servers
--		WHERE NAME = N'FDX_3'
--		)
--	EXEC sp_dropserver 'FDX_3'
--		,'droplogins'

--EXEC sp_addlinkedserver @server = 'FDX_3'
--	,/* local SQL name given to the 
--                                 linked server */
--	@srvproduct = ''
--	,/* not used */
--	@provider = 'MSOLAP'
--	,/* OLE DB provider */
--	--@datasrc='dbm8-data112\inst02',      /* analysis server name (machine name) */
--	@datasrc = @@SERVERNAME
--	,/* analysis server name (machine name) */
--	@catalog = 'Analytics Cube' /* default catalog/database */
--GO

--EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname = N'FDX_3'
--	,@useself = N'False'

--DECLARE @ThisMonth VARCHAR(7) = cast(datepart(yyyy, getdate()) AS VARCHAR) + '_01'
----select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
--DECLARE @Myquery VARCHAR(max) = 'select 
--cast("[Primary Care Provider].[Care Provider].[Care Provider].[MEMBER_CAPTION]" as varchar(100)) as Provider,
--cast("[Severity Combs].[Severity].[Severity_type].[MEMBER_CAPTION]" as varchar(100)) as Severity_type,
--cast(convert(FLOAT,"[Measures].[Severity_Score]") AS DECIMAL(6, 4)) as Severity_Score

--from openquery(FDX_3, ''
--SELECT NON EMPTY { [Measures].[Severity_Score_org], [Measures].[Severity_Score] } ON COLUMNS, 
--  NON EMPTY { (filter([Primary Care Provider].[Care Provider].[Care Provider].ALLMEMBERS,[Measures].[Severity_Score_org]>0) )  } *
--  [Severity Combs].[Severity].[Severity_type].allmembers
-- DIMENSION PROPERTIES MEMBER_CAPTION, MEMBER_UNIQUE_NAME ON ROWS FROM ( SELECT ( { [Date].[Month Year].&[' + @ThisMonth + '] } ) 
-- ON COLUMNS FROM [CPM]) WHERE ( [Date].[Month Year].&[' + @ThisMonth + '] )
--  CELL PROPERTIES VALUE, BACK_COLOR, FORE_COLOR, FORMATTED_VALUE, FORMAT_STRING, FONT_NAME, FONT_SIZE, FONT_FLAGS
--'')
--order by 1,2'

--EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname = N'FDX_3'
--	,@useself = N'False'

--EXEC (@Myquery)

--EXEC sp_dropserver 'FDX_3'
--	,'droplogins'

