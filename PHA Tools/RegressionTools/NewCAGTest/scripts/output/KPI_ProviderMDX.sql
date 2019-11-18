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
	-- @datasrc='dbm8-data112\inst01',   /* analysis server name (machine name) $(OlapServer)*/
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

declare @ThisMonth varchar(7) =cast( datepart(yyyy,getdate())as varchar)+'_01' 
declare @Myquery varchar (max) = 'select cast("[Measures].[MeasureKey]" as int) as MeasureKey,
  cast("[Measures].[providerKey]" as int) as [provider_Related],
  cast(Round("[Measures].[KPI Score]",3) as money) as KPIScore
   from openquery(FDX_3,'' 
with member MeasureKey as [Monitored KPI].[Measure Key].currentmember.properties("key") 
member MeasureName as [Monitored KPI].[Measure Key].currentmember.properties("name") 
member providerKey as [Primary Care Provider].[Care Provider].currentmember.properties("key") 
select{ providerKey, MeasureKey,Measurename,[Measures].[KPI Score],[Measures].[Numerator],[Measures].[Denominator]} on 0, 
NONEMPTY(order(except([Monitored KPI].[Measure Key].[all].children,[Monitored KPI].[Measure Key].[all].unknownmember),MeasureKey)
* [Primary Care Provider].[Care Provider].[all].children) on 1 from [CPM]  
where ([Date].[Month Year].&['+@ThisMonth+'])'') order by 1,2'
--select @Myquery
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

EXEC sp_dropserver 'FDX_3', 'droplogins'
