SET ANSI_WARNINGS OFF 
SET NOCOUNT ON 

select DISTINCT [PPOLId],attrib_Measure,date_YearMonth,measure_MemberInd,sys_PartitionDate,attrib_PatientAge
from [dbmSemanticAnalytics].fact.PopulationMembersMonthly PM
left join [dbmSemanticAnalyticsSTG].[Persist].[MappingPatient] P
on P.PatientKey = PM.id_Patient
where attrib_Measure = 1614
order by [PPOLId],attrib_Measure,date_YearMonth,measure_MemberInd,sys_PartitionDate,attrib_PatientAge