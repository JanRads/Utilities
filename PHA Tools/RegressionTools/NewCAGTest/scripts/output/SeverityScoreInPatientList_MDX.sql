--Test 199  SQL
--   SeverityScoreInPatientList_MDX.sql

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
    -- @datasrc='dbm8-data112\inst02',   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

declare @ThisMonth varchar(7) =cast( datepart(yyyy,getdate())as varchar)+'_01' 
declare @Myquery varchar (max) = '
select 
 cast("[Patients].[Patient Key].[Patient Key].[MEMBER_CAPTION]" as nvarchar(100)) as PatientsKey
 ,cast("[Measures].[severity id]"  as varchar(25)) as Severity_id

 from openquery(FDX_3,'' 
select [Measures].[severity id]   on columns , 
non empty (filter(
[Patients].[Patient Key].[all].children,
  [Measures].[Denominator]>0.0 ))
ON ROWS
from [CPM]
where ([Date].[Month Year].&['+ @ThisMonth +'] )'') order by 1 '
--select @Myquery
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

 EXEC sp_dropserver 'FDX_3', 'droplogins'