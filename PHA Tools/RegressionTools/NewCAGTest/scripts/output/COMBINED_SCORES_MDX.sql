
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
	 @datasrc='$(OlapServer)',   /* analysis server name (machine name)   */
     --@datasrc='dbm8-data112\inst03',   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 


EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
select cast("[Date].[Month Year].[Month Year].[MEMBER_CAPTION]" as varchar(7)) as Year_Month,
cast("[Measures].[patients counted in the combined score Count]" as int) as combined_score,
cast("[Measures].[patients counted in community of the org] " as int) as comunity_score 

--select * 
from openquery(FDX_3, ' select {[Measures].[patients counted in the combined score Count]   ,  [Measures].[patients counted in community of the org]   } on columns , 
 non empty {[Date].[Month Year].[all].children} on rows 

 from [CPM]
  ')
  --order by "[Measures].[key]"  desc

 EXEC sp_dropserver 'FDX_3', 'droplogins'