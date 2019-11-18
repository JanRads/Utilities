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

declare @ThisYear varchar(7) =cast( datepart(yyyy,getdate())as varchar)
declare @Myquery varchar (max) = 
'select replace(replace(cast("[MSSP  Dim].[MSSP Key].[MSSP Key].[MEMBER_UNIQUE_NAME]" as nvarchar(50)),''[MSSP  Dim].[MSSP Key].&['',''''),'']'','''') as MSSP_Id , 
Cast("[Measures].[OrgKey]" as nvarchar(50)) OrganizationKey,
replace(left(right(cast("[Date].[Month Year].[Month Year].[MEMBER_UNIQUE_NAME]" as nvarchar(50)),8),7),''_'','''') + ''01'' as date_YearMonth,
"[Measures].[Measure Member Ind]" as Member, "[Measures].[Measure Population Ind]" as Pop, Cast("[Measures].[MeasureScore]" as Float(24)) as Score
from openquery(FDX_3, ''with member OrgKey as [Organization].[Organization Key].currentmember.properties("key")  
SELECT 
  NON EMPTY { 
    OrgKey,
    [Measures].[MeasureScore], 
    [Measures].[Measure Population Ind], 
    [Measures].[Measure Member Ind]

  } ON COLUMNS, 
  NON EMPTY { 
    ( 
       [Organization].[Organization Key].[all].children * 
      [Date].[Month Year].[Month Year].allmembers *
	 except([MSSP  Dim].[MSSP Key].allmembers, [MSSP  Dim].[MSSP Key].[ALL])
    ) 
  } HAVING NOT IsEmpty ([Measures].[MeasureScore]) DIMENSION PROPERTIES member_caption, member_unique_name ON ROWS 
FROM [MSSP]  Where ([Care Providers].[Care Provider].&[-2])'')
 --WHERE ( [MSSP  Dim].[MSSP Key].&[1] )
where "[Measures].[Measure Population Ind]" is not null
--and "[Measures].[providerKey]" != 0
and "[Measures].[OrgKey]" >= -1
order by 1,2,3
'

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)
--select @Myquery
EXEC sp_dropserver 'FDX_3', 'droplogins'



