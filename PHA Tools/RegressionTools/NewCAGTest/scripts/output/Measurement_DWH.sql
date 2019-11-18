---ACT---
Set nocount on
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR
SELECT PME.[MeasurementEventId_Root] AS MeasurementEventId_Root
	,PME.[MeasurmentEventId_Extension] AS MeasurmentEventId_Extension
	,[MeasurementId_Root]
	,[MeasurementId_Extension]
	,PME.[PatientId_Root] AS PatientId_Root
	,dbmSemanticAnalyticsSTG.dbo.DecryptHR(mp.Enc_Extension) AS PatientId_Extension
	,PME.[EncounterId_Root] AS EncounterId_Root
	,PME.[EncounterId_Extension] AS EncounterId_Extension
	,PME.MeasurementCode
	,PME.[AuthorCodeProvider_Root]
	,PME.[AuthorCodeProvider_Extension]
	,[PerformerCodeProvider_Root]          
	,[PerformerCodeProvider_Extension]
	,[ReferringCodeProvider_Root]
	,[ReferringCodeProvider_Extension]
FROM 
[dbmSemanticAnalytics].[Fact].[Measurement] FA  LEFT JOIN  
     [dbmSemanticAnalyticsSTG].[Persist].[FactMeasurement] PME
on FA.id_Measurement = PME.Id_Measurement
     left  JOIN
	 [dbmSemanticAnalyticsSTG].Persist.MappingPatient mp 
	 on mp.id_Extension = PME.[PatientId_Extension] and 
	 mp.Id_Root= PME.[PatientId_Root]
WHERE 
--[FlagNew] = 1 
  [FlagDelete]=0 
ORDER BY MeasurementEventId_Root
	,MeasurmentEventId_Extension
	,MeasurementId_Extension;