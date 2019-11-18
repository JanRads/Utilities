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


declare @Myquery varchar (max) = 
'
select 
cast("[MSSP  Dim].[MSSP Key].[MSSP Key].[MEMBER_CAPTION]" as nvarchar(50)) as MeasureName,
cast("[Date].[Month Year].[Month Year].[MEMBER_CAPTION]" as nvarchar(50)) as MonthYear,
cast("[Measures].[Measure Member Ind]" as int) as Member,
cast("[Measures].[Measure Population Ind]" as int) as Pop,
cast("[Measures].[MeasureScore]" AS FLOAT) as Score

from openquery
(FDX_3, ''

 SELECT NON EMPTY { [Measures].[MeasureScore], [Measures].[Measure Population Ind], 
 [Measures].[Measure Member Ind] } ON COLUMNS, NON EMPTY 
 { ([MSSP  Dim].[MSSP Key].[MSSP Key].ALLMEMBERS * [Date].[Month Year].[Month Year].ALLMEMBERS ) }
 ON ROWS FROM ( SELECT ( { [Date].[Year].&[2015] } ) ON COLUMNS 
 FROM ( SELECT ( { [Care Providers].[Care Provider].&[-2] } ) ON COLUMNS 
 FROM ( SELECT ( { [Organization].[Level3].&[-3] } ) ON COLUMNS 
 FROM ( SELECT ( { [MSSP  Dim].[MSSP Key].[All] } ) ON COLUMNS 
 FROM [MSSP])))) WHERE ( [Organization].[Level3].&[-3], [Care Providers].[Care Provider].&[-2],
  [Date].[Year].&[2015] ) 

  '')
--order by 1,2

'

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

EXEC sp_dropserver 'FDX_3', 'droplogins'