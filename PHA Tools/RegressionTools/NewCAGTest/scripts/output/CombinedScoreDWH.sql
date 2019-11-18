	SET ANSI_WARNINGS OFF 

SET NOCOUNT ON 

select MeasureLevel1Key,MeasureLevel1Desc,cast(round(sum(KPIScore),3) as money) as KPIScore
from (
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select  MeasureLevel1Key,MeasureLevel1Desc,MeasureKey,MeasureName, 
case when ImprovementNotation = 1 then round(cast(cast(SumNum as money)/cast(SumDnum as money) as money),3) 
when ImprovementNotation = 2 then round(1-cast(cast(SumNum as money)/cast(SumDnum as money) as money),3) end * KPICombniedWeight as KPIScore,
cast(SumNum as int) as Numerator,cast(SumDnum as int) as Denominator, KPICombniedWeight
from
(

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select Num.MeasureLevel1Key,Num.MeasureLevel1Desc,Num.ImprovementNotation,Num.InverseInd,Num.MeasureKey,Num.MeasureName, cast(case when Num.InverseInd = 1 then isnull(SumNum,0.00000000) else SumDnum-isnull(SumNum,0.00000000) end as money) as SumNum, cast(SumDnum as money) as SumDnum, KPICombniedWeight
from
(
select MD.ImprovementNotation,MD.MeasureKey,MeasureName,InverseInd,date_YearMonth,attrib_Measure,MeasureLevel1Key,MeasureLevel1Desc,sum(measure_MemberInd) as SumDnum
from [dbmSemanticAnalytics].fact. PopulationMembersMonthly P
left join [dbmSemanticAnalytics].[Dim].[MeasureDefinition] MD
on P.attrib_Measure = MD.MeasureKey
where date_yearMonth = cast( datepart(yyyy,getdate())as varchar)+'_01'
group by  MD.ImprovementNotation,MD.MeasureKey,MeasureName,InverseInd,date_YearMonth,attrib_Measure,MeasureLevel1Key,MeasureLevel1Desc
) Num
full outer join
(
select MD.ImprovementNotation,MD.MeasureKey,MeasureName,InverseInd,date_YearMonth,attrib_Measure,MeasureLevel1Key,MeasureLevel1Desc,sum(measure_MemberInd) as SumNum
from [dbmSemanticAnalytics].fact.MeasureMembersMonthly  P
full outer join [dbmSemanticAnalytics].[Dim].[MeasureDefinition] MD
on P.attrib_Measure = MD.MeasureKey
where date_yearMonth = cast( datepart(yyyy,getdate())as varchar)+'_01'
group by  MD.ImprovementNotation,MD.MeasureKey,MeasureName,InverseInd,date_YearMonth,attrib_Measure,MeasureLevel1Key,MeasureLevel1Desc
) DNum

on Num.attrib_Measure = DNum.attrib_Measure and Num.date_YearMonth = DNum.date_YearMonth 
Left Join
(
select MeasureKey,MeasureName,[Weight]/CombniedWeight as KPICombniedWeight
from [dbmSemanticAnalytics].[Dim].[MeasureDefinition] MD
left join
(
select MeasureLevel1Key,MeasureLevel1Desc,sum(weight) as CombniedWeight
from [dbmSemanticAnalytics].[Dim].[MeasureDefinition]
group by MeasureLevel1Key,MeasureLevel1Desc) DW
on DW.MeasureLevel1Key = MD.MeasureLevel1Key
) MDW

on Num.MeasureKey = MDW.MeasureKey
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

) A

) B
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
group by  MeasureLevel1Key,MeasureLevel1Desc

order by 1