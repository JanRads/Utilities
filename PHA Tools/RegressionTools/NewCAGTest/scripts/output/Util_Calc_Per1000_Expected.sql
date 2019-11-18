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
---	@datasrc='dbm8-data112\inst02',   /* analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

declare @ThisYear varchar(7) =cast( datepart(yyyy,getdate())as varchar)
declare @Myquery varchar (max) = 
'select  cast("[Util Measures].[Mes Name].[Mes Name].[MEMBER_CAPTION]" as varchar(100)) as [Desc]
,cast("[Measures].[result]" as nvarchar(10)) as Result
from openquery(FDX_3,'' SELECT 
   { 
    [Measures].[Result] 
  } ON COLUMNS, 
{ 
    ( 
      [Util Measures].[Mes Name].[Mes Name].allmembers 
    ) 
  } DIMENSION PROPERTIES member_caption, member_unique_name ON ROWS 
FROM ( SELECT 
       ( 
         { 
           [Util Measures].[Mes Name].&[Admissions per 1,000], 
           [Util Measures].[Mes Name].&[Readmissions per 1,000], 
           [Util Measures].[Mes Name].&[ED Visits per 1,000], 
           [Util Measures].[Mes Name].&[Outpatient Visits per 1,000] 
         } 
       ) ON COLUMNS 
    
          FROM [Utilization])
WHERE ( 
        [Util Dims].[Dims_Hier].[Dim Name].&[Age Groups] 
      ) 

 '')
 -- where cast("[Measures].[x]" as nvarchar(100)) is not null
order by 1'


EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

 EXEC sp_dropserver 'FDX_3', 'droplogins'


 