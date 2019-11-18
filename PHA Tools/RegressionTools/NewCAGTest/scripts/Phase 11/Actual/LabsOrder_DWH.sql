Set nocount on
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR
SELECT distinct 
         b.[LabRequest_Root] AS LabRequestRoot
		,b.[LabRequest_Ext] LabRequestExtension 
		,b.LabRequest_PriorityCode 
		,b.LabRequest_PriorityCodeSystem
		,b.Patient_Root Patient_Id_Root 
		,dbmSemanticAnalyticsSTG.dbo.DecryptHR(mp.Enc_Extension) AS [PatientId_Extension]
		,Encounter_Root Encounter_Id_Root
		,b.Encounter_Ext EncounterId_Extension
		,cast(convert(char(11),(b.[CollectionDateEnc]), 113) as date) As CollectionDate
        ,cast(convert(char(11),(b.[OrderDateEnc]), 113) as date) As OrderDate
FROM dbmSemanticAnalytics.Fact.LaboratoriesOrder a
LEFT JOIN
 [dbmSemanticAnalyticsSTG].[Persist].[FactLabsOrders] b
 ON a.id_LabOrder = b.[Id_LabOrder]
 left  JOIN
	     [dbmSemanticAnalyticsSTG].Persist.MappingPatient mp
		on mp.[Id_Extension] = b.[Patient_Ext] and mp.Id_Root= b.[Patient_Root]
where a.Flag_Claims=0 and b.Encounter_Ext  is not null
 ORDER BY 2;
