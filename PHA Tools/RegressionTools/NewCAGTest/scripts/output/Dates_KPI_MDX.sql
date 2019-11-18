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
	--@datasrc=@@SERVERNAME,   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

declare @ThisYear varchar(7) =cast( datepart(yyyy,getdate())as varchar)
declare @Myquery varchar (max) = 
'select cast("[Monitored KPI].[Measure Key].[Measure Key].[MEMBER_CAPTION]" as nvarchar(100)) as MeasureName,
cast("[Measures].[MeasureKey]" as nvarchar(4)) as MeasureKey,
cast("[Date].[Dates].[Month Year].[MEMBER_CAPTION]" as varchar(10)) as Date,
cast(round("[Measures].[x]",3) as money) as KPIScore 
from openquery(FDX_3,'' with member [Measures].[x] as [Measures].[KPI Score]
member MeasureKey as [Monitored KPI].[Measure Key].currentmember.properties("key") 
  SELECT NON EMPTY {MeasureKey,  [Measures].[x] } ON COLUMNS, 
  NON EMPTY {[Monitored KPI].[Measure Key].children * [Date].[Dates].[Month Year]  }  ON ROWS 
  FROM [CPM]
  where ([Date].[Year].&['+@ThisYear+'])'')
  where cast("[Measures].[x]" as nvarchar(100)) is not null
order by 1,2,3'


EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

 EXEC sp_dropserver 'FDX_3', 'droplogins'



