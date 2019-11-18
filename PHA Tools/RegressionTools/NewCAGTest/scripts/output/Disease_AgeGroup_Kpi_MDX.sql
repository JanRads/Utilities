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
Go 
declare @ThisMonth varchar(7) =cast( datepart(yyyy,getdate())as varchar)+'_01' 

--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
declare @Myquery varchar (max) ='select MeasureLevel2Desc,AgeGroupDesc,left(cast(cast(KPIScore as  float) as nvarchar(100)),4) as KPIScore
from (select  cast("[Monitored KPI].[Measure Level2 Key].[Measure Level2 Key].[MEMBER_CAPTION]" as varchar(100)) as MeasureLevel2Desc,
cast("[Age Groups].[Age Group].[Age Group].[MEMBER_CAPTION]" as varchar(7)) as [AgeGroupDesc],
"[Measures].[x]" as KPIScore 

--select * 
from openquery(FDX_3, '' with member [Measures].[x] as [Measures].[KPI Score]
  SELECT NON EMPTY { [Measures].[x] } ON COLUMNS, 
  NON EMPTY { (except([Age Groups].[Age Group].[all].children,{[Age Groups].[Age Group].&[-2]}) * [Monitored KPI].[Measure Level2 Key].[all].children ) }  ON ROWS 
  FROM [CPM]
  where ([Date].[Month Year].&[' + @ThisMonth +']) '')) a 
order by 1,2 '

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'
exec(@Myquery)
EXEC sp_dropserver 'FDX_3', 'droplogins'
