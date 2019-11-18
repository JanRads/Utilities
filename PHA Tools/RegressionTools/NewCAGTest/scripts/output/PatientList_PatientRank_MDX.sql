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
   --  @datasrc='dbm8-data112\inst02',      /* analysis server name (machine name) */
	 @datasrc=@@SERVERNAME,      /* analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

declare @ThisMonth varchar(7) =cast( datepart(yyyy,getdate())as varchar)+'_01' 

--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
declare @Myquery varchar (max) ='select cast("[Patients].[Patient Key].[Patient Key].[MEMBER_CAPTION]" as varchar(100)) as Patient,
cast("[Measures].[TotalPatientRank]" as money) as TotalPatientRank

from openquery(FDX_3, ''SELECT NON EMPTY { [Measures].[TotalPatientRank] } ON COLUMNS, NON EMPTY { ([Patients].[Patient Key].[Patient Key].ALLMEMBERS ) }  ON ROWS FROM ( SELECT ( { [Date].[Month Year].&['+@ThisMonth+'] } ) ON COLUMNS FROM [CPM]) WHERE ( [Date].[Month Year].&['+@ThisMonth+'] ) '')
order by 1 desc'


EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'
exec(@Myquery)
 EXEC sp_dropserver 'FDX_3', 'droplogins'