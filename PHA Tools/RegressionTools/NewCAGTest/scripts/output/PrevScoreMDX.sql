--MDX Regression test

--Generic Measures for Inpatients

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
     --@datasrc='dbm8-data112\inst01',
	 @datasrc='$(OlapServer)',   /* analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 


EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'
select [Desc],round([Prev Score],3) as [Prev Score]
--, CAST(case when CHARINDEX('.',[Prev Score],1)>0 then left( [Prev Score],CHARINDEX('.',[Prev Score],1) +2) else [Prev Score] end AS varchar(100)) as [Prev Score]  
from (

--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
select 'Admissions' as [Desc],
"[Measures].[Prev Score]" as [Prev Score]
--select * 
from openquery(FDX_3, 'SELECT NON EMPTY
{  [Measures].[Prev Score] } ON COLUMNS
FROM (
  SELECT ( { [Generic Measures].[CalcName].&[3] } ) ON COLUMNS
  FROM (
    SELECT ( { [Generic Measures].[In Out Desc].&[Inpatient] } ) ON COLUMNS
    FROM (
      SELECT ( { [Date Discharge Index Adm].[Year].&[2014] } ) ON COLUMNS
      FROM [Readmissions]
    )
  )
)
WHERE ( [Date Discharge Index Adm].[Year].&[2014],
[Generic Measures].[In Out Desc].&[Inpatient],
[Generic Measures].[CalcName].&[3] ) ')



union
select 'AVG LOS' as [Desc],
"[Measures].[Prev Score]" as [Prev Score]
--select * 
from openquery(FDX_3, 'SELECT NON EMPTY
{  [Measures].[Prev Score] } ON COLUMNS
FROM (
  SELECT ( { [Generic Measures].[CalcName].&[4] } ) ON COLUMNS
  FROM (
    SELECT ( { [Generic Measures].[In Out Desc].&[Inpatient] } ) ON COLUMNS
    FROM (
      SELECT ( { [Date Discharge Index Adm].[Year].&[2014] } ) ON COLUMNS
      FROM [Readmissions]
    )
  )
)
WHERE ( [Date Discharge Index Adm].[Year].&[2014],
[Generic Measures].[In Out Desc].&[Inpatient],
[Generic Measures].[CalcName].&[4] ) ')

union
select 'ReAdm Rate' as [Desc],

"[Measures].[Prev Score]" as [Prev Score]
--select * 
from openquery(FDX_3, 'SELECT NON EMPTY
{  [Measures].[Prev Score] } ON COLUMNS
FROM (
  SELECT ( { [Generic Measures].[CalcName].&[5] } ) ON COLUMNS
  FROM (
    SELECT ( { [Generic Measures].[In Out Desc].&[Inpatient] } ) ON COLUMNS
    FROM (
      SELECT ( { [Date Discharge Index Adm].[Year].&[2014] } ) ON COLUMNS
      FROM [Readmissions]
    )
  )
)
WHERE ( [Date Discharge Index Adm].[Year].&[2014],
[Generic Measures].[In Out Desc].&[Inpatient],
[Generic Measures].[CalcName].&[5] ) ')

union
select '# ReAdm'as [Desc],

"[Measures].[Prev Score]" as [Prev Score]
--select * 
from openquery(FDX_3, 'SELECT NON EMPTY
{  [Measures].[Prev Score] } ON COLUMNS
FROM (
  SELECT ( { [Generic Measures].[CalcName].&[6] } ) ON COLUMNS
  FROM (
    SELECT ( { [Generic Measures].[In Out Desc].&[Inpatient] } ) ON COLUMNS
    FROM (
      SELECT ( { [Date Discharge Index Adm].[Year].&[2014] } ) ON COLUMNS
      FROM [Readmissions]
    )
  )
)
WHERE ( [Date Discharge Index Adm].[Year].&[2014],
[Generic Measures].[In Out Desc].&[Inpatient],
[Generic Measures].[CalcName].&[6] ) ')


union
select '# Patients' as [Desc],

"[Measures].[Prev Score]" as [Prev Score]
--select * 
from openquery(FDX_3, 'SELECT NON EMPTY
{  [Measures].[Prev Score] } ON COLUMNS
FROM (
  SELECT ( { [Generic Measures].[CalcName].&[7] } ) ON COLUMNS
  FROM (
    SELECT ( { [Generic Measures].[In Out Desc].&[Inpatient] } ) ON COLUMNS
    FROM (
      SELECT ( { [Date Discharge Index Adm].[Year].&[2014] } ) ON COLUMNS
      FROM [Readmissions]
    )
  )
)
WHERE ( [Date Discharge Index Adm].[Year].&[2014],
[Generic Measures].[In Out Desc].&[Inpatient],
[Generic Measures].[CalcName].&[7] ) ')


union
select 'Same RR' as [Desc],

"[Measures].[Prev Score]" as [Prev Score]
--select * 
from openquery(FDX_3, 'SELECT NON EMPTY
{  [Measures].[Prev Score] } ON COLUMNS
FROM (
  SELECT ( { [Generic Measures].[CalcName].&[8] } ) ON COLUMNS
  FROM (
    SELECT ( { [Generic Measures].[In Out Desc].&[Inpatient] } ) ON COLUMNS
    FROM (
      SELECT ( { [Date Discharge Index Adm].[Year].&[2014] } ) ON COLUMNS
      FROM [Readmissions]
    )
  )
)
WHERE ( [Date Discharge Index Adm].[Year].&[2014],
[Generic Measures].[In Out Desc].&[Inpatient],
[Generic Measures].[CalcName].&[8] ) ')


union
select 'AVG DTR' as [Desc],

"[Measures].[Prev Score]" as [Prev Score]
--select * 
from openquery(FDX_3, 'SELECT NON EMPTY
{  [Measures].[Prev Score] } ON COLUMNS
FROM (
  SELECT ( { [Generic Measures].[CalcName].&[9] } ) ON COLUMNS
  FROM (
    SELECT ( { [Generic Measures].[In Out Desc].&[Inpatient] } ) ON COLUMNS
    FROM (
      SELECT ( { [Date Discharge Index Adm].[Year].&[2014] } ) ON COLUMNS
      FROM [Readmissions]
    )
  )
)
WHERE ( [Date Discharge Index Adm].[Year].&[2014],
[Generic Measures].[In Out Desc].&[Inpatient],
[Generic Measures].[CalcName].&[9] ) ')


union
select 'FUV 7' as [Desc],

"[Measures].[Prev Score]" as [Prev Score]
--select * 
from openquery(FDX_3, 'SELECT NON EMPTY
{  [Measures].[Prev Score] } ON COLUMNS
FROM (
  SELECT ( { [Generic Measures].[CalcName].&[10] } ) ON COLUMNS
  FROM (
    SELECT ( { [Generic Measures].[In Out Desc].&[Inpatient] } ) ON COLUMNS
    FROM (
      SELECT ( { [Date Discharge Index Adm].[Year].&[2014] } ) ON COLUMNS
      FROM [Readmissions]
    )
  )
)
WHERE ( [Date Discharge Index Adm].[Year].&[2014],
[Generic Measures].[In Out Desc].&[Inpatient],
[Generic Measures].[CalcName].&[10] ) ')

) sd ORDER BY [DESC]
 EXEC sp_dropserver 'FDX_3', 'droplogins'

