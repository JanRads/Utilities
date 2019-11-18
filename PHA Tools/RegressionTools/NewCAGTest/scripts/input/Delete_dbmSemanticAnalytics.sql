USE dbmSemanticAnalytics
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--TRUNCATE TABLE Dim.AdminCodes

TRUNCATE TABLE Dim.Battery
TRUNCATE TABLE Dim.CareProviders

TRUNCATE TABLE Dim.Conditions
TRUNCATE TABLE Dim.DiagnosesHierarchyDE
TRUNCATE TABLE Dim.Organizations
TRUNCATE TABLE Dim.Patients
TRUNCATE TABLE Fact.ActiveIndicator
TRUNCATE TABLE Fact.Admissions
TRUNCATE TABLE Fact.AdmissionTransfers
TRUNCATE TABLE Fact.Agg_Encounter_Visits
TRUNCATE TABLE Fact.Agg_OutPatients12M
TRUNCATE TABLE Fact.Agg_Readmission
TRUNCATE TABLE Fact.Allergies
TRUNCATE TABLE Fact.AmbulatoryVisits
TRUNCATE TABLE Fact.BuildingBlocks
TRUNCATE TABLE Fact.CE
TRUNCATE TABLE Fact.ClaimsClinicalData
TRUNCATE TABLE Fact.ClaimsLines
TRUNCATE TABLE Fact.ClinicalDocument
TRUNCATE TABLE Fact.ClinicalMetrics
TRUNCATE TABLE Fact.CodeMappingChanges
TRUNCATE TABLE Fact.Conditions
TRUNCATE TABLE Fact.CPMTargets
TRUNCATE TABLE Fact.DeletedRecords
TRUNCATE TABLE Fact.EDVisits
TRUNCATE TABLE Fact.FactlessCE
TRUNCATE TABLE Fact.Imaging
TRUNCATE TABLE Fact.Immunizations
TRUNCATE TABLE Fact.Laboratories
TRUNCATE TABLE Fact.LaboratoriesOrder
TRUNCATE TABLE Fact.LaboratoriesResult
TRUNCATE TABLE Fact.LACEScore
TRUNCATE TABLE Fact.MCC_Score_Population
TRUNCATE TABLE Fact.MeasureMembersMonthly_NonPartition
TRUNCATE TABLE Fact.Measurement
TRUNCATE TABLE Fact.MedicationAdministrations
TRUNCATE TABLE Fact.MedicationOrders
TRUNCATE TABLE Fact.MedicationSupplies
TRUNCATE TABLE Fact.Metric_Hedis
TRUNCATE TABLE Fact.Metrics
TRUNCATE TABLE Fact.Metrics_CQM
TRUNCATE TABLE Fact.Metrics_CQM_Full
TRUNCATE TABLE Fact.Metrics_CQM_Summed
TRUNCATE TABLE Fact.PatientProgramCombRelations
TRUNCATE TABLE Fact.PatientProgramRelations
TRUNCATE TABLE Fact.PatientRelations
TRUNCATE TABLE Fact.Payer_ProductLine_Patient_Services
TRUNCATE TABLE Fact.PopulationMembersMonthly_NonPartition
TRUNCATE TABLE Fact.PreventiveVisits
TRUNCATE TABLE Fact.Procedures
TRUNCATE TABLE Fact.Readmissions
TRUNCATE TABLE Fact.SeverityScores
TRUNCATE TABLE Fact.Summary_Population
TRUNCATE TABLE Fact.Utilization
TRUNCATE TABLE Fact.VS
TRUNCATE TABLE Factless.AgeInGroup
TRUNCATE TABLE Factless.CE
TRUNCATE TABLE Factless.CombPrograms
--TRUNCATE TABLE Factless.ConditionsInHierarchy
--TRUNCATE TABLE Factless.ConditionsInHierarchyEquals
--TRUNCATE TABLE Factless.MedicationsInHierarchy
TRUNCATE TABLE Factless.PatientProviderRelations
TRUNCATE TABLE Factless.PatientRelationsFromTo
TRUNCATE TABLE Factless.PopulationPCPOrg_NonPartition
TRUNCATE TABLE Factless.ProceduresInHierarchy
TRUNCATE TABLE Factless.ProviderOrganizationRelations_Service
TRUNCATE TABLE Factless.RangeItemInGroup
TRUNCATE TABLE Factless.TestsInHierarchy
--TRUNCATE TABLE Factless.ValueSet
--TRUNCATE TABLE Factless.ValueSetMapIndicator
--TRUNCATE TABLE Factless.VS



       /*SELECT 'TRUNCATE TABLE ' + PS.name+'.'+ PT.name
FROM        
                      sys.tables AS PT 
INNER JOIN sys.schemas AS PS 
ON PT.schema_id = PS.schema_id
WHERE     PS.name IN( 'Dim','Fact','Factless','Tmp')
order by  PS.name,PT.name*/

