

set nocount on
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
    -- @datasrc=@@servername,   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
	 --@datasrc='dbm8-data112\inst02',
     @catalog='Analytics Cube'      /* default catalog/database */
Go 


--EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

----select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
--select 
--cast("[Patients].[Gender].[Gender].[MEMBER_CAPTION]"  as varchar(25)) as GenderDesc
--,cast(Round("[Measures].[x]",3) as money) as KPIScore

----select * 
--from openquery(FDX_3, '  with member [Measures].[x] as [Measures].[KPI Score]/100  SELECT NON EMPTY { [Measures].x } ON COLUMNS, NON EMPTY {   [Patients].[Gender].[Gender].ALLMEMBERS  }   ON ROWS FROM ( SELECT ( { [Date].[Month Year].&[2014_01] } ) ON COLUMNS FROM [CPM]) WHERE ( [Date].[Month Year].&[2014_01] ) ')
--  --order by "[Measures].[key]"  desc



declare @ThisMonth varchar(7) =cast( datepart(yyyy,getdate())as varchar)+'_01' 
declare @Myquery varchar (max) = 'select cast("[Measures].[gender_patient]" as nvarchar(500)) as Gender
, Round(cast("[Measures].[KPI Score]" as money),2) as KPIScore from openquery(FDX_3,'' 

 with member gender_patient as [Patients].[Gender].currentmember.properties("name")  
 SELECT NON EMPTY {gender_patient, [Measures].[KPI Score]} ON COLUMNS, 
NONEMPTY([Patients].[Gender].[all].children) on 1 from [CPM]where ([Date].[Month Year].&['+@ThisMonth+'])'') order by 1,2'
--select @Myquery
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)
 EXEC sp_dropserver 'FDX_3', 'droplogins'