
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
	 --@datasrc='dbm8-data112\inst01',   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

declare @ThisMonth varchar(7) =cast( datepart(yyyy,getdate())as varchar)+'_01' 

--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
declare @Myquery varchar (max) ='select cast("[Age Groups].[Age Group].[Age Group].[MEMBER_CAPTION]" as varchar(7)) as [AgeGroupDesc],
 cast("[Measures].[MeasureKey]" as varchar(100)) as MeasureKey,
  cast("[Monitored KPI].[Measure Key].[Measure Key].[MEMBER_CAPTION]" as varchar(100)) as MeasureName,

cast(round("[Measures].[KPI Score]",3) as money) as KPIScore 

--select * 
from openquery(FDX_3, ''with   member MeasureKey as [Monitored KPI].[Measure Key].currentmember.properties("key")   SELECT NON EMPTY { MeasureKey,[Measures].[KPI Score] } ON COLUMNS, NON EMPTY filter({ ([Age Groups].[Age Group].[Age Group].ALLMEMBERS * [Monitored KPI].[Measure Key].[Measure Key].ALLMEMBERS ) },[Measures].[Denominator]>0)  ON ROWS FROM ( SELECT ( { [Date].[Month Year].&[' + @ThisMonth +'] } ) ON COLUMNS FROM [CPM]) WHERE ( [Date].[Month Year].&['+@ThisMonth+'] ,  [Programs].[Id Programs].&[1]  )'')
order by 1,2 '

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'
exec(@Myquery)
 EXEC sp_dropserver 'FDX_3', 'droplogins'



