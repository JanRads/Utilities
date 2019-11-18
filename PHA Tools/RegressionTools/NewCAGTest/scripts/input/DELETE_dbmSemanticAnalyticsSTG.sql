USE dbmSemanticAnalyticsSTG
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
UPDATE [Log].LTS
SET TIMESTAMP = '2010-01-01 00:00:00.000'
	,CAG_ID = 0
	,LastRun_Timestamp = NULL
	,Last_Run_CAG_ID = NULL
WHERE (ID <> 6) and (ID <> 35)

update [dbmSemanticAnalyticsSTG].[Log].[ETLFlow]
set [Value] = 1

--TRUNCATE TABLE Mirror.AdminCodes
TRUNCATE TABLE Mirror.AgeGroupLoading
TRUNCATE TABLE Mirror.ClaimDemographics
TRUNCATE TABLE Mirror.ClaimDiagnosis_Code
TRUNCATE TABLE Mirror.ClaimDME
TRUNCATE TABLE Mirror.ClaimMedication
TRUNCATE TABLE Mirror.ClaimPhysician
TRUNCATE TABLE Mirror.ClaimProcedureCode
TRUNCATE TABLE Mirror.ClaimRevenueCenter
TRUNCATE TABLE Mirror.ClaimsDateFor837p
TRUNCATE TABLE Mirror.ClaimsGeneralHIC
TRUNCATE TABLE Mirror.ClaimsHeader

