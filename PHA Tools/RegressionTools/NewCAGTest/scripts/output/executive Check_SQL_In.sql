--SQL Regression test

--Generic Measures for All from DWH

USE dbmSemanticAnalytics
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET NOCOUNT ON

/*******************  IN  ******************************/
select [Desc],Numerator, Denumerator, Case when Score like '0.00%' then '0' else score end Score
from (
SELECT cast([Desc] as nvarchar(100)) [Desc],cast(Numerator as nvarchar(100)) Numerator ,cast(Denumerator as nvarchar(100)) Denumerator,
 round(Score,3) as Score
from (
--# of Admissions
select 'Admissions' as [Desc],NULL as Numerator, NULL as Denumerator, cast(sum([mesure_IndexAdmissionInd]) as nvarchar(max)) as Score
from Fact.Readmissions
where date_DischargeIndexAdmission like '2013%'

UNION
--Avg LOS
select 'AVG LOS' as [Desc],NULL as Numerator, NULL as Denumerator,cast( sum([measure_LengthOfStay_IndexAdm])*1.0/sum([mesure_IndexAdmissionInd])/24 as nvarchar(max)) as Score
from Fact.Readmissions
where date_DischargeIndexAdmission like '2013%'

union

--ReAdm Rate
select   'ReAdm Rate' as [Desc], isnull(sum(measure_ReadmissionInd),0) as Numerator, isnull(sum([mesure_IndexAdmissionInd]),0) as Denominator, cast(isnull(sum(measure_ReadmissionInd),0)*1.0/isnull(sum([mesure_IndexAdmissionInd]),0) as nvarchar(max)) as Score
from Fact.Readmissions
where date_DischargeIndexAdmission like '2013%'

UNION

--# of ReAdm
select '# ReAdm' as [Desc],NULL as Numerator, NULL as Denumerator, CAST( sum(measure_ReadmissionInd) AS NVARCHAR(MAX))as Score
from Fact.Readmissions
where date_DischargeIndexAdmission like '2013%'

UNION

--Patients Readmited
select '# Patients' as [Desc],NULL as Numerator, NULL as Denumerator, CAST(  count(distinct id_Patient) AS NVARCHAR(MAX)) as Score
from Fact.Readmissions
where date_DischargeIndexAdmission like '2013%'
AND attrib_SameDischargeFacilityInd <> -1


UNION

--Same RR
SELECT 'Same RR'                                                         AS 
       [Desc], 
       Isnull((SELECT Count(*) 
               FROM   [dbmSemanticAnalytics].[Fact].[readmissions] 
               WHERE  attrib_samedischargefacilityind = 1 
                      AND date_dischargeindexadmission LIKE '2013%'), 0) AS 
       Numerator, 
       Isnull(Sum([mesure_indexadmissionind]), 0)                        AS 
       Denominator, 
       Cast(Isnull((SELECT Count(*) 
                    FROM   [dbmSemanticAnalytics].[Fact].[readmissions] 
                    WHERE  attrib_samedischargefacilityind = 1 
                           AND date_dischargeindexadmission LIKE '2013%'), 0) * 
            1.0 / 
            Isnull 
                 (Sum([mesure_indexadmissionind]), 0)AS NVARCHAR(max))   AS 
       Score 
FROM   fact.readmissions 
WHERE  date_dischargeindexadmission LIKE '2013%' 


--Livdok!!
UNION

--Avg Days to ReAdm
select  'AVG DTR' as [Desc],NULL as Numerator, NULL as Denumerator, CAST( sum([measure_TimeBetweenAdmissions])*1.00/sum([measure_ReadmissionInd])/24  AS NVARCHAR(MAX)) as Score
from fact.Readmissions
where date_DischargeIndexAdmission like '2013%'
and measure_ReadmissionInd = 1

--?
UNION

--FUV 7
select 'FUV 7' as [Desc], isnull(sum([measure_FUV_7Day_Ind]),0) as Numerator, isnull(sum([mesure_IndexAdmissionInd]),0) as Denominator, CAST(isnull(sum([measure_FUV_7Day_Ind]),0)*1.0/isnull(sum([mesure_IndexAdmissionInd]),0) AS nvarchar(MAX)) as Score
from fact.Readmissions
where date_DischargeIndexAdmission like '2013%'
)T
)TT