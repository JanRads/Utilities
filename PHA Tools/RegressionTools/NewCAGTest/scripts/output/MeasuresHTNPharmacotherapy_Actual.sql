SET ANSI_WARNINGS OFF
SET NOCOUNT ON

SELECT DISTINCT PPOLId
	,attrib_Measure
	,date_YearMonth
	--,id_PopulationMember
	,measure_MemberInd
	,sys_PartitionDate
	,attrib_PatientAge
FROM [dbmSemanticAnalytics].fact.MeasureMembersMonthly MM
LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[MappingPatient] P ON P.PatientKey = MM.id_Patient
WHERE attrib_Measure = 1614
ORDER BY PPOLId
	,attrib_Measure
	,date_YearMonth
	--,id_PopulationMember
	,measure_MemberInd
	,sys_PartitionDate
	,attrib_PatientAge
