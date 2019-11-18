SET nocount ON 

select    replace(MeasureName,N'≤',N'=') MeasureName,  MeasureKey,  left( DateName( month , DateAdd( month , cast(right(date_YearMonth,2) as int) , -1 ) ),3) + '-' + right(left(date_YearMonth,4),2) Date, cast(Round(SumNum/SumDnum,3) as money) as KPIScore 
from (
select Num.MeasureLevel2Key,Num.MeasureLevel2Desc,Num.ImprovementNotation,Num.InverseInd,Num.MeasureKey,Num.MeasureName, cast(case when Num.InverseInd = 1 then isnull(SumNum,0.00000000) else SumDnum-isnull(SumNum,0.00000000) end as money) as SumNum, cast(SumDnum as money) as SumDnum, num.date_YearMonth
from (
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
)T
order by 1,2,3
