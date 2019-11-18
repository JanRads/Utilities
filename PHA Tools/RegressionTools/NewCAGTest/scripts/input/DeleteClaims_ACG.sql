/*
	DeleteClaims_ACG.sql
	Remove all records processed from previous testing.
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
--PK/FK Relationships
Primary						Foreign						Key Field	Notes
-------------------------------------------------------------------------------
ReferenceEDC (PK)		-->	HospitalByCondition (FK)	EDC_Code	
ReferenceEDC (PK)		-->	MappingPatientEDC (FK)		EDC_Code	
ReferencePatient (PK)	-->	MappingPatientEDC (FK)		patient_id	
ReferenceMEDC (PK)		-->	MappingPatientMEDC (FK)		MEDC_Code	
ReferencePatient (PK)	-->	MappingPatientMEDC (FK)		patient_id	
ReferencePatient (PK)	-->	MedicalMetrics (FK)			patient_id	MedicalMetrics has 3 PKs: patient_id, procedure_code, and claim_id
ReferencePatient (PK)	-->	PatientMetrics (FK)			patient_id	
ReferenceRUB (PK)		-->	PatientMetrics (FK)			RUB_Code	
ReferenceEDC (PK)		-->	SMRbyEDC (FK)				EDC_Code	
*/
--DELETE FROM [dbmSemanticAnalyticsSTG].[ACG].[ReferenceEDC]		WHERE EDC_Code <> '-1'
--Truncate child tables first (FK)
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[ACG].[MappingPatientEDC]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[ACG].[MappingPatientMEDC]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[ACG].[HospitalByCondition]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[ACG].[MedicalMetrics]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[ACG].[PatientMetrics]
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[ACG].[SMRbyEDC]
--Delete parent tables last (PK)... keeping the default entries.
--Note: Truncate is an all or nothing action. To keep any records, you must use DELETE
DELETE FROM [dbmSemanticAnalyticsSTG].[ACG].[ReferenceEDC]		WHERE EDC_Code <> '-1'
DELETE FROM [dbmSemanticAnalyticsSTG].[ACG].[ReferenceMEDC]		WHERE MEDC_Code <> '-1'
DELETE FROM [dbmSemanticAnalyticsSTG].[ACG].[ReferencePatient]	WHERE patient_id <> '-1'
DELETE FROM [dbmSemanticAnalyticsSTG].[ACG].[ReferenceRUB]		WHERE RUB_Code <> '-1'

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

--=============================
--Truncate the claims file table so that same files can be processed
TRUNCATE TABLE [dbmSemanticAnalyticsSTG].[Log].[Claims]

