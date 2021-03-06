
USE [dbmSemanticAnalytics]
GO

SELECT [Original_ClaimID]
      ,F.[Claim_Line_Number]
      ,F.[id_Patient]
      ,[org_Assigned]
      ,[provider_Performer]
      ,[Id_Program]
      ,F.[Line_From_DateENC]
      ,F.[Line_Thru_DateENC]
      ,F.[Claim_From_DateENC]
      ,F.[Claim_Thru_DateENC]
      ,[attrib_Claim_Type_Code]
      ,ISNULL([attrib_Claim],-1)[attrib_Claim]
      ,[attrib_PatientAge]
      ,ISNULL([attrib_Claim_Payer_Code],-1)[attrib_Claim_Payer_Code]
      ,cast([measure_Claim_Line_Amount] as decimal(15,2)) [measure_Claim_Line_Amount]
  FROM [dbmSemanticAnalytics].[Fact].[ClaimsLines] F
   join [dbmSemanticAnalyticsSTG].[Persist].[ClaimRevenueCenter] PCR
     ON F.Original_ClaimID = PCR.Current_ClaimID And F.Claim_Line_Number = PCR.Claim_Line_Number and PCR.FlagNew = 1
  ORDER BY 1,15