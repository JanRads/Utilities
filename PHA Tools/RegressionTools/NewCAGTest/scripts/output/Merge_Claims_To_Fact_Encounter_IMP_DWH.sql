USE [dbmSemanticAnalytics]
GO


SELECT 
     [id_Admission],
      [id_Patient]
      ,[AdmissionDateEnc]
      ,[Original_ClaimID]
      ,[Flag_Claims]
      ,[attrib_Claim_Code_Key]
  FROM [dbmSemanticAnalytics].[Fact].[Admissions]
  where  Original_ClaimID IS NOT NULL And Original_ClaimID<> -1 and flag_claims = 0
  order by 1

