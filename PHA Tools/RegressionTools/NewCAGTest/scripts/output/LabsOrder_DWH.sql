Set nocount on
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR
SELECT b.[LabRequest_Root] AS LabRequestRoot
		
		,b.[LabRequest_Ext] LabRequestExtension 
		,b.LabRequest_PriorityCode 
		,b.LabRequest_PriorityCodeSystem
		,b.Patient_Root Patient_Id_Root 
		,dbmSemanticAnalyticsSTG.dbo.DecryptHR(mp.Enc_Extension) AS [PatientId_Extension]
		,Encounter_Root Encounter_Id_Root
		,b.Encounter_Ext EncounterId_Extension
		,cast(convert(char(11),(a.[CollectionDateEnc]), 113) as date) As CollectionDate
        ,cast(convert(char(11),(a.[OrderDateEnc]), 113) as date) As OrderDate
		--,a.[OrderDateEnc]  As OrderDate
FROM dbmSemanticAnalytics.Fact.LaboratoriesOrder a
left  JOIN
 [dbmSemanticAnalyticsSTG].[Persist].[FactLabsOrders] b
 ON a.id_LabOrder = b.[Id_LabOrder]
 left  JOIN
	     [dbmSemanticAnalyticsSTG].Persist.MappingPatient mp
		on mp.[Id_Extension] = b.[Patient_Ext] and mp.Id_Root= b.[Patient_Root]

 ORDER BY 2
