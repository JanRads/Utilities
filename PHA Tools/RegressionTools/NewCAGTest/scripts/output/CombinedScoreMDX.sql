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
     @datasrc='$(OlapServer)',   /* analysis server name (machine name) $(OlapServer)*/
	 --@datasrc='dbm8-data112\inst03',   /* analysis server name (machine name) $(OlapServer)*/
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

declare @ThisMonth varchar(7) =cast( datepart(yyyy,getdate())as varchar)+'_01'
declare @Myquery varchar (max) = 'select cast("[Measures].[MeasureKey]" as int) as MeasureLevel1Key, cast("[Measures].[MeasureName]" as nvarchar(500)) as MeasureLevel1Desc, Round(cast("[Measures].[KPI Score]" as money),3) as KPIScore from openquery(FDX_3,'' with member MeasureKey as [Monitored KPI].[Measure Level1 Key].currentmember.properties("key") member MeasureName as [Monitored KPI].[Measure Level1 Key].currentmember.properties("name") select{MeasureKey,Measurename,[Measures].[KPI Score]} on 0, order(except([Monitored KPI].[Measure Level1 Key].[all].children,[Monitored KPI].[Measure Level1 Key].[all].unknownmember),MeasureKey) on 1 from [CPM] where ([Date].[Month Year].&['+@ThisMonth+'])'') '
--select @Myquery
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

EXEC sp_dropserver 'FDX_3', 'droplogins'
