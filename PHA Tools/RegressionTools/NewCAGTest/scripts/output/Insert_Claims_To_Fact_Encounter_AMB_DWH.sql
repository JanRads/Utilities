USE [dbmSemanticAnalytics]
GO


SELECT 
      [id_Encounter]
      ,[id_Patient]
      ,[AdmissionDateEnc]
      ,[Original_ClaimID]
      ,[Flag_Claims]
      ,[attrib_Claim_Code_Key]
  FROM [dbmSemanticAnalytics].[Fact].[AmbulatoryVisits]
  where  Original_ClaimID IS NOT NULL And Original_ClaimID<> -1 and flag_claims = 1
  order by 1