TRUNCATE TABLE Mirror.ClinicalCodesLinks
--TRUNCATE TABLE Mirror.CodeLinks
TRUNCATE TABLE Mirror.DeleteClaims
TRUNCATE TABLE Mirror.DimClinicalCodes
TRUNCATE TABLE Mirror.ExternalClaimsSpecialtyMapping
TRUNCATE TABLE Mirror.ExternalCodes
TRUNCATE TABLE Mirror.FactAllergies
TRUNCATE TABLE Mirror.FactClinicalDocument
TRUNCATE TABLE Mirror.FactConditions
TRUNCATE TABLE Mirror.FactConfidentiality
TRUNCATE TABLE Mirror.FactEncounters
TRUNCATE TABLE Mirror.FactImaging
TRUNCATE TABLE Mirror.FactImmunizationPerformers
TRUNCATE TABLE Mirror.FactImmunizations
TRUNCATE TABLE Mirror.FactLabs
TRUNCATE TABLE Mirror.FactMeasurement
TRUNCATE TABLE Mirror.FactMeasurementPerformers
TRUNCATE TABLE Mirror.FactMedicationPerformers
TRUNCATE TABLE Mirror.FactMedications
TRUNCATE TABLE Mirror.FactProcedurePerformers
TRUNCATE TABLE Mirror.FactProcedures
TRUNCATE TABLE Mirror.FactTransfers
TRUNCATE TABLE Mirror.MappingPatient
TRUNCATE TABLE Mirror.MappingProvider
TRUNCATE TABLE Mirror.MasterDataPCP
TRUNCATE TABLE Mirror.MasterPatient
TRUNCATE TABLE Mirror.MasterProvider
TRUNCATE TABLE Mirror.MaterialRole
TRUNCATE TABLE Mirror.MetricResults
TRUNCATE TABLE Mirror.Organization
TRUNCATE TABLE Mirror.OrganizationHierachy
TRUNCATE TABLE Mirror.OrganizationHierachy_new
TRUNCATE TABLE Mirror.OrganizationMapping
TRUNCATE TABLE Mirror.Payer_ProductLine_Patient_Services
TRUNCATE TABLE Mirror.PCPOrgLinks
TRUNCATE TABLE Mirror.Places
TRUNCATE TABLE Mirror.PopulationClassifications
TRUNCATE TABLE Mirror.Program_patient_services
TRUNCATE TABLE Mirror.Program_services
TRUNCATE TABLE Mirror.ProviderNPI_Services
TRUNCATE TABLE Mirror.ProviderOrganiztion_services
TRUNCATE TABLE Mirror.ProviderOrganiztion_services_ERROR
TRUNCATE TABLE Mirror.RegistryMappingKmResults
TRUNCATE TABLE Mirror.SourceSystems
TRUNCATE TABLE Mirror.StreamMetricResults
TRUNCATE TABLE Mirror.StreamPopulationClassifications
TRUNCATE TABLE Persist.ChangedCodes
TRUNCATE TABLE Persist.ClaimDemographics
TRUNCATE TABLE Persist.ClaimDiagnosis_Code
TRUNCATE TABLE Persist.ClaimDME
TRUNCATE TABLE Persist.ClaimMedication
TRUNCATE TABLE Persist.ClaimPhysician
TRUNCATE TABLE Persist.ClaimProcedureCode
TRUNCATE TABLE Persist.ClaimRevenueCenter
TRUNCATE TABLE Persist.ClaimsHeader
TRUNCATE TABLE Persist.ClaimsProviderSpecialty
TRUNCATE TABLE Persist.ClinicalCodesLinks
TRUNCATE TABLE Persist.CodeChanges
--TRUNCATE TABLE Persist.CodeLinks
--TRUNCATE TABLE Persist.DimAdminCodes
TRUNCATE TABLE Persist.DimAgeGroups
TRUNCATE TABLE Persist.DimAgeHierarchy
TRUNCATE TABLE Persist.DimAges
TRUNCATE TABLE Persist.DimAgeToGroup
TRUNCATE TABLE Persist.DimClaimPayer
TRUNCATE TABLE Persist.DimClinicalCodes
TRUNCATE TABLE Persist.DimDate
TRUNCATE TABLE Persist.DimOrganization
TRUNCATE TABLE Persist.DimOrganizationType
TRUNCATE TABLE Persist.DimPatient
TRUNCATE TABLE Persist.DimPlaces
TRUNCATE TABLE Persist.DimProgram
TRUNCATE TABLE Persist.DimProvider
TRUNCATE TABLE Persist.DimTime
TRUNCATE TABLE Persist.FactAllergies
TRUNCATE TABLE Persist.FactClinicalDocument
TRUNCATE TABLE Persist.FactConditions
TRUNCATE TABLE Persist.FactConfidentiality
TRUNCATE TABLE Persist.FactEncounters
TRUNCATE TABLE Persist.FactImaging
TRUNCATE TABLE Persist.FactImmunizationPerformers
TRUNCATE TABLE Persist.FactImmunizations
TRUNCATE TABLE Persist.FactLabsOrders
TRUNCATE TABLE Persist.FactLabsResults
TRUNCATE TABLE Persist.FactlessClinicalCodes
TRUNCATE TABLE Persist.FactMeasurement
TRUNCATE TABLE Persist.FactMedicationPerformers
TRUNCATE TABLE Persist.FactMedications
TRUNCATE TABLE Persist.FactPatientProgramRelations
TRUNCATE TABLE Persist.FactProcedurePerformers
TRUNCATE TABLE Persist.FactProcedures
TRUNCATE TABLE Persist.FactTransfers
TRUNCATE TABLE Persist.GK_CurrentClaimID
TRUNCATE TABLE Persist.MappingPatient
TRUNCATE TABLE Persist.MappingProvider
TRUNCATE TABLE Persist.MasterDataPCP
TRUNCATE TABLE Persist.MaterialRole
TRUNCATE TABLE Persist.Metric
TRUNCATE TABLE Persist.MetricResults
TRUNCATE TABLE Persist.OrganizationMapping
TRUNCATE TABLE Persist.PatientPopulatuion
TRUNCATE TABLE Persist.Payer_ProductLine_Patient_Services
TRUNCATE TABLE Persist.PCPClusters
TRUNCATE TABLE Persist.PopulationClassifications
TRUNCATE TABLE Persist.ProviderOrganizationRelation_Services
TRUNCATE TABLE Persist.SourceSystems
TRUNCATE TABLE Persist.TempMasterDataPCP
TRUNCATE TABLE Persist.TempSourceSystems
TRUNCATE TABLE Persist.Titles
-----------------------------------------------------------
TRUNCATE TABLE STG.TempDimPatient
TRUNCATE TABLE STG.TempDimProvider

	/*SELECT 'TRUNCATE TABLE ' + PS.name+'.'+ PT.name
FROM        
                      sys.tables AS PT 
INNER JOIN sys.schemas AS PS 
ON PT.schema_id = PS.schema_id
WHERE     PS.name IN( 'Mirror','Persist')
order by  PS.name,PT.name*/
