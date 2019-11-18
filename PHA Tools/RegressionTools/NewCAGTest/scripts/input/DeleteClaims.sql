/*
	Truncate Claims Tables
*/

--=============================
-- PHA Tables
--PHA Mirror Tables
TRUNCATE TABLE dbmSemanticAnalyticsSTG.Mirror.ClaimDemographics
TRUNCATE TABLE dbmSemanticAnalyticsSTG.Mirror.ClaimDiagnosis_Code
TRUNCATE TABLE dbmSemanticAnalyticsSTG.Mirror.ClaimDME
TRUNCATE TABLE dbmSemanticAnalyticsSTG.Mirror.ClaimsHeader
TRUNCATE TABLE dbmSemanticAnalyticsSTG.Mirror.ClaimMedication
TRUNCATE TABLE dbmSemanticAnalyticsSTG.Mirror.ClaimPhysician
TRUNCATE TABLE dbmSemanticAnalyticsSTG.Mirror.ClaimProcedureCode
TRUNCATE TABLE dbmSemanticAnalyticsSTG.Mirror.ClaimRevenueCenter
--PHA Persist Tables
TRUNCATE TABLE dbmSemanticAnalyticsSTG.Persist.ClaimDemographics
TRUNCATE TABLE dbmSemanticAnalyticsSTG.Persist.ClaimDiagnosis_Code
TRUNCATE TABLE dbmSemanticAnalyticsSTG.Persist.ClaimDME
TRUNCATE TABLE dbmSemanticAnalyticsSTG.Persist.ClaimsHeader
TRUNCATE TABLE dbmSemanticAnalyticsSTG.Persist.ClaimMedication
TRUNCATE TABLE dbmSemanticAnalyticsSTG.Persist.ClaimPhysician
TRUNCATE TABLE dbmSemanticAnalyticsSTG.Persist.ClaimProcedureCode
TRUNCATE TABLE dbmSemanticAnalyticsSTG.Persist.ClaimRevenueCenter
--=============================
-- ACG Tables
--Final ACG Tables
/* 
--Issue with FK. Some are very complex
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[ACG].[ReferenceMEDC]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[ACG].[ReferenceEDC]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[ACG].[ReferenceRUB]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[ACG].[ReferencePatient]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[ACG].[MappingPatientEDC]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[ACG].[MappingPatientMEDC]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[ACG].[HospitalByCondition]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[ACG].[MedicalMetrics]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[ACG].[PatientMetrics]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[ACG].[SMRbyEDC]
*/
-- ACG Staging Tables
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[STG].[ACGReferenceMEDC]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[STG].[ACGReferenceEDC]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[STG].[ACGReferenceRUB]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[STG].[ACGReferencePatient]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[STG].[ACGMappingPatientEDC]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[STG].[ACGMappingPatientMEDC]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[STG].[ACGHospitalByCondition]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[STG].[ACGMedicalMetrics]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[STG].[ACGPatientMetrics]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[STG].[ACGSMRbyEDC]

