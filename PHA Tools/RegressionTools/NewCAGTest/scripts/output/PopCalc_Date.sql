--expected

Select date_YearMonth, attrib_Measure [attrib_Measure], count(*) [measure_population]
from (
select  date_YearMonth [date_YearMonth], attrib_Measure
from (
select *
from dbmSemanticAnalytics.Fact.PopulationMembersMonthly
where left(date_YearMonth,4) =  cast( datepart(yyyy,getdate())as varchar)
--and attrib_Measure = 1121
)T1
 join
(
select *
from dbmSemanticAnalytics.Factless.PopulationPCPOrg
--where org_RelatedProvider > 0 
) PPR
on T1.id_PopulationMember = PPR.id_PopulationMember
inner join (
Select AgeFK, GroupFK
from
dbmSemanticAnalytics.Factless.AgeInGroup AgeI
inner join
dbmSemanticAnalytics.Dim.AgeGroups AgeG
on GroupFK = AgeG.AgeGroupKey
where AgeG.HierarchyID = 1) Age
on T1.attrib_PatientAge = AgeFK
)T
where date_YearMonth =cast( datepart(yyyy,getdate())as varchar)+'_'+CONVERT(varchar(2), GETDATE(), 101)
group by date_YearMonth, attrib_Measure
order by attrib_Measure, date_YearMonth