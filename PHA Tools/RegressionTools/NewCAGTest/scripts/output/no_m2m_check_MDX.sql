
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
   --   @datasrc='dbm8-data111\inst03',   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 


EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

select cast("[Date].[Month Year].[Month Year].[MEMBER_CAPTION]" as varchar(7)) as Year_Month,
cast("[Measures].[NumeratorPrediction]" as int) as no_m2m_numerator,
cast("[Measures].[Denominator Prediction]" as int) as no_m2m_denominator 

--select * 
from openquery(FDX_3, ' 
WITH MEMBER [Measures].[key] AS [Date].[Month Year].currentmember.properties("key") 
SELECT NON EMPTY { [Measures].[NumeratorPrediction], [Measures].[Denominator Prediction]  , [Measures].[key] } ON COLUMNS,
  NON EMPTY filter ( ([Date].[Month Year].[Month Year].MEMBERS )  ,  [Measures].[Denominator Prediction] >0)  ON ROWS 
  FROM [CPM]
 ')
  order by "[Measures].[key]"  desc

 EXEC sp_dropserver 'FDX_3', 'droplogins'



