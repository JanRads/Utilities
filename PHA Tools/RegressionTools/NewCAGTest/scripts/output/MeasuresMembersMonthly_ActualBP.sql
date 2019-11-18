--SET ANSI_WARNINGS OFF
SET NOCOUNT ON
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR;
SELECT PPOLId
	,attrib_Measure
	,date_YearMonth
	--,id_PopulationMember
	,measure_MemberInd
	,sys_PartitionDate
	,attrib_PatientAge
FROM [dbmSemanticAnalytics].fact.MeasureMembersMonthly MM
LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[MappingPatient] P ON P.PatientKey = MM.id_Patient
WHERE mm.attrib_Measure in (1620,1621,1622,1623,1624)
AND [dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](p.Enc_Extension) like 'PHA_EncAT%'
ORDER BY PPOLId
	,attrib_Measure
	,date_YearMonth
	--,id_PopulationMember
	,measure_MemberInd
	,sys_PartitionDate
	,attrib_PatientAge
