SET ANSI_WARNINGS OFF 
SET NOCOUNT ON 

select DISTINCT [PPOLId],attrib_Measure,date_YearMonth,measure_MemberInd,sys_PartitionDate,attrib_PatientAge
from [dbmSemanticAnalytics].fact.PopulationMembersMonthly PM
left join [dbmSemanticAnalyticsSTG].[Persist].[MappingPatient] P
on P.PatientKey = PM.id_Patient
WHERE attrib_Measure IN( 1611 , 1612 , 1613)
ORDER BY PPOLId
	,attrib_Measure
	,date_YearMonth
	--,id_PopulationMember
	,measure_MemberInd
	,sys_PartitionDate
	,attrib_PatientAge