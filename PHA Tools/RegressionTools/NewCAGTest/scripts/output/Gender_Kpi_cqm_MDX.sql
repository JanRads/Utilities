
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
     --@datasrc='dbm8-data112\inst02',   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

declare @ThisMonth varchar(7) =cast( datepart(yyyy,getdate())as varchar)+'_01' 
declare @Myquery varchar (max) = '
select 
cast("[Measures].[MeasureKey]"  as varchar(100)) as MeasureKey,
cast("[Measures].[gender_patient]"  as varchar(25)) as GenderDesc
,cast(Round("[Measures].[KPI Score]",2) as money) as KPIScore
 from openquery(FDX_3,'' 

with member MeasureKey as [Monitored KPI].[Measure Key].currentmember.properties("key") 
member gender_patient as [Patients].[Gender].currentmember.properties("name") 
select{gender_patient,MeasureKey,[Measures].[KPI Score]} on 0, 
NONEMPTY(order(except([Monitored KPI].[Measure Key].[all].children,[Monitored KPI].[Measure Key].[all].unknownmember),MeasureKey) *
 [Patients].[Gender].[all].children) on 1 from [CPM]  
where ([Date].[Month Year].&['+ @ThisMonth +'] )'') order by 1,2 '
--select @Myquery
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

 EXEC sp_dropserver 'FDX_3', 'droplogins'