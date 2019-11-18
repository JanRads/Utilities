---EXP---
USE [dbmClinicalAnalyticsGateway]
Go 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Set nocount on

SELECT --id_Encounter,
       [EncounterId_Root] Encounter_root
       ,[EncounterId_Extension] Encounter_Ext
       ,SourceSystemId_Root
       ,SourceSystemId_Extension
       ,FE.[PatientId_Root] Patient_Root
       ,FE.[PatientId_Extension] Patient_Ext
       ,[AssignedOrgId_Root] AssignedOrg_Root
       ,[AssignedOrgId_Extension] AssignedOrg_Ext
       ,[ReferringOrgId_Root] ReferrerOrg_Root
       ,[ReferringOrgId_Extension] ReferrerOrg_Ext
       ,[ReferringCareProviderId_Root]  ReferringPhysician_Root
       ,[ReferringCareProviderId_Extension]  ReferringPhysician_Ext
       ,[DischargingCareProviderId_Root]  DischargingPhysician_Root
       ,[DischargingCareProviderId_Extension]  DischargingPhysician_Ext
       ,[AdmittingCareProviderId_Root]  AdmittingPhysician_Root
       , [AdmittingCareProviderId_Extension] AdmittingPhysician_Ext
       , [AttendingCareProviderId_Root] AttendingPhysician_Root
       , [AttendingCareProviderId_Extension] AttendingPhysician_Ext
	   --,dbmSemanticAnalyticsSTG.dbo.Convert_Date(StartDate) AdmissionDate
	  -- ,dbmSemanticAnalyticsSTG.dbo.Convert_Date(EndDate) DischargeDate
	  ,YEAR([StartDate])*10000+MONTH([StartDate])*100+1 AdmissionDate 
	  ,YEAR([EndDate])*10000+MONTH([EndDate])*100+1 DischargeDate
     --,YEAR([StartDate])*10000+MONTH([StartDate])*100+DAY([StartDate]) AdmissionDate
     --,YEAR([EndDate])*10000+MONTH([EndDate])*100+DAY([EndDate]) DischargeDate
       ,[StatusCode] AdmissionStatusCode
       ,[StatusCodeSystem] AdmissionStatusCodeSystem
       ,[PriorityCode]  AdmissionPriorityCode
       ,[PriorityCodeSystem]  AdmissionPriorityCodeSystem
       ,DischargeDispositionCode
       ,DischargeDispositionCodeSystem
       ,AdmissionReferralSourceCode
       ,AdmissionReferralSourceCodeSystem
       ,[DischargeDiagnosisPrimaryCode]  DischargeDiagnosisPrimaryCode
       ,[DischargeDiagnosisPrimaryCodeSystem] DischargeDiagnosisPrimaryCodeSystem
       ,[AdmissionDiagnosisPrimaryCode] AdmissionDiagnosisPrimaryCode
       ,[AdmissionDiagnosisPrimaryCodeSystem] AdmissionDiagnosisPrimaryCodeSystem
       ,EncounterCode
       ,EncounterCodeSystem
       ,Fe.[DeleteKey] FlagDelete
       , [EncounterClassIndicator] Type
       --,sys_PartitionDate
FROM (SELECT *
,ROW_NUMBER() OVER (
                     PARTITION BY EncounterId_Root,[EncounterId_Extension] ORDER BY [EncounterRowID] DESC
                     ) AS RS
                     FROM [Fact].[EncountersExt_v]
WHERE  [EncounterId_Extension] LIKE N'PHA_EncAT_enc%'
) FE
WHERE RS=1
ORDER BY Encounter_Ext
;