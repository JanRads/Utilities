USE [dbmSemanticAnalytics]
GO

  SELECT 
		[id_Imaging]
		,[id_Patient]
		,[ImagingStudy_EffectiveDateEnc]
		,[Original_ClaimID]
		,[Flag_Claims]
		,[ImagingClaimCodeKey]
  FROM  [Fact].[Imaging]  
  WHERE  ISNULL(Original_ClaimID, -1)> -1 and [Flag_Claims] = 0
  order by 1