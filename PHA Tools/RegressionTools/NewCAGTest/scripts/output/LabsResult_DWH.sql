Set nocount on
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR

	SELECT    c.LabRequest_Root LabRequestRoot
			, c.LabRequest_Ext LabRequestExtension
			, b.LabResult_Root LabResultId_Root
			, b.LabResult_Ext LabResultId_Extension
			, b.ClusterCode, b.ClusterCodeSystem
			, b.Patient_Root Patient_Id_Root 
			,dbmSemanticAnalyticsSTG.dbo.DecryptHR(mp.Enc_Extension) AS [PatientId_Extension]
			,cast(convert(char(11),(a.[CollectionDateEnc]), 113) as date) As CollectionDate
			,cast(convert(char(11),(a.[ResultDateEnc] ), 113) as date) As ResultDate


FROM dbmSemanticAnalytics.Fact.LaboratoriesResult a
LEFT JOIN
 [dbmSemanticAnalyticsSTG].[Persist].FactLabsResults b
 ON a.[id_LabResult] = b.id_LabResult
 JOIN 
  [dbmSemanticAnalyticsSTG].[Persist].FactLabsOrders c
  ON b.id_LabOrder = c.Id_LabOrder
   left  JOIN
	     [dbmSemanticAnalyticsSTG].Persist.MappingPatient mp
		on mp.[Id_Extension] = b.[Patient_Ext] and mp.Id_Root= b.[Patient_Root]
ORDER BY 4
