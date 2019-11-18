set nocount on
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
	 @datasrc='$(OlapServer)',   /* analysis server name (machine name) $(OlapServer)  */
     --@datasrc='dbm8-data112\inst01',   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 


declare @ThisMonth varchar(7) =cast( datepart(yyyy,getdate())as varchar)+'_01'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
declare @Myquery varchar (max) = 'select cast("[Monitored KPI].[Measure Level2 Key].[Measure Level2 Key].[MEMBER_CAPTION]" as varchar(25)) as MeasureLevel2Desc,
cast("[Patients].[Gender].[Gender].[MEMBER_CAPTION]"  as varchar(25)) as GenderDesc
,cast(Round("[Measures].[x]",2) as money) as KPIScore

--select * 
from openquery(FDX_3, '' with member [Measures].[x] as [Measures].[KPI Score]/100  SELECT NON EMPTY { [Measures].x } ON COLUMNS, NON EMPTY { ([Monitored KPI].[Measure Level2 Key].[Measure Level2 Key].ALLMEMBERS * [Patients].[Gender].[Gender].ALLMEMBERS ) }   ON ROWS FROM ( SELECT ( {[Date].[Month Year].&['+@ThisMonth+'] } ) ON COLUMNS FROM [CPM])
where ([Date].[Month Year].&['+@ThisMonth+'])'') 

  --order by "[Measures].[key]"  desc
  order by 1,2'

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

EXEC sp_dropserver 'FDX_3', 'droplogins'