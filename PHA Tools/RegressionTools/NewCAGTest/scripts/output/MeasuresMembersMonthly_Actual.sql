--SET ANSI_WARNINGS ON
--go
SET NOCOUNT ON
go

EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR;

SELECT PPOLId
,[dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](p.Enc_Extension) Id_Extension
	,attrib_Measure
	,date_YearMonth
	--,id_PopulationMember
	,measure_MemberInd
	,sys_PartitionDate
	,attrib_PatientAge
FROM [dbmSemanticAnalytics].fact.MeasureMembersMonthly MM
INNER JOIN [dbmSemanticAnalyticsSTG].[Persist].[MappingPatient] P ON P.PatientKey = MM.id_Patient
WHERE --PPOLId> 9000369
[dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](p.Enc_Extension) like 'PHA_EncAT%'
ORDER BY PPOLId
	,attrib_Measure
	,date_YearMonth
	--,id_PopulationMember
	,measure_MemberInd
	,sys_PartitionDate
	,attrib_PatientAge
