	SET ANSI_WARNINGS OFF 

SET NOCOUNT ON 

select  MeasureLevel2Desc MeasureName , left( DateName( month , DateAdd( month , cast(right(date_YearMonth,2) as int) , -1 ) ),3) + '-' + right(left(date_YearMonth,4),2) Date ,  cast(round(sum(KPIScore),2) as money) as KPIScore
from (
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select  MeasureLevel2Key,MeasureLevel2Desc,MeasureKey,MeasureName,
case when ImprovementNotation = 1 then round(cast(cast(SumNum as money)/cast(SumDnum as money) as money),3) 
when ImprovementNotation = 2 then round(1-cast(cast(SumNum as money)/cast(SumDnum as money) as money),3) end * KPICombniedWeight as KPIScore,
cast(SumNum as int) as Numerator,cast(SumDnum as int) as Denominator, KPICombniedWeight, date_YearMonth
from
(

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
select Num.MeasureLevel2Key,Num.MeasureLevel2Desc,Num.ImprovementNotation,Num.InverseInd,Num.MeasureKey,Num.MeasureName, cast(case when Num.InverseInd = 1 then isnull(SumNum,0.00000000) else SumDnum-isnull(SumNum,0.00000000) end as money) as SumNum, cast(SumDnum as money) as SumDnum, KPICombniedWeight, num.date_YearMonth
from
(
select MD.ImprovementNotation,MD.MeasureKey,MeasureName,InverseInd,date_YearMonth,attrib_Measure,MeasureLevel2Key,MeasureLevel2Desc,sum(measure_MemberInd) as SumDnum
from (
select T1.*
from dbmSemanticAnalytics.fact.PopulationMembersMonthly T1
) P
left join [dbmSemanticAnalytics].[Dim].[MeasureDefinition] MD
on P.attrib_Measure = MD.MeasureKey
where left(date_yearMonth,4) = cast( datepart(yyyy,getdate())as varchar)
group by  MD.ImprovementNotation,MD.MeasureKey,MeasureName,InverseInd,date_YearMonth,attrib_Measure,MeasureLevel2Key,MeasureLevel2Desc
) Num
full outer join
(
select MD.ImprovementNotation,MD.MeasureKey,MeasureName,InverseInd,date_YearMonth,attrib_Measure,MeasureLevel1Key,MeasureLevel1Desc,sum(measure_MemberInd) as SumNum
from (
select T1.*
from [dbmSemanticAnalytics].fact.MeasureMembersMonthly T1
) P
full outer join [dbmSemanticAnalytics].[Dim].[MeasureDefinition] MD
on P.attrib_Measure = MD.MeasureKey
where left(date_yearMonth,4) = cast( datepart(yyyy,getdate())as varchar)
group by  MD.ImprovementNotation,MD.MeasureKey,MeasureName,InverseInd,date_YearMonth,attrib_Measure,MeasureLevel1Key,MeasureLevel1Desc
) DNum

on Num.attrib_Measure = DNum.attrib_Measure and Num.date_YearMonth = DNum.date_YearMonth
Left Join
(
select MeasureKey,MeasureName,[Weight]/CombniedWeight as KPICombniedWeight, Weight, CombniedWeight, md.MeasureLevel2Key, date_YearMonth
from [dbmSemanticAnalytics].[Dim].[MeasureDefinition] MD
left join
(
select  MeasureLevel2Key,MeasureLevel2Desc,sum(case when pat_cnt = 0 then 0 else weight end) as CombniedWeight, date_YearMonth
from (
select *
from [dbmSemanticAnalytics].[Dim].[MeasureDefinition]) T1
left join
(
select sum(measure_MemberInd) pat_cnt, attrib_Measure, date_YearMonth
from (
select T1.*
from dbmSemanticAnalytics.fact.PopulationMembersMonthly T1
) PMM
group by attrib_Measure, date_YearMonth
) T2
on T1.MeasureKey = T2.attrib_Measure
group by MeasureLevel2Key,MeasureLevel2Desc, date_YearMonth

) PM
on md.MeasureLevel2Key = PM.MeasureLevel2Key
) MDW

on Num.MeasureKey = MDW.MeasureKey
and Num.date_YearMonth = MDW.date_YearMonth
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

) A
--order by MeasureKey, GenderDesc
) B
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
group by  MeasureLevel2Key,MeasureLevel2Desc, date_YearMonth

order by 1,2