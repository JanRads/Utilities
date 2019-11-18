Use [dbmSemanticAnalytics]

--MDX Regression test

--Generic Measures for Outpatients

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET NOCOUNT ON
if  exists(select * from sys.servers where name = N'FDX_3')
 EXEC sp_dropserver 'FDX_3', 'droplogins'


EXEC sp_addlinkedserver
     @server='FDX_3',   /* local SQL name given to the 
                                 linked server */
     @srvproduct='',          /* not used */
     @provider='MSOLAP',      /* OLE DB provider */
     --@datasrc='dbm8-data112\inst03',
	 @datasrc= '$(OlapServer)',   /* analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 


EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'
--SELECT cast[Desc],Numerator,Denominator, CASE WHEN SCORE - ROUND(Score,0) = 0 THEN SCORE ELSE  left(score,charindex('.',Score)+3) END as Score
SELECT cast([Desc] as nvarchar(100)) [Desc], cast(Numerator as nvarchar(100)) Numerator,cast(Denominator as nvarchar(100)) Denumerator, 
round(Score,3) as Score,cast([LACE] as nvarchar(100)) [lace]
from (
--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
select 'Admissions' as [Desc],
Null as Numerator,
Null as Denominator,
"[Measures].[Denominator]" as Score
, cast("[LACE Score].[LACE Category].[LACE Category].[MEMBER_CAPTION]" as varchar(10)) as lace
--select * 
from openquery(FDX_3, 'SELECT NON EMPTY
{ [Measures].[Numerator], [Measures].[Denominator], [Measures].[Score] } ON COLUMNS
,[LACE Score].[LACE Category].[LACE Category].ALLMEMBERS
DIMENSION PROPERTIES MEMBER_CAPTION, MEMBER_UNIQUE_NAME on rows
FROM (
  SELECT ( { [Generic Measures].[CalcName].&[15] } ) ON COLUMNS
  FROM (
    SELECT ( { [Generic Measures].[In Out Desc].&[Community Patients] } ) ON COLUMNS
    FROM (
      SELECT ( { [Date Discharge Index Adm].[Year].&[2013] } ) ON COLUMNS
      FROM [Readmissions]
    )
  )
)
WHERE ( [Date Discharge Index Adm].[Year].&[2013],
[Generic Measures].[In Out Desc].&[Community Patients],
[Generic Measures].[CalcName].&[15] ) ')


/**********************Commented until Admission Rate bug is fixed**********************/
--union

