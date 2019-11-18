USE [dbmSemanticAnalyticsSTG]
GO


SELECT 
         FP.[id_Procedure]
        ,FP.[id_Patient]  
        ,FP.[attrib_Procedure] 
        ,FP.[ProcedureStartDateEnc]
        ,FP.[Original_ClaimID]
        ,FP.[Flag_Claims]
        ,FP.[attrib_HCPCS_Code_Key]
  FROM [dbmSemanticAnalytics].[Fact].[Procedures] FP
where  FP.Original_ClaimID IS NOT NULL
and Flag_Claims = 0
order by 1