
/* This query is testing specific Imagings - ImagingStudyId_Extension LIKE N'PHA2_PBC_AT13img%' - 
please do not add Imagings wth the prefix PHA2_PBC_AT13img, because it will cause the test to fail  */

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
set nocount on
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR;


SELECT ---id_Imaging
	ImagingStudyId_Root
	,ImagingStudyId_Extension
	,SourceSystemId_Root
	,SourceSystemId_Extension
	,M.PatientId_Root
	,[dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](mp.Enc_Extension) PatientId_Extension
	,EncounterId_Root
	,EncounterId_Extension
	,ImagingRequestId_Root
	,ImagingRequest_Extension
	,DocumentId_Root
	,DocumentId_Extension
	,ProcedureId_Root
	,ProcedureId_Extension
	,ImagingRequest_MoodCode
	,ImagingRequest_MoodCodeSystem
	,ImagingRequest_StatusCode
	,ImagingRequest_StatusCodeSystem
	,ImagingRequest_PriorityCode
	,ImagingRequest_PriorityCodeSystem
	,ImagingRequest_TypeCode
	,ImagingRequest_TypeCodeSystem
	,YEAR([dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](ImagingRequest_EffectiveDateEnc))*10000+Month([dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](ImagingRequest_EffectiveDateEnc))*100 +Day([dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](ImagingRequest_EffectiveDateEnc)) ImagingRequest_EffectiveDate
	,ScheduledTimeDate
	,LastUpdatedTime
	,RefererOrgId_Root
	,RefererOrgId_Extension
	,PerformingOrgId_Root
	,PerformingOrgId_Extension
	,ImagingStudyPerformerId_Root
	,ImagingStudyPerformerId_Extension
	,AssignedRequestedDeviceId_Root
	,AssignedRequestedDeviceId_Extension
	,AssignedStudyDeviceId_Root
	,AssignedStudyDeviceId_Extension
	,ImagingRequest_Code
	,ImagingRequest_CodeSystem
	,ImagingStudy_MoodCode
	,ImagingStudy_MoodCodeSystem
	,ImagingStudy_StatusCode
	,ImagingStudy_StatusCodeSystem
	,ImagingStudy_TypeCode
	,ImagingStudy_TypeCodeSystem
	,NegationInd
	,ImagingStudy_Title
	,YEAR([dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](ImagingStudy_EffectiveDateEnc))*10000+MONTH([dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](ImagingStudy_EffectiveDateEnc))*100+DAY([dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](ImagingStudy_EffectiveDateEnc)) ImagingStudy_EffectiveDate
	,ImagingStudy_PriorityCode
	,ImagingStudy_PriorityCodeSystem
	,UncertaintyCode
	,UncertaintyCodeSystem
	,MethodCode
	,MethodCodeSystem
	,InterpretationCode
	,InterpretationCodeSystem
	,ImagingStudy_Code
	,ImagingStudy_CodeSystem
	,TargetSiteCode
	,TargetSiteCodeSystem
	,RequestedTargetSiteCode
	,RequestedTargetSiteCodeSystem
	--,dbmAvailabilityTime
	,FlagDelete
	--,NodeID
	--,LastUpdated
	--,FlagNew

	
FROM [dbmSemanticAnalyticsSTG].Persist.FactImaging M
INNER JOIN  [dbmSemanticAnalyticsSTG].Persist.MappingPatient MP
ON  M.PatientId_Root=MP.Id_Root
AND M.PatientId_Extension=MP.Id_Extension
WHERE (ImagingStudyId_Extension LIKE N'PHA2_PBC_AT13img%')
ORDER BY ImagingStudyId_Extension

