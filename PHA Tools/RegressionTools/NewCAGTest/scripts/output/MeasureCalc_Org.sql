Select date_YearMonth, attrib_Measure [attrib_Measure], org_RelatedProvider [attrib_Org],count(*) [measure_population]
from (
select   cast( datepart(yyyy,getdate())as varchar)+'_01' [date_YearMonth], attrib_Measure,  org_RelatedProvider
from (
select *
from dbmSemanticAnalytics.Fact.MeasureMembersMonthly
where date_YearMonth =  cast( datepart(yyyy,getdate())as varchar)+'_01'
--and attrib_Measure = 1121
)T1 join
(
select *
from dbmSemanticAnalytics.Factless.PopulationPCPOrg
--where  org_RelatedProvider >0

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
group by date_YearMonth, attrib_Measure, org_RelatedProvider
order by date_YearMonth,attrib_Measure , org_RelatedProvider 