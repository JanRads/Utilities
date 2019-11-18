--SQL Regression test

--Generic Measures for All from DWH

USE dbmSemanticAnalytics
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET NOCOUNT ON

/*******************  IN  ******************************/
select [Desc],Numerator, Denumerator, Case when Score like '0.00%' then '0' else score end Score,[LACE Category]
from (
SELECT cast([Desc] as nvarchar(100)) [Desc],cast(Numerator as nvarchar(100)) Numerator ,cast(Denumerator as nvarchar(100)) Denumerator,
 round(Score,3) as Score,[LACE Category]
from (
--# of Admissions
select 'Admissions' as [Desc],NULL as Numerator, NULL as Denumerator, cast(sum([mesure_IndexAdmissionInd]) as nvarchar(max)) as Score,[LACE Category]
from Fact.Readmissions left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore  
where date_DischargeIndexAdmission like '2013%'
group by [LACE Category]

UNION
--Avg LOS
select 'AVG LOS' as [Desc],NULL as Numerator, NULL as Denumerator,cast( sum([measure_LengthOfStay_IndexAdm])*1.0/sum([mesure_IndexAdmissionInd])/24 as nvarchar(max)) as Score,[LACE Category]
from Fact.Readmissions
left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore  
where date_DischargeIndexAdmission like '2013%'
group by [LACE Category]


union

--ReAdm Rate
select   'ReAdm Rate' as [Desc], isnull(sum(measure_ReadmissionInd),0) as Numerator, isnull(sum([mesure_IndexAdmissionInd]),0) as Denominator, cast(isnull(sum(measure_ReadmissionInd),0)*1.0/isnull(sum([mesure_IndexAdmissionInd]),0) as nvarchar(max)) as Score,[LACE Category]

from Fact.Readmissions
left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore  
where date_DischargeIndexAdmission like '2013%'
group by [LACE Category]


UNION

--# of ReAdm
select '# ReAdm' as [Desc],NULL as Numerator, NULL as Denumerator, CAST( sum(measure_ReadmissionInd) AS NVARCHAR(MAX))as Score,[LACE Category]
from Fact.Readmissions 
left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore  
where date_DischargeIndexAdmission like '2013%'
group by [LACE Category]

UNION

--Patients Readmited
select '# Patients' as [Desc],NULL as Numerator, NULL as Denumerator, CAST(  count(distinct id_Patient) AS NVARCHAR(MAX)) as Score,[LACE Category]
from Fact.Readmissions
left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore  
where date_DischargeIndexAdmission like '2013%'
AND attrib_SameDischargeFacilityInd <> -1
group by [LACE Category]


UNION

--Same RR
SELECT 'Same RR'  AS  [Desc],
 case when [LACE Category]= 'High Risk'
then       Isnull((SELECT Count(*) 
               FROM   [dbmSemanticAnalytics].[Fact].[readmissions] left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore  
               WHERE  attrib_samedischargefacilityind = 1 and [LACE Category]='High Risk'
                      AND date_dischargeindexadmission LIKE '2013%'), 0) else 
					     Isnull((SELECT Count(*) 
               FROM   [dbmSemanticAnalytics].[Fact].[readmissions] left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore  
               WHERE  attrib_samedischargefacilityind = 1 and [LACE Category]='Low Risk'
                      AND date_dischargeindexadmission LIKE '2013%'), 0)
					  end AS 
       Numerator, 
       Isnull(Sum([mesure_indexadmissionind]), 0)                        AS 
       Denominator, 
      case when  [LACE Category]= 'High Risk' then 
	  Cast(Isnull((SELECT Count(*)   FROM   [dbmSemanticAnalytics].[Fact].[readmissions] left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
		FROM  Dim.Scores
				WHERE        (ScoreType = 'LACE Score')) L
		on l.[LACE score]=LACEScore  
                    WHERE  attrib_samedischargefacilityind = 1 and [LACE Category]='High Risk'
                           AND date_dischargeindexadmission LIKE '2013%'), 0) * 
            1.0 /   Isnull 
                 (Sum([mesure_indexadmissionind]), 0)AS NVARCHAR(max))  
				 else  	  Cast(Isnull((SELECT Count(*)   FROM   [dbmSemanticAnalytics].[Fact].[readmissions] left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
		FROM  Dim.Scores
				WHERE        (ScoreType = 'LACE Score')) L
		on l.[LACE score]=LACEScore  
                    WHERE  attrib_samedischargefacilityind = 1 and [LACE Category]='Low Risk'
                           AND date_dischargeindexadmission LIKE '2013%'), 0) * 
            1.0 /   Isnull 
                 (Sum([mesure_indexadmissionind]), 0)AS NVARCHAR(max))   end AS 
       Score , [LACE Category]
FROM   fact.readmissions left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore  
WHERE  date_dischargeindexadmission LIKE '2013%' 
group by [LACE Category]

--Livdok!!
UNION

--Avg Days to ReAdm
select  'AVG DTR' as [Desc],NULL as Numerator, NULL as Denumerator, CAST( sum([measure_TimeBetweenAdmissions])*1.00/sum([measure_ReadmissionInd])/24  AS NVARCHAR(MAX)) as Score,[LACE Category]
from fact.Readmissions
left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore  
where date_DischargeIndexAdmission like '2013%'
and measure_ReadmissionInd = 1
group by [LACE Category]

--?
UNION

--FUV 7
select 'FUV 7' as [Desc], isnull(sum([measure_FUV_7Day_Ind]),0) as Numerator, isnull(sum([mesure_IndexAdmissionInd]),0) as Denominator, CAST(isnull(sum([measure_FUV_7Day_Ind]),0)*1.0/isnull(sum([mesure_IndexAdmissionInd]),0) AS nvarchar(MAX)) as Score,[LACE Category]
from fact.Readmissions
left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore  
where date_DischargeIndexAdmission like '2013%'
group by [LACE Category]
)T
)TT order by 1,5