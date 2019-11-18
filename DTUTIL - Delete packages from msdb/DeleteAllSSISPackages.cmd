REM replace with your servername/instance

REM delete packages ********************************************************************************************************************************
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ACG\ACG_CreateACGDatabase /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ACG\ACG_GenerateAnalyticReports /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ACG\ACG_GenerateUsageReports /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ACG\ACG_LoadHospitalByCondition /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ACG\ACG_LoadMappingPatientEDC /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ACG\ACG_LoadMappingPatientMEDC /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ACG\ACG_LoadMedicalMetrics /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ACG\ACG_LoadPatientMetrics /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ACG\ACG_LoadReferenceEDC /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ACG\ACG_LoadReferenceMEDC /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ACG\ACG_LoadReferencePatient /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ACG\ACG_LoadReferenceRUB /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ACG\ACG_LoadSMRbyEDC /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\BulkPackages\Claims_DWH /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\BulkPackages\DWH /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\BulkPackages\GWToMirror /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\BulkPackages\Master_External_to_Mirror_fact_claims /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\BulkPackages\RI /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\BulkPackages\SLR_GWToMirror /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\BulkPackages\STGToPersist /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\BulkPackages\Truncate /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Claims\ClaimsAPI_OnboardFlatFiles /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Clusters\CP_Clustering /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Clusters\Import_Approved_clusters /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Clusters\Import_PCP /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\DWH\Dim_DWH_ValueSet /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\DWH\Persist_DWH_AdminCodes /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\DWH\Persist_DWH_CareProviders /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\DWH\Persist_DWH_CodeLinks /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\DWH\Persist_DWH_Dim_ClaimsKey /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\DWH\Persist_DWH_DimClaimPayer /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\DWH\Persist_DWH_DimProgram /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\DWH\Persist_DWH_Organization /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\DWH\Persist_DWH_Patients /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ExternalToMirror\External_Mirror_FactClaims /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ExternalToMirror\External_Mirror_FactClaims837 /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ExternalToMirror\External_Mirror_Program_Attribution /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\ExternalToMirror\ExternalFile_X12_Preloading /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persisit_FactEncounters /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persist_Claims /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persist_FactAllergies /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persist_FactClinicalDocument /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persist_FactConditions /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persist_FactImaging /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persist_FactImmunizations /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persist_Factlabs /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persist_FactMeasurement /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persist_FactMedications /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persist_FactProcedures /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persist_MetricResults /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persist_PatientAttribution /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persist_PayerProductLinePatientServices /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persist_PopulationClassification /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persist_ProgramPatient /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Mirror_Persist_ProviderOrganization /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persisit_DWH_FactEncounters /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_FactAllergies /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_FactClaimsClinicalData /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_FactClaimsLines /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_FactClinicalDocument /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_FactConditions /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_FactImaging /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_FactImmunizations /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_FactLabs /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_FactlessProviderOrganization /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_FactMeasurement /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_FactMedications /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_FactPayerProductLinePatientServices /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_FactPMPM /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_FactProcedures /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_FactProgram /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_PatientAttribution /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_PatientRelations /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Persist_DWH_PCP /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Scores_Final /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Scores_Indicators /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\Scores_Populations /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\STG_FactBuildingBlocks /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\Facts\STG_FactMetrics /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_AdminCodes /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_CareProvider /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_CodeLinks /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_FactAllergies /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_FactClinicalDocument /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_FactConditions /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_FactEncounter /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_FactImaging /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_FactImmunizations /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_FactLabs /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_FactMeasurement /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_FactMeasurementPerformers /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_FactMedications /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_FactProcedures /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_MasterDataPCP /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_MetricResults /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_Organization /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_Patient /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\GW_Mirror_PopulationClassifications /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\Stream_Mirror_MetricResults /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\GatewayToMirror\Stream_Mirror_PopulationClassifications /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\General\auditing /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\General\DEA_LaunchFindCandidates /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\General\Decrypt_Claim_Files /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\General\Health_check_Organiztion /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\RI\RI_AdminCodes /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\RI\RI_AdminCodesClaim /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\RI\RI_Admissions /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\RI\RI_Organization /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\RI\RI_Patient /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\RI\RI_Program /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\RI\RI_Provider /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\STGtoCDR\PHA_Metrics_CAG /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\STGtoCDR\STGtoCDR_Metrics /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\STGToPersist\Mirror_Persist_AdminCodes /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\STGToPersist\Mirror_Persist_CodeLinks /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\STGToPersist\Mirror_Persist_DimClaimPayer /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\STGToPersist\Mirror_Persist_DimDate /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\STGToPersist\Mirror_Persist_ExternalPatientPopulation /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\STGToPersist\Mirror_Persist_Organization /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\STGToPersist\Mirror_Persist_Patients /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\STGToPersist\Mirror_Persist_PCP /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\STGToPersist\Mirror_Persist_Program /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\STGToPersist\Mirror_Persist_Program_Attribution /DELETE
dtutil /SourceS LOCALHOST\INST01 /SQL Analytics_SSIS\STGToPersist\Mirror_Persist_Providers /DELETE

REM delete package folders **************************************************************************************************************************
dtutil /SourceS LOCALHOST\INST01 /FDelete SQL;Analytics_SSIS;ACG
dtutil /SourceS LOCALHOST\INST01 /FDelete SQL;Analytics_SSIS;BulkPackages
dtutil /SourceS LOCALHOST\INST01 /FDelete SQL;Analytics_SSIS;Claims
dtutil /SourceS LOCALHOST\INST01 /FDelete SQL;Analytics_SSIS;Clusters
dtutil /SourceS LOCALHOST\INST01 /FDelete SQL;Analytics_SSIS;DWH
dtutil /SourceS LOCALHOST\INST01 /FDelete SQL;Analytics_SSIS;ExternalToMirror
dtutil /SourceS LOCALHOST\INST01 /FDelete SQL;Analytics_SSIS;Facts
dtutil /SourceS LOCALHOST\INST01 /FDelete SQL;Analytics_SSIS;GatewayToMirror
dtutil /SourceS LOCALHOST\INST01 /FDelete SQL;Analytics_SSIS;General
dtutil /SourceS LOCALHOST\INST01 /FDelete SQL;Analytics_SSIS;RI
dtutil /SourceS LOCALHOST\INST01 /FDelete SQL;Analytics_SSIS;STGtoCDR
dtutil /SourceS LOCALHOST\INST01 /FDelete SQL;Analytics_SSIS;STGToPersist
