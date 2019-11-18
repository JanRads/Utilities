USE [dbmSemanticAnalyticsSTG]
GO

EXEC dbo.OpenHHR
;

with CTE
as
(
select [Procedure_ID]
      ,[Procedure_Root]
      ,[Procedure_Ext]
      ,[SourceSystemId_Root]
      ,[SourceSystemId_Extension]
      ,[PatientId_Root]
      ,[Patient_Ext]
      ,[Encounter_Root]
      ,[Encounter_Ext]
      ,[ProcedureClass]
      ,[ProcedureTypeCode]
      ,[ProcedureTypeCodeSystem]
      ,[ProcedureCode]
      ,[ProcedureCodeSystem]
      ,[ProcedureStartDate]
      ,[ProcedureEndDate]
      ,[AssignedOrg_Root]
      ,[AssignedOrg_Ext]
      ,[PreformerUnit_Root]
      ,[PerformerUnit_Ext]
      ,[dbmAvailibilityTime]
      ,[StatusCode]
      ,[StatusCodeSystem]
      ,[PriorityCode]
      ,[PriorityCodeSystem]
      ,[UncertaintyCode]
      ,[UncertaintyCodeSystem]
      ,[MethodCode]
      ,[MethodCodeSystem]
      ,[ApproachSiteCode]
      ,[ApproachSiteCodeSystem]
      ,[TargetSiteCode]
      ,[TargetSiteCodeSystem]
      ,[LocationTypeCode]
      ,[LocationTypeCodeSystem]
      ,[ProcedureMainId_Root]
      ,[ProcedureMainId_Extension]
      ,[ProcedureRef_TypeCodeCode]
      ,[ProcedureRef_TypeCodeSystem]
      ,[MoodCode]
      ,[MoodCodeSystem]
      ,[SequenceNumber]
      ,[DeleteKey]
      ,[NodeId]
      ,[LastUpdated]
      ,PP.[FlagNew]
      ,[sys_PartitionDate]
      ,[ProcedureStartDateEnc]
      ,[ProcedureEndDateEnc]
      ,[ProcedureCodeKey]
      ,[Original_ClaimID]
      ,[FileName]
      ,[Flag_Claims]
      ,[ProcedureCodeKey_HCPCS]
      ,[id_Patient]
	  ,PADMINCODE.BaselineCode
	  ,PADMINCODE.BaselineCodeSystem
from [dbmSemanticAnalyticsSTG].[Persist].[FactProcedures] PP
left JOIN  Persist.DimAdminCodes PADMINCODE
		  on PP.[ProcedureCodeKey] = PADMINCODE.AdminCodeKey 
)

	  select C.Procedure_ID [id_Procedure]
	        ,C.id_Patient 
			,C.[ProcedureCodeKey] [attrib_Procedure]
			,c.ProcedureStartDateEnc [ProcedureStartDateEnc]
			,PCP.Current_ClaimID [Original_ClaimID]
			,C.[Flag_Claims]
			,PCP.[ProcedureCodeKey_HCPCS]
  FROM [dbmSemanticAnalyticsSTG].[Persist].[ClaimProcedureCode] PCP
  left JOIN  Persist.DimAdminCodes PADMINCODE
		  on PCP.ProcedureCodeKey_ICD = PADMINCODE.AdminCodeKey 
  JOIN 
       CTE C
	ON PCP.id_Patient = C.id_Patient
	 AND
	   CONVERT(date,[dbo].[DecryptHR](PCP.Procedure_Performed_DateEnc)) = CONVERT(date,[dbo].[DecryptHR](C.ProcedureStartDateEnc)) 
	 AND
	   PADMINCODE.BaselineCode = C.BaselineCode AND PADMINCODE.BaselineCodeSystem = C.BaselineCodeSystem
	where c.Flag_Claims = 1 and original_claimID is not Null
   order by 1
  
  