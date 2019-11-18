/*
	ACG_TablesValues.sql
	Purpose:
		To view the values in all the tables utilized by ACG claims files
*/
--=============================
-- PHA Tables
--PHA Mirror Tables
SELECT * FROM dbmSemanticAnalyticsSTG.Mirror.ClaimDemographics
SELECT * FROM dbmSemanticAnalyticsSTG.Mirror.ClaimDiagnosis_Code
SELECT * FROM dbmSemanticAnalyticsSTG.Mirror.ClaimDME
SELECT * FROM dbmSemanticAnalyticsSTG.Mirror.ClaimsHeader
SELECT * FROM dbmSemanticAnalyticsSTG.Mirror.ClaimMedication
SELECT * FROM dbmSemanticAnalyticsSTG.Mirror.ClaimPhysician
SELECT * FROM dbmSemanticAnalyticsSTG.Mirror.ClaimProcedureCode
SELECT * FROM dbmSemanticAnalyticsSTG.Mirror.ClaimRevenueCenter
--PHA Persist Tables
SELECT * FROM dbmSemanticAnalyticsSTG.Persist.ClaimDemographics
SELECT * FROM dbmSemanticAnalyticsSTG.Persist.ClaimDiagnosis_Code
SELECT * FROM dbmSemanticAnalyticsSTG.Persist.ClaimDME
SELECT * FROM dbmSemanticAnalyticsSTG.Persist.ClaimsHeader
SELECT * FROM dbmSemanticAnalyticsSTG.Persist.ClaimMedication
SELECT * FROM dbmSemanticAnalyticsSTG.Persist.ClaimPhysician
SELECT * FROM dbmSemanticAnalyticsSTG.Persist.ClaimProcedureCode
SELECT * FROM dbmSemanticAnalyticsSTG.Persist.ClaimRevenueCenter

--=============================
-- ACG Tables
SELECT * FROM [dbmSemanticAnalyticsSTG].[STG].[ACGReferenceMEDC]
SELECT * FROM [dbmSemanticAnalyticsSTG].[STG].[ACGReferenceEDC]
SELECT * FROM [dbmSemanticAnalyticsSTG].[STG].[ACGReferenceRUB]
SELECT * FROM [dbmSemanticAnalyticsSTG].[STG].[ACGReferencePatient]
SELECT * FROM [dbmSemanticAnalyticsSTG].[STG].[ACGMappingPatientEDC]
SELECT * FROM [dbmSemanticAnalyticsSTG].[STG].[ACGMappingPatientMEDC]
SELECT * FROM [dbmSemanticAnalyticsSTG].[STG].[ACGHospitalByCondition]
SELECT * FROM [dbmSemanticAnalyticsSTG].[STG].[ACGMedicalMetrics]
SELECT * FROM [dbmSemanticAnalyticsSTG].[STG].[ACGPatientMetrics]
SELECT * FROM [dbmSemanticAnalyticsSTG].[STG].[ACGSMRbyEDC]

SELECT * FROM [dbmSemanticAnalyticsSTG].[ACG].[ReferenceEDC]		--WHERE EDC_Code <> '-1'
SELECT * FROM [dbmSemanticAnalyticsSTG].[ACG].[ReferenceMEDC]		--WHERE MEDC_Code <> '-1'
SELECT * FROM [dbmSemanticAnalyticsSTG].[ACG].[ReferencePatient]	--WHERE patient_id <> '-1'
SELECT * FROM [dbmSemanticAnalyticsSTG].[ACG].[ReferenceRUB]		--WHERE RUB_Code <> '-1'
SELECT * FROM [dbmSemanticAnalyticsSTG].[ACG].[MappingPatientEDC]
SELECT * FROM [dbmSemanticAnalyticsSTG].[ACG].[MappingPatientMEDC]
SELECT * FROM [dbmSemanticAnalyticsSTG].[ACG].[HospitalByCondition]
SELECT * FROM [dbmSemanticAnalyticsSTG].[ACG].[MedicalMetrics]
SELECT * FROM [dbmSemanticAnalyticsSTG].[ACG].[PatientMetrics]
SELECT * FROM [dbmSemanticAnalyticsSTG].[ACG].[SMRbyEDC]


SELECT * FROM [dbmSemanticAnalyticsSTG].[Log].[Claims]