--select 'Total Pop' as [Desc],
--Null as Numerator,
--Null as Denominator,
--"[Measures].[Denominator]" as Score
----select * 
--from openquery(FDX_3, 'SELECT NON EMPTY
--{ [Measures].[Numerator], [Measures].[Denominator], [Measures].[Score] } ON COLUMNS
--FROM (
--  SELECT ( { [Generic Measures].[CalcName].&[1] } ) ON COLUMNS
--  FROM (
--    SELECT ( { [Generic Measures].[In Out Desc].&[Community Patients] } ) ON COLUMNS
--    FROM (
--      SELECT ( { [Date Discharge Index Adm].[Year].&[2013] } ) ON COLUMNS
--      FROM [Readmissions]
--    )
--  )
--)
--WHERE ( [Date Discharge Index Adm].[Year].&[2013],
--[Generic Measures].[In Out Desc].&[Community Patients],
--[Generic Measures].[CalcName].&[1] ) ')

/**********************Commented until Admission Rate bug is fixed**********************/
union
select 'AVG LOS',
NULL as Numerator,
NULL as Denumerator,
"[Measures].[score]" as Score, cast("[LACE Score].[LACE Category].[LACE Category].[MEMBER_CAPTION]" as varchar(10)) as lace

--select * 
from openquery(FDX_3, 'SELECT NON EMPTY
{ [Measures].[Score], [Measures].[LOS Index Adm], [Measures].[LOS AVG Index Adm], [Measures].[Denominator], [Measures].[Numerator] } ON COLUMNS
,[LACE Score].[LACE Category].[LACE Category].ALLMEMBERS
DIMENSION PROPERTIES MEMBER_CAPTION, MEMBER_UNIQUE_NAME on rows
FROM (
  SELECT ( { [Generic Measures].[CalcName].&[14] } ) ON COLUMNS
  FROM (
    SELECT ( { [Generic Measures].[In Out Desc].&[Community Patients] } ) ON COLUMNS
    FROM (
      SELECT ( { [Date Discharge Index Adm].[Year].&[2013] } ) ON COLUMNS
      FROM [Readmissions]
    )
  )
)
WHERE ( [Date Discharge Index Adm].[Year].&[2013],
[Generic Measures].[In Out Desc].&[Community Patients],
[Generic Measures].[CalcName].&[14] )')


union
select 'ReAdm Rate',
"[Measures].[Numerator]" as Numerator,
"[Measures].[Denominator]" as Denumerator,
"[Measures].[score]" as Score, cast("[LACE Score].[LACE Category].[LACE Category].[MEMBER_CAPTION]" as varchar(10)) as lace
--select * 
from openquery(FDX_3, 'SELECT NON EMPTY
{ [Measures].[Score], [Measures].[LOS Index Adm], [Measures].[LOS AVG Index Adm], [Measures].[Denominator], [Measures].[Numerator] } ON COLUMNS
,[LACE Score].[LACE Category].[LACE Category].ALLMEMBERS
DIMENSION PROPERTIES MEMBER_CAPTION, MEMBER_UNIQUE_NAME on rows
FROM (
  SELECT ( { [Generic Measures].[CalcName].&[15] } ) ON COLUMNS
  FROM (
    SELECT ( { [Generic Measures].[In Out Desc].&[Community Patients] } ) ON COLUMNS
    FROM (
      SELECT ( { [Date Discharge Index Adm].[Year].&[2013] } ) ON COLUMNS
      FROM [Readmissions]
    )
  )
)
WHERE ( [Date Discharge Index Adm].[Year].&[2013],
[Generic Measures].[In Out Desc].&[Community Patients],
[Generic Measures].[CalcName].&[15] )')

union
select '# ReAdm',
NULL as Numerator,
NULL as Denumerator,
"[Measures].[score]" as Score,
cast("[LACE Score].[LACE Category].[LACE Category].[MEMBER_CAPTION]" as varchar(10)) as lace
--select * 
from openquery(FDX_3, 'SELECT NON EMPTY
{ [Measures].[Score], [Measures].[LOS Index Adm], [Measures].[LOS AVG Index Adm], [Measures].[Denominator], [Measures].[Numerator] } ON COLUMNS
,[LACE Score].[LACE Category].[LACE Category].ALLMEMBERS
DIMENSION PROPERTIES MEMBER_CAPTION, MEMBER_UNIQUE_NAME on rows
FROM (
  SELECT ( { [Generic Measures].[CalcName].&[16] } ) ON COLUMNS
  FROM (
    SELECT ( { [Generic Measures].[In Out Desc].&[Community Patients] } ) ON COLUMNS
    FROM (
      SELECT ( { [Date Discharge Index Adm].[Year].&[2013] } ) ON COLUMNS
      FROM [Readmissions]
    )
  )
)
WHERE ( [Date Discharge Index Adm].[Year].&[2013],
[Generic Measures].[In Out Desc].&[Community Patients],
[Generic Measures].[CalcName].&[16] )')

union
select '# Patients',
NULL as Numerator,
NULL as Denumerator,
"[Measures].[score]" as Score,cast("[LACE Score].[LACE Category].[LACE Category].[MEMBER_CAPTION]" as varchar(10)) as lace
--select * 
from openquery(FDX_3, 'SELECT NON EMPTY
{ [Measures].[Score], [Measures].[LOS Index Adm], [Measures].[LOS AVG Index Adm], [Measures].[Denominator], [Measures].[Numerator] } ON COLUMNS
,[LACE Score].[LACE Category].[LACE Category].ALLMEMBERS
DIMENSION PROPERTIES MEMBER_CAPTION, MEMBER_UNIQUE_NAME on rows
FROM (
  SELECT ( { [Generic Measures].[CalcName].&[17] } ) ON COLUMNS
  FROM (
    SELECT ( { [Generic Measures].[In Out Desc].&[Community Patients] } ) ON COLUMNS
    FROM (
      SELECT ( { [Date Discharge Index Adm].[Year].&[2013] } ) ON COLUMNS
      FROM [Readmissions]
    )
  )
)
WHERE ( [Date Discharge Index Adm].[Year].&[2013],
[Generic Measures].[In Out Desc].&[Community Patients],
[Generic Measures].[CalcName].&[17] )')

union
select 'Same RR',
"[Measures].[Numerator]" as Numerator,
"[Measures].[Denominator]" as Denumerator,
"[Measures].[score]" as Score,cast("[LACE Score].[LACE Category].[LACE Category].[MEMBER_CAPTION]" as varchar(10)) as lace
--select * 
from openquery(FDX_3, 'SELECT NON EMPTY
{ [Measures].[Score], [Measures].[LOS Index Adm], [Measures].[LOS AVG Index Adm], [Measures].[Denominator], [Measures].[Numerator] } ON COLUMNS
,[LACE Score].[LACE Category].[LACE Category].ALLMEMBERS
DIMENSION PROPERTIES MEMBER_CAPTION, MEMBER_UNIQUE_NAME on rows
FROM (
  SELECT ( { [Generic Measures].[CalcName].&[18] } ) ON COLUMNS
  FROM (
    SELECT ( { [Generic Measures].[In Out Desc].&[Community Patients] } ) ON COLUMNS
    FROM (
      SELECT ( { [Date Discharge Index Adm].[Year].&[2013] } ) ON COLUMNS
      FROM [Readmissions]
    )
  )
)
WHERE ( [Date Discharge Index Adm].[Year].&[2013],
[Generic Measures].[In Out Desc].&[Community Patients],
[Generic Measures].[CalcName].&[18] )')

union
select 'AVG DTR',
NULL as Numerator,
NULL as Denumerator,
"[Measures].[score]" as Score,cast("[LACE Score].[LACE Category].[LACE Category].[MEMBER_CAPTION]" as varchar(10)) as lace
--select * 
from openquery(FDX_3, 'SELECT NON EMPTY
{ [Measures].[Score], [Measures].[LOS Index Adm], [Measures].[LOS AVG Index Adm], [Measures].[Denominator], [Measures].[Numerator] } ON COLUMNS
,[LACE Score].[LACE Category].[LACE Category].ALLMEMBERS
DIMENSION PROPERTIES MEMBER_CAPTION, MEMBER_UNIQUE_NAME on rows
FROM (
  SELECT ( { [Generic Measures].[CalcName].&[19] } ) ON COLUMNS
  FROM (
    SELECT ( { [Generic Measures].[In Out Desc].&[Community Patients] } ) ON COLUMNS
    FROM (
      SELECT ( { [Date Discharge Index Adm].[Year].&[2013] } ) ON COLUMNS
      FROM [Readmissions]
    )
  )
)
WHERE ( [Date Discharge Index Adm].[Year].&[2013],
[Generic Measures].[In Out Desc].&[Community Patients],
[Generic Measures].[CalcName].&[19] )')

union
select 'FUV 7',
"[Measures].[Numerator]" as Numerator,
"[Measures].[Denominator]" as Denumerator,
"[Measures].[score]" as Score,cast("[LACE Score].[LACE Category].[LACE Category].[MEMBER_CAPTION]" as varchar(10)) as lace
--select * 
from openquery(FDX_3, 'SELECT NON EMPTY
{ [Measures].[Score], [Measures].[LOS Index Adm], [Measures].[LOS AVG Index Adm], [Measures].[Denominator], [Measures].[Numerator] } ON COLUMNS
,[LACE Score].[LACE Category].[LACE Category].ALLMEMBERS
DIMENSION PROPERTIES MEMBER_CAPTION, MEMBER_UNIQUE_NAME on rows
FROM (
  SELECT ( { [Generic Measures].[CalcName].&[20] } ) ON COLUMNS
  FROM (
    SELECT ( { [Generic Measures].[In Out Desc].&[Community Patients] } ) ON COLUMNS
    FROM (
      SELECT ( { [Date Discharge Index Adm].[Year].&[2013] } ) ON COLUMNS
      FROM [Readmissions]
    )
  )
)
WHERE ( [Date Discharge Index Adm].[Year].&[2013],
[Generic Measures].[In Out Desc].&[Community Patients],
[Generic Measures].[CalcName].&[20] )')
)T
order by 1,5
 EXEC sp_dropserver 'FDX_3', 'droplogins'

