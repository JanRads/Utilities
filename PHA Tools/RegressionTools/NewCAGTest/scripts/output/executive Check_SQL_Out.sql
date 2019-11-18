--SQL Regression test

--Generic Measures for All from DWH

USE dbmSemanticAnalytics

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET NOCOUNT ON
/*******************  OUT  ******************************/
select [Desc],Numerator, Denumerator, round(score,3) as Score
from (
SELECT cast([Desc] as nvarchar(100)) [Desc], 
cast(Numerator as nvarchar(100)) Numerator,
cast(Denumerator as nvarchar(100)) Denumerator, SCORE as Score
from (
--# of Admissions
select 'Admissions' as [Desc],NULL as Numerator, NULL as Denumerator, cast(sum([mesure_IndexAdmissionInd]) as nvarchar(max)) as Score
from Fact.Readmissions
where date_DischargeIndexAdmission like '2013%'
and org_RelatedProvider_IndexAdm	 != -1

--UNION


----Tot Pop
--select 'Tot Pop' as [Desc],NULL as Numerator, NULL as Denumerator,cast(count(distinct id_Patient) as nvarchar(max))
--from Fact.Readmissions
--where date_DischargeIndexAdmission like '2013%'
--and org_RelatedProvider_IndexAdm	 != -1

UNION


--Avg LOS
select 'AVG LOS' as [Desc],NULL as Numerator, NULL as Denumerator,cast( sum([measure_LengthOfStay_IndexAdm])*1.0/sum([mesure_IndexAdmissionInd])/24 as nvarchar(max)) as Score
from Fact.Readmissions
where date_DischargeIndexAdmission like '2013%'
and org_RelatedProvider_IndexAdm	 != -1

UNION


--ReAdm Rate
select   'ReAdm Rate' as [Desc], isnull(sum(measure_ReadmissionInd),0) as Numerator, 
isnull(sum([mesure_IndexAdmissionInd]),0) as Denominator, 
cast( case when isnull(sum([mesure_IndexAdmissionInd]),0)  = 0 then 0 
else  (isnull(sum(measure_ReadmissionInd),0)*1.0)/isnull(sum([mesure_IndexAdmissionInd]),0) end  as nvarchar(max)) as Score
from Fact.Readmissions
where date_DischargeIndexAdmission like '2013%'
and org_RelatedProvider_IndexAdm	 != -1

UNION


--# of ReAdm
select '# ReAdm' as [Desc],NULL as Numerator, NULL as Denumerator, CAST( sum(measure_ReadmissionInd) AS NVARCHAR(MAX))as Score
from Fact.Readmissions
where date_DischargeIndexAdmission like '2013%'
and org_RelatedProvider_IndexAdm	 != -1

UNION


--Patients Readmited
select '# Patients' as [Desc],NULL as Numerator, NULL as Denumerator, CAST(  count(distinct id_Patient) AS NVARCHAR(MAX)) as Score
from Fact.Readmissions
where date_DischargeIndexAdmission like '2013%'
and measure_ReadmissionInd is not null
and org_RelatedProvider_IndexAdm	 != -1

UNION


--Same RR
select  'Same RR' as [Desc], isnull(sum(case when [attrib_SameDischargeFacilityInd] = 1 then 1 else 0 end),0) as Numerator, isnull(sum([mesure_IndexAdmissionInd]),0)  as Denominator, CAST( case when isnull(sum([mesure_IndexAdmissionInd]),0) = 0 then 0 else isnull(sum(case when [attrib_SameDischargeFacilityInd] = 1 then 1 else 0 end),0)*1.0/isnull(sum([mesure_IndexAdmissionInd]),0) end AS  NVARCHAR(MAX)) as Score
from fact.Readmissions
where date_DischargeIndexAdmission like '2013%'
and org_RelatedProvider_IndexAdm	 != -1
--and measure_ReadmissionInd is not null 

UNION


--Avg Days to ReAdm
select  'AVG DTR' as [Desc],NULL as Numerator, NULL as Denumerator, CAST( sum([measure_TimeBetweenAdmissions])*1.00/sum([measure_ReadmissionInd])/24  AS NVARCHAR(MAX)) as Score
from fact.Readmissions
where date_DischargeIndexAdmission like '2013%'
and measure_ReadmissionInd is not null
and org_RelatedProvider_IndexAdm	 != -1

UNION


--FUV 7 !!!
	select 'FUV 7' as [Desc], isnull(sum([measure_FUV_7Day_Ind]),0) as Numerator, isnull(sum([mesure_IndexAdmissionInd]),0) as Denominator, CAST( case when isnull(sum([mesure_IndexAdmissionInd]),0) = 0 then 0 else  isnull(sum([measure_FUV_7Day_Ind]),0)*1.0/isnull(sum([mesure_IndexAdmissionInd]),0) end AS nvarchar(MAX)) as Score
	from fact.Readmissions
	where date_DischargeIndexAdmission like '2013%'
	and org_RelatedProvider_IndexAdm	 != -1

)T
)TT