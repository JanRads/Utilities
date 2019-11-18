USE [dbmSemanticAnalyticsSTG]
GO

EXEC dbo.OpenHHR
;

with CTE
as
(
select	ConditionKey, 
		Condition_Root, 
		Condition_Ext, 
		Patient_Root, 
		Patient_Ext, 
		AssignedOrg_Root, 
		AssignedOrg_Ext, 
		Performer_Root, 
		Performer_Ext, 
		ConditionCode, 
		ConditionCodeSystem, 
		ConditionClass, 
		ConditionTypeCode, 
		ConditionTypeCodeSystem, 
		StatusCode, 
		StatusCodeSystem, 
		PersistencyCode, 
		PersistencyCodeSystem, 
		SeverityCode, 
		SeverityCodeSystem, 
		UncertaintyCode, 
		UncertaintyCodeSystem, 
		isNegated, 
		LastUpdated, 
		NodeID, 
		DeleteKey, 
		EncounterID_Root, 
		EncounterID_Ext, 
		ConditionStartDate, 
		ConditionEndDate, 
		[Count], 
		[Priority], 
		IsPrimary, 
		SourceSystemId_Root, 
		SourceSystemId_Extension, 
		TargetSiteCode, 
		TargetSiteCodeSystem, 
		MethodCode, 
		MethodCodeSystem, 
		AllergyId_Root, 
		AllergyIdId_Extension, 
		ImmunizationId_Root, 
		ImmunizationId_Extension, 
		ProcedureId_Root, 
		ProcedureId_Extension, 
		ProcedureConditionTypeCode, 
		ProcedureConditionTypeCodeSystem, 
		ProcedureConditionpriorityNumber, 
		PC.dbmAvailabilityTime, 
		PC.FlagNew, 
		sys_PartitionDate, 
		ConditionStartDateEnc, 
		ConditionEndDateEnc, 
		Original_ClaimID, 
		[FileName], 
		Flag_Claims, 
		ConditionCodeKey,
		id_Patient, 
		ID_Claims,
		PADMINCODE.BaselineCode,
		PADMINCODE.BaselineCodeSystem
from [Persist].[FactConditions] PC
left JOIN  Persist.DimAdminCodes PADMINCODE
		  on PC.ConditionCodeKey = PADMINCODE.AdminCodeKey 
)


  SELECT	C.ConditionKey [id_Condition]
	        ,CD.id_Patient 
			,CD.[ConditionCodeKey] [attrib_ConditionCode]
			,CD.[Claim_From_DateENC] [ConditionStartDateEnc]
			,CD.[Claim_Thru_DateENC] [ConditionEndDateEnc]
			,CD.Current_ClaimID [Original_ClaimID]
			,C.[Flag_Claims]
  FROM [Persist].[ClaimDiagnosis_Code] CD
		left JOIN  Persist.DimAdminCodes PADMINCODE
			  on cd.ConditionCodeKey = PADMINCODE.AdminCodeKey 
		INNER JOIN  CTE C
				ON CD.id_Patient = C.id_Patient
			 AND
			   PADMINCODE.BaselineCode = C.BaselineCode AND PADMINCODE.BaselineCodeSystem = C.BaselineCodeSystem
			  		 AND                            -------------------------------------------------------------------------------       
		 C.Flag_Claims = 1               -- need to remove this condition after fixing Persist dim admincodes duplicate rows 
		and c.ID_Claims=cd.ID_Claims                               -------------------------------------------------------------------------------   
  order by 1
  
  