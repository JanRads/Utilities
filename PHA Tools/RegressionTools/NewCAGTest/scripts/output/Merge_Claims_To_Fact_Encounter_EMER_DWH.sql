
USE [dbmSemanticAnalytics]
GO


SELECT 
     [id_EDVisit],
      [id_Patient]
      ,[AdmissionDateEnc]
      ,[Original_ClaimID]
      ,[Flag_Claims]
      ,[attrib_Claim_Code_Key]
  FROM [dbmSemanticAnalytics].[Fact].[EDVisits]
  where  Original_ClaimID IS NOT NULL And Original_ClaimID<> -1 and [Flag_Claims] = 0
  order by 1





