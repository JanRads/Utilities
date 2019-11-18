USE dbmSemanticAnalytics

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET NOCOUNT ON
/*******************  OUT  ******************************/
select [Desc],Numerator, Denumerator, round(score,3) as Score, [LACE Category] lace
from (
SELECT cast([Desc] as nvarchar(100)) [Desc], 
cast(Numerator as nvarchar(100)) Numerator,
cast(Denumerator as nvarchar(100)) Denumerator, SCORE as Score
,[LACE Category]
from (
--# of Admissions
select 'Admissions' as [Desc],NULL as Numerator, NULL as Denumerator, cast(sum([mesure_IndexAdmissionInd]) as nvarchar(max)) as Score,[LACE Category]
from Fact.Readmissions
left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore where 

 date_DischargeIndexAdmission like '2013%'
and org_RelatedProvider_IndexAdm	 != -1
group by [LACE Category]

UNION


--Avg LOS
select 'AVG LOS' as [Desc],NULL as Numerator, NULL as Denumerator,cast( sum([measure_LengthOfStay_IndexAdm])*1.0/sum([mesure_IndexAdmissionInd])/24 as nvarchar(max)) as Score, [LACE Category]
from Fact.Readmissions
 left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore  
where date_DischargeIndexAdmission like '2013%'
and org_RelatedProvider_IndexAdm	 != -1
group by [LACE Category]

UNION


--ReAdm Rate
select   'ReAdm Rate' as [Desc], isnull(sum(measure_ReadmissionInd),0) as Numerator, 
isnull(sum([mesure_IndexAdmissionInd]),0) as Denominator, 
cast( case when isnull(sum([mesure_IndexAdmissionInd]),0)  = 0 then 0 
else  (isnull(sum(measure_ReadmissionInd),0)*1.0)/isnull(sum([mesure_IndexAdmissionInd]),0) end  as nvarchar(max)) as Score, [LACE Category]
from Fact.Readmissions
left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore  
where date_DischargeIndexAdmission like '2013%'
and org_RelatedProvider_IndexAdm	 != -1
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
and org_RelatedProvider_IndexAdm	 != -1
group by [LACE Category]

UNION


--Patients Readmited
select '# Patients' as [Desc],NULL as Numerator, NULL as Denumerator, CAST(  count(distinct id_Patient) AS NVARCHAR(MAX)) as Score ,[LACE Category]
from Fact.Readmissions
left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore  
where  date_DischargeIndexAdmission like '2013%'
and measure_ReadmissionInd is not null
and org_RelatedProvider_IndexAdm	 != -1
group by [LACE Category]

UNION


--Same RR
select  'Same RR' as [Desc], isnull(sum(case when [attrib_SameDischargeFacilityInd] = 1 then 1 else 0 end),0) as Numerator, isnull(sum([mesure_IndexAdmissionInd]),0)  as Denominator, CAST( case when isnull(sum([mesure_IndexAdmissionInd]),0) = 0 then 0 else isnull(sum(case when [attrib_SameDischargeFacilityInd] = 1 then 1 else 0 end),0)*1.0/isnull(sum([mesure_IndexAdmissionInd]),0) end AS  NVARCHAR(MAX)) as Score,[LACE Category]
from fact.Readmissions
left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore  
where date_DischargeIndexAdmission like '2013%'
and org_RelatedProvider_IndexAdm	 != -1
group by [LACE Category]
--and measure_ReadmissionInd is not null 

UNION


--Avg Days to ReAdm
select  'AVG DTR' as [Desc],NULL as Numerator, NULL as Denumerator, CAST( sum([measure_TimeBetweenAdmissions])*1.00/sum([measure_ReadmissionInd])/24  AS NVARCHAR(MAX)) as Score,[LACE Category]
from fact.Readmissions left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore  
where date_DischargeIndexAdmission like '2013%'
and measure_ReadmissionInd is not null
and org_RelatedProvider_IndexAdm	 != -1
group by [LACE Category]

UNION


--FUV 7 !!!
	select 'FUV 7' as [Desc], isnull(sum([measure_FUV_7Day_Ind]),0) as Numerator, isnull(sum([mesure_IndexAdmissionInd]),0) as Denominator, CAST( case when isnull(sum([mesure_IndexAdmissionInd]),0) = 0 then 0 else  isnull(sum([measure_FUV_7Day_Ind]),0)*1.0/isnull(sum([mesure_IndexAdmissionInd]),0) end AS nvarchar(MAX)) as Score, [LACE Category]
	from fact.Readmissions
	left join (SELECT        From_Num AS [LACE score], ScoreName AS [LACE Category]
FROM  Dim.Scores
WHERE        (ScoreType = 'LACE Score')) L
on l.[LACE score]=LACEScore  
	where date_DischargeIndexAdmission like '2013%'
	and org_RelatedProvider_IndexAdm	 != -1
	group by [LACE Category]


)T
)TT order by 1,5