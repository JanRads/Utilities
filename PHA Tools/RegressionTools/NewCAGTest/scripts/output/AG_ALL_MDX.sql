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
  --   @datasrc='dbm8-data112\inst02',   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 
declare @ThisMonth varchar(7) =cast( datepart(yyyy,getdate())as varchar)+'_01' 

--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
declare @Myquery varchar (max) ='select cast("[Age Groups].[Age Group].[Age Group].[MEMBER_CAPTION]" as varchar(7)) as [AgeGroupDesc],
cast(round("[Measures].[x]",3) as money)  as KPIScore
from openquery(FDX_3, ''with member [Measures].[x] as [Measures].[KPI Score]
  SELECT NON EMPTY { [Measures].[x] } ON COLUMNS, 
  NON EMPTY { (except([Age Groups].[Age Group].[all].children,{[Age Groups].[Age Group].&[-2]}) ) }  ON ROWS 
  FROM [CPM]
  where ([Date].[Month Year].&['+@ThisMonth + '])  '')
order by 1'



EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'
exec(@Myquery)
 EXEC sp_dropserver 'FDX_3', 'droplogins'



