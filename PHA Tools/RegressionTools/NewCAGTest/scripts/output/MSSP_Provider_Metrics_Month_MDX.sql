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
   --@datasrc='dbm8-data112\inst02',   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

--declare @ThisYear varchar(7) =cast( datepart(yyyy,getdate())as varchar)
declare @Myquery varchar (max) = 
'select cast("[Measures].[providerKey]" as nvarchar(50)) Care_Provider,cast("[Measures].[msspkey]" as  nvarchar(50) ) msspkey,
--replace(left(right(cast("[Date].[Month Year].[Month Year].[MEMBER_UNIQUE_NAME]" as nvarchar(50)),8),7),''_'','''') + ''01'' as date_YearMonth,
"[Measures].[Measure Member Ind]" as Member, "[Measures].[Measure Population Ind]" as Pop, "[Measures].[MeasureScore]" as Score
from openquery(FDX_3, '' with member providerKey as [Care Providers].[Care Provider].currentmember.properties("key") 
member msspkey as [MSSP  Dim].[MSSP Key].CurrentMember.PROPERTIES("KEY")
--member [msspname] as [MSSP Dim].[MSSP Key].currentmember.properties("name")
SELECT 
  NON EMPTY { 
    providerKey,
	msspkey,
	--[msspname],
    [Measures].[MeasureScore], 
    [Measures].[Measure Population Ind], 
    [Measures].[Measure Member Ind] 
  } ON 0, 
  NON EMPTY { 
    ( 
      [Care Providers].[Care Provider].allmembers *
      except([MSSP  Dim].[MSSP Key].allmembers,[MSSP  Dim].[MSSP Key].[All])
    ) 
  } ON 1 
FROM [MSSP]
 WHERE ([Date].[Month Year].&[2015_02])
 '')
where "[Measures].[Measure Population Ind]" is not null
and "[Measures].[providerKey]" != 0 and "[Measures].[providerKey]" != -2
order by 1,2

'

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

EXEC sp_dropserver 'FDX_3', 'droplogins'



