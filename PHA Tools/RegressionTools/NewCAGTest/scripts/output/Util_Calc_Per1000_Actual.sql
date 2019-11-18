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
 @datasrc= '$(OlapServer)',   /* analysis server name (machine name) */
	---	 @datasrc='dbm8-data112\inst02',   /* analysis server name (machine name) */
	 @catalog='Analytics Cube'      /* default catalog/database */
Go 

declare @ThisYear varchar(7) =cast( datepart(yyyy,getdate())as varchar)
declare @Myquery varchar (max) = 
'with data as (select  *--cast("[Util Measures].[Mes Name].[Mes Name].[MEMBER_CAPTION]" as varchar(100)) as [Desc]
--,cast("[Measures].[result]" as nvarchar(10)) as Result
from openquery(FDX_3,'' WITH 
  MEMBER [Measures].[Calc Adm] AS 
([Util Measures].[Mes Name].&[Admissions], [Measures].[Result])/([Util Measures].[Mes Name].&[Patient count], [Measures].[Result])*1000 
  MEMBER [Measures].[Calc Re] AS 
([Util Measures].[Mes Name].&[readmissions], [Measures].[Result])/([Util Measures].[Mes Name].&[Patient count], [Measures].[Result])*1000 
  MEMBER [Measures].[Calc Amb] AS 
([Util Measures].[Mes Name].&[Outpatient Visits], [Measures].[Result])/([Util Measures].[Mes Name].&[Patient count], [Measures].[Result])*1000 
  MEMBER [Measures].[Calc ED] AS 
([Util Measures].[Mes Name].&[ED Visits], [Measures].[Result])/([Util Measures].[Mes Name].&[Patient count], [Measures].[Result])*1000 
SELECT 
 { 
    [Measures].[Calc Amb], 
    [Measures].[Calc ED], 
    [Measures].[Calc Adm], 
    [Measures].[Calc Re] 
  } ON COLUMNS 
FROM 
      [Utilization]
WHERE ( 
        [Util Dims].[Dims_Hier].[Dim Name].&[Age Groups] 
      ) 

 '')
 )
 -- where cast("[Measures].[x]" as nvarchar(100)) is not null
--order by 1
Select [Desc], Cast (Result as nvarchar(10)) as Result
from (
select  "[Measures].[Calc Amb]" as Result, ''Outpatient Visits per 1,000'' as [Desc]
from data
union
select "[Measures].[Calc ED]", ''ED Visits per 1,000''
from data
union
select "[Measures].[Calc Adm]", ''Admissions per 1,000''
from data
union
select "[Measures].[Calc Re]", ''Readmissions per 1,000''
from data
)T
order by 1
'


EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

 EXEC sp_dropserver 'FDX_3', 'droplogins'


 