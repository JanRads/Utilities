
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
     @catalog='Analytics Cube'      /* default catalog/database */
Go 


EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
select cast("[Date Discharge Index Adm].[Month Year].[Month Year].[MEMBER_CAPTION]" as varchar(6)) as Year_Month,
cast("[Measures].[Numerator]" as int) as FUV_out_numerator,
cast("[Measures].[Denominator]" as int) as FUV_out_denumerator,
cast("[Measures].[score]" as decimal (5, 2)  ) as FUV_out_score
--select * 
from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[Numerator], [Measures].[Score], [Measures].[Denominator] } ON COLUMNS, NON EMPTY { filter([Date Discharge Index Adm].[Month Year].[Month Year].ALLMEMBERS  , ([Measures].[Numerator]+ [Measures].[Denominator]) > 0 ) } ON ROWS FROM ( SELECT ( { [Generic Measures].[CalcName].&[20] } ) ON COLUMNS FROM [Readmissions]) WHERE ( [Generic Measures].[CalcName].&[20] ) ')
 EXEC sp_dropserver 'FDX_3', 'droplogins'



