Set nocount on
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR

SELECT 
 
 PME.[MeasurementEventId_Root] AS MeasurementEventId_Root, PME.[MeasurmentEventId_Extension]AS MeasurmentEventId_Extension, 
 --ME.[id_Encounter], ME.[id_Patient],
 PME.[PatientId_Root] AS PatientId_Root
 ,dbmSemanticAnalyticsSTG.dbo.DecryptHR(mp.Enc_Extension) AS PatientId_Extension
 ,PME.[EncounterId_Root] AS EncounterId_Root
 ,PME.[EncounterId_Extension] AS EncounterId_Extension, PME.[CareProviderId_Root], PME.[CareProviderId_Extension]

FROM [dbmSemanticAnalytics].[Fact].[Measurement] ME
	INNER  JOIN
		[dbmSemanticAnalyticsSTG].[Persist].[FactMeasurement] PME
		ON ME.[id_Measurement] = PME.[Id_Measurement]
		left  JOIN
	[dbmSemanticAnalyticsSTG].Persist.MappingPatient mp on mp.id_Extension = PME.[PatientId_Extension] and mp.Id_Root= PME.[PatientId_Root]


	--LEFT JOIN
	--	Persist.DimOrganization o 
	--	ON ME.[org_PerformingUnit] = o.OrganizationKeyOld 
ORDER BY  MeasurmentEventId_Extension, MeasurementEventId_Root


	

