--SET ANSI_WARNINGS ON
SET NOCOUNT ON
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR;
SELECT [PPOLId]
	,attrib_Measure
	,date_YearMonth
	,measure_MemberInd
	,sys_PartitionDate
	,attrib_PatientAge
FROM [dbmSemanticAnalytics].fact.PopulationMembersMonthly PM
LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[MappingPatient] P ON P.PatientKey = PM.id_Patient
WHERE Pm.attrib_Measure IN (
		1620
		,1621
		,1622
		,1623
		,1624
		)
		AND   [dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](p.Enc_Extension) like 'PHA_EncAT%'
ORDER BY [PPOLId]
	,attrib_Measure
	,date_YearMonth
	,measure_MemberInd
	,sys_PartitionDate
	,attrib_PatientAge
