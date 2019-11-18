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
  -- @datasrc='dbm8-data111\inst03',   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

declare @ThisYear varchar(7) =cast( datepart(yyyy,getdate())as varchar)
declare @Myquery varchar (max) = 
'select 
cast("[Measures].[providerKey]" as nvarchar(50)) as Care_Provider,
replace(left(right(cast("[Date].[Month Year].[Month Year].[MEMBER_CAPTION]" as nvarchar(50)),8),7),''_'','''')  as YearMonth,
cast("[Measures].[Measure Member Ind]" as int) as Member,
cast("[Measures].[Measure Population Ind]" as int) as Pop,
cast("[Measures].[MeasureScore]" AS FLOAT) as Score

from openquery(FDX_3, ''
 
  with member providerKey as [Care Providers].[Care Provider].currentmember.properties("key")
 SELECT NON EMPTY { ProviderKEY,[Measures].[MeasureScore], [Measures].[Measure Population Ind], 
 [Measures].[Measure Member Ind] } 
 ON COLUMNS, NON EMPTY { FILTER(([Care Providers].[Care Provider].[Care Provider].ALLMEMBERS * 
 [Date].[Month Year].[Month Year].ALLMEMBERS ),[Measures].[Measure Population Ind]>=0) }
  ON ROWS FROM ( SELECT ( -{ [Care Providers].[Care Provider].&[-2] } ) ON COLUMNS
   FROM ( SELECT ( { [Organization].[Level3].&[-3] } ) ON COLUMNS 
   FROM ( SELECT ( { [MSSP  Dim].[MSSP Key].&[1] } ) ON COLUMNS 
   FROM [MSSP]))) WHERE ( [MSSP  Dim].[MSSP Key].&[1], [Organization].[Level3].&[-3] )  
 '')
 where "[Measures].[Measure Population Ind]" is not null
and "[Measures].[providerKey]" != 0 and "[Measures].[providerKey]" != -2
order by 1,2
'

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

EXEC sp_dropserver 'FDX_3', 'droplogins'



