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
--	@datasrc=@@Servername,   /* analysis server name (machine name) $(OlapServer)*/
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

declare @ThisMonth varchar(7) =cast( datepart(yyyy,getdate())as varchar)+'_01' 
declare @Myquery varchar (max) = 'select cast("[Measures].[MeasureName2]" as nvarchar(500)) as MeasureLevel2Desc
,cast("[Measures].[OrgKey]" as nvarchar(500)) as org_RelatedProvider
, cast(Round("[Measures].[KPI Score]",2) as money) as KPIScore from openquery(FDX_3,'' 

with member MeasureKey2 as [Monitored KPI].[Measure Level2 Key].currentmember.properties("key") 
member MeasureName2 as [Monitored KPI].[Measure Level2 Key].currentmember.properties("name") 
member OrgKey as [Organization].[Organization Key].currentmember.properties("key") 
select{OrgKey,MeasureKey2,MeasureName2,[Measures].[KPI Score],[Measures].[Numerator],[Measures].[Denominator]} on 0, 
NONEMPTY(order(except([Monitored KPI].[Measure Level2 Key].[all].children,[Monitored KPI].[Measure Level2 Key].[all].unknownmember),MeasureKey2)
* [Organization].[Organization Key].[all].children) on 1 from [CPM]  
where ([Date].[Month Year].&['+@ThisMonth+'])'') where cast("[Measures].[OrgKey]" as nvarchar(500)) <>-2 order by 1,cast(cast("[Measures].[OrgKey]" as nvarchar(500)) as int) '
--select @Myquery
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

EXEC sp_dropserver 'FDX_3', 'droplogins'
