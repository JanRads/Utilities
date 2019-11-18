	SET ANSI_WARNINGS OFF 

SET NOCOUNT ON 

select  MeasureKey,MeasureName, round(cast(cast(SumNum as money)/cast(SumDnum as money) as money),3)  as KPIScore,
cast(SumNum as int) as Numerator,cast(SumDnum as int) as Denominator
from
(
select Num.InverseInd,Num.MeasureKey,Num.MeasureName, cast(case when Num.InverseInd = 1 then isnull(SumNum,0.00000000) else SumDnum-isnull(SumNum,0.00000000) end as money) as SumNum, cast(SumDnum as money) as SumDnum
from
(
select MD.MeasureKey,MeasureName,InverseInd,date_YearMonth,attrib_Measure,sum(measure_MemberInd) as SumDnum
from [dbmSemanticAnalytics].fact. PopulationMembersMonthly P
left join [dbmSemanticAnalytics].[Dim].[MeasureDefinition] MD
on P.attrib_Measure = MD.MeasureKey
where date_yearMonth = cast( datepart(yyyy,getdate())as varchar)+'_01'
group by  MD.MeasureKey,MeasureName,InverseInd,date_YearMonth,attrib_Measure
) Num
full outer join
(
select MD.MeasureKey,MeasureName,InverseInd,date_YearMonth,attrib_Measure,sum(measure_MemberInd) as SumNum
from [dbmSemanticAnalytics].fact.MeasureMembersMonthly  P
full outer join [dbmSemanticAnalytics].[Dim].[MeasureDefinition] MD
on P.attrib_Measure = MD.MeasureKey
where date_yearMonth = cast( datepart(yyyy,getdate())as varchar)+'_01'
group by  MD.MeasureKey,MeasureName,InverseInd,date_YearMonth,attrib_Measure
) DNum

on Num.attrib_Measure = DNum.attrib_Measure and Num.date_YearMonth = DNum.date_YearMonth 
) A
order by 1