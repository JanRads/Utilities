SET ANSI_WARNINGS OFF 
SET NOCOUNT ON 

select [PPOLId],attrib_Measure,date_YearMonth,measure_MemberInd,sys_PartitionDate,attrib_PatientAge
from [dbmSemanticAnalytics].fact.PopulationMembersMonthly PM
left join [dbmSemanticAnalyticsSTG].[Persist].[MappingPatient] P
on P.PatientKey = PM.id_Patient
Where Pm.attrib_Measure in(1615,1616)
order by [PPOLId],attrib_Measure,date_YearMonth,measure_MemberInd,sys_PartitionDate,attrib_PatientAge
