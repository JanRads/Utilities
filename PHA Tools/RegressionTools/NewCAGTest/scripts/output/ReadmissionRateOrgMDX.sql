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
     @datasrc='$(OlapServer)',      /* analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
select cast("[Org Assgned Index Adm].[Level3].[Level3].[MEMBER_CAPTION]" as varchar(15)) as OrgLevel3,
cast("[Measures].[Count Index Adm]" as int) as mesure_IndexAdmissionInd,
cast("[Measures].[Count Readmissions]" as int) as measure_ReadmissionInd,
left(cast(cast("[Measures].[Readmissions Rate]" as money) as varchar),4) as mesure_ReadmissionRate
from openquery(FDX_3, 'with member orgname as [Org Assgned Index Adm].[Level3].properties("name") select {[Measures].[Count Index Adm],[Measures].[Count Readmissions],[Measures].[Readmissions Rate]} on 0, non empty order([Org Assgned Index Adm].[Level3].[All].children,orgname) on 1 from [Readmissions]')
EXEC sp_dropserver 'FDX_3', 'droplogins'