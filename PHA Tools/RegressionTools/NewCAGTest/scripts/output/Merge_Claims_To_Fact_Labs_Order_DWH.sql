USE [dbmSemanticAnalytics]
GO


  SELECT 
		[id_LabOrder]
		,[id_Patient]
		,[CollectionDateEnc]
		,[Original_ClaimID]
		,[Flag_Claims]
		,LabsClaimBaseLineCodeKey
  FROM   [dbmSemanticAnalytics].[Fact].[LaboratoriesOrder] 
  WHERE  ISNULL(Original_ClaimID, -1)> -1
  order by 1