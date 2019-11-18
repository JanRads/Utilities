	SET ANSI_WARNINGS OFF 

SET NOCOUNT ON 

select MeasureKey,[org_RelatedProvider] , cast(round(sum(KPIScore),3) as money) as KPIScore
from (
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select  MeasureLevel2Key,MeasureLevel2Desc,MeasureKey,MeasureName, [org_RelatedProvider],
 round(cast(cast(SumNum as money)/cast(SumDnum as money) as money),3)  as KPIScore,
cast(SumNum as int) as Numerator,cast(SumDnum as int) as Denominator
from
(

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select Num.MeasureLevel2Key,Num.MeasureLevel2Desc,Num.ImprovementNotation,Num.InverseInd,Num.MeasureKey,Num.MeasureName, cast(case when Num.InverseInd = 1 
then isnull(SumNum,0.00000000) else SumDnum-isnull(SumNum,0.00000000) end as money) as SumNum, cast(SumDnum as money) as SumDnum, Num.[org_RelatedProvider]
from
(
select MD.ImprovementNotation,MD.MeasureKey,MeasureName,InverseInd,date_YearMonth,attrib_Measure,MeasureLevel2Key,MeasureLevel2Desc,sum(measure_MemberInd) as SumDnum, [org_RelatedProvider]
from (
select T1.*, T2.[org_RelatedProvider]
from dbmSemanticAnalytics.fact.PopulationMembersMonthly T1
inner join
dbmSemanticAnalytics.Factless.PopulationPCPOrg T2
On T1.id_PopulationMember = T2.id_PopulationMember
) P
left join [dbmSemanticAnalytics].[Dim].[MeasureDefinition] MD
on P.attrib_Measure = MD.MeasureKey
where date_yearMonth = cast( datepart(yyyy,getdate())as varchar)+'_01'
group by  MD.ImprovementNotation,MD.MeasureKey,MeasureName,InverseInd,date_YearMonth,attrib_Measure,MeasureLevel2Key,MeasureLevel2Desc, [org_RelatedProvider]
) Num
full outer join
(
select MD.ImprovementNotation,MD.MeasureKey,MeasureName,InverseInd,date_YearMonth,attrib_Measure,MeasureLevel1Key,MeasureLevel1Desc,sum(measure_MemberInd) as SumNum, [org_RelatedProvider]
from (
select T1.*, T2.[org_RelatedProvider]
from [dbmSemanticAnalytics].fact.MeasureMembersMonthly T1
inner join
dbmSemanticAnalytics.Factless.PopulationPCPOrg T2
On T1.id_PopulationMember = T2.id_PopulationMember) P
full outer join [dbmSemanticAnalytics].[Dim].[MeasureDefinition] MD
on P.attrib_Measure = MD.MeasureKey
where date_yearMonth = cast( datepart(yyyy,getdate())as varchar)+'_01'
group by  MD.ImprovementNotation,MD.MeasureKey,MeasureName,InverseInd,date_YearMonth,attrib_Measure,MeasureLevel1Key,MeasureLevel1Desc, [org_RelatedProvider]
) DNum
on Num.attrib_Measure = DNum.attrib_Measure and Num.date_YearMonth = DNum.date_YearMonth  and Num.[org_RelatedProvider] = DNum.[org_RelatedProvider]

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

) A
--order by MeasureKey, GenderDesc
) B
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
group by  MeasureKey, [org_RelatedProvider]

order by 1,2