--SET ANSI_WARNINGS OFF
SET NOCOUNT ON
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR;

SELECT DISTINCT [PPOLId]
	,attrib_Measure
	,date_YearMonth
	,measure_MemberInd
	,sys_PartitionDate
	,attrib_PatientAge
FROM [dbmSemanticAnalytics].fact.PopulationMembersMonthly PM
INNER JOIN [dbmSemanticAnalyticsSTG].[Persist].[MappingPatient] P ON P.PatientKey = PM.id_Patient
WHERE --PPOLId> 9000369
[dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](p.Enc_Extension) like 'PHA_EncAT%'
ORDER BY [PPOLId]
	,attrib_Measure
	,date_YearMonth
	,measure_MemberInd
	,sys_PartitionDate
	,attrib_PatientAge
