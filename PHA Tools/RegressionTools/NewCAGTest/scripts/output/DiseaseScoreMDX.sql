SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET NOCOUNT ON
if  exists(select * from sys.servers where name = N'FDX_3')
EXEC sp_dropserver 'FDX_3', 'droplogins'


EXEC sp_addlinkedserver
     @server='FDX_3',   /* local SQL name given to the 
                                 linked server */
     @srvproduct='',          /* not used */
     @provider='MSOLAP',      /* OLE DB provider */
     @datasrc=@@servername,   /* analysis server name (machine name) $(OlapServer)*/
	 --@datasrc='dbm8-data111\inst01',   /* analysis server name (machine name) $(OlapServer)*/
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

declare @ThisMonth varchar(7) =cast( datepart(yyyy,getdate())as varchar)+'_01'

declare @Myquery varchar (max) = 'select cast("[Measures].[MeasureKey]" as int) as MeasureLevel2Key, 
cast("[Measures].[MeasureName]" as nvarchar(500)) as MeasureLevel2Desc, 
CAST(round(("[Measures].[KPI Score]" ),0,0) AS INT)  as KPIScore  , 
cast(FLOOR("[Measures].[numerator]") as INT) Numerator , cast(floor("[Measures].[Denominator]") 
as INT) as Denominator from openquery(FDX_3,'' with member MeasureKey
 as [Monitored KPI].[Measure Level2 Key].currentmember.properties("key") member MeasureName
  as [Monitored KPI].[Measure Level2 Key].currentmember.properties("name") 
  select{MeasureKey,Measurename,[Measures].[KPI Score] ,[Measures].[Denominator]
   ,[Measures].[numerator]  } on 0, 
  [Monitored KPI].[Measure Level2 Key].[All].children
    on 1 from [CPM]

    where ([Date].[Month Year].&['+@ThisMonth+'])'') where cast("[Measures].[MeasureKey]" as int) is not null
	order by 1,2
	'
--select @Myquery
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

EXEC sp_dropserver 'FDX_3', 'droplogins'