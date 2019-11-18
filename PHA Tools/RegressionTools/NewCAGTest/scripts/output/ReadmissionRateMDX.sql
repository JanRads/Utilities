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
     @datasrc=@@SERVERNAME	,      /* analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
select cast("[Date Discharge Index Adm].[Month Year].[Month Year].[MEMBER_CAPTION]" as varchar(6)) as Year_Month,
cast("[Measures].[Count Index Adm]" as int) as mesure_IndexAdmissionInd,
cast("[Measures].[Count Readmissions]" as int) as measure_ReadmissionInd,
left(cast(isnull(cast("[Measures].[Score]" as money),0) as varchar),4) as mesure_ReadmissionRate
from openquery(FDX_3, 'select {[Measures].[Count Index Adm],[Measures].[Score],[Measures].[Count Readmissions]} on 0, non empty [Date Discharge Index Adm].[Month Year].[All].children on 1 from(
  SELECT ( { [Generic Measures].[CalcName].&[5] } ) ON COLUMNS
  FROM [Readmissions]
)
WHERE ( [Generic Measures].[CalcName].&[5] )')

 EXEC sp_dropserver 'FDX_3', 'droplogins'