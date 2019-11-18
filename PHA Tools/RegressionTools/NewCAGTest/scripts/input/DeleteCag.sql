USE dbmSemanticAnalyticsSTG

--UPDATE    [SSIS Configurations]
--SET              ConfiguredValue = '$(OlapServer)'
--WHERE     (ConfigurationFilter = 'Gateway')

USE dbmClinicalAnalyticsGateway
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
TRUNCATE TABLE Fact.Allergies
TRUNCATE TABLE Fact.ClinicalDocument
TRUNCATE TABLE Fact.ClinicalDocumentParticipantOrganization
TRUNCATE TABLE Fact.ClinicalDocumentPerformers
TRUNCATE TABLE Fact.ClinicalDocumentTextPart
TRUNCATE TABLE Fact.Conditions
TRUNCATE TABLE Fact.Confidentiality
TRUNCATE TABLE Fact.CoveredParty
TRUNCATE TABLE Fact.EncounterParticipants
TRUNCATE TABLE Fact.Encounters
TRUNCATE TABLE Fact.Imaging
TRUNCATE TABLE Fact.ImagingPerformers
TRUNCATE TABLE Fact.ImagingValues
TRUNCATE TABLE Fact.ImmunizationPerformers
TRUNCATE TABLE Fact.Immunizations
TRUNCATE TABLE Fact.LaboratoryResults
TRUNCATE TABLE Fact.Measurement
TRUNCATE TABLE Fact.MeasurementPerformers
TRUNCATE TABLE Fact.Medication
TRUNCATE TABLE Fact.MedicationPerformers
TRUNCATE TABLE Fact.MicrobiologyFinding
TRUNCATE TABLE Fact.PatologyFinding
TRUNCATE TABLE Fact.ProcedurePerformers
TRUNCATE TABLE Fact.Procedures
TRUNCATE TABLE Fact.Transfers
TRUNCATE TABLE MasterData.CareProvider
TRUNCATE TABLE MasterData.CareProviderIdentifier

TRUNCATE TABLE MasterData.Device
TRUNCATE TABLE MasterData.Organization
TRUNCATE TABLE MasterData.OrganizationIdentifier
TRUNCATE TABLE MasterData.Patient
TRUNCATE TABLE MasterData.PatientIdentifier
TRUNCATE TABLE MasterData.Relationship
TRUNCATE TABLE Staging.CareProvider
TRUNCATE TABLE Staging.ClinicalCodes
TRUNCATE TABLE Staging.ClinicalCodeslinks
TRUNCATE TABLE Staging.Device
TRUNCATE TABLE Staging.MasterCareProvider
TRUNCATE TABLE Staging.MasterCareProviderIdentifier
TRUNCATE TABLE Staging.Organization
TRUNCATE TABLE Staging.OrganizationIdentifier
TRUNCATE TABLE Staging.PatientDetailsRecord
TRUNCATE TABLE Staging.PatientPPOL
TRUNCATE TABLE Staging.ProviderDetailsRecord
TRUNCATE TABLE Staging.Relationship
TRUNCATE TABLE Staging.T_Relationship
TRUNCATE TABLE Staging.TPatient
TRUNCATE TABLE Staging.TPatientIdentifier
TRUNCATE TABLE Staging.XML_Patient
TRUNCATE TABLE Staging.XML_Provider
TRUNCATE TABLE dbo.ExecutionLog
TRUNCATE TABLE Fact.PopulationClassification
TRUNCATE TABLE Fact.MetricsResults

DELETE FROM dbmClinicalAnalyticsGateway.masterdata.clinicalcodes 
WHERE  code IN( 
'62001','62002','62003','62004','62005','62006','62007','62008','62009','62010')
       AND codesystem = '2.16.840.1.113883.20.12' 

DELETE FROM dbmClinicalAnalyticsGateway.masterdata.clinicalcodes 
WHERE  code = '620040'
       AND codesystem = 'DiagnosisValue_I9_DemoEMPI'

DELETE FROM dbmClinicalAnalyticsGateway.masterdata.clinicalcodes 
WHERE  code IN( '620040' ,'620050')
       AND codesystem = 'DiagnosisValue_I9_DemoEMPI'

DELETE FROM dbmClinicalAnalyticsGateway.masterdata.clinicalcodes 
WHERE  code IN( '6200100','6200200','6200300','6200400','6200500'
)
       AND codesystem = '2.16.840.1.113883.3.57.1.3.5.52.2.17'

DELETE FROM dbmClinicalAnalyticsGateway.masterdata.clinicalcodes 
WHERE  code = '77056'
       AND codesystem IN(  '2.16.840.1.113883.3.57.1.3.5.52.2.82', '2.16.840.1.113883.6.12', '2.16.840.1.113883.3.57.1.3.5.52.2.82')



DELETE FROM dbmClinicalAnalyticsGateway.masterdata.clinicalcodes 
WHERE  code = '429400009'
       AND codesystem IN(   '2.16.840.1.113883.3.57.1.3.5.52.2.62.1', '2.16.840.1.113883.6.96')


delete MasterData.ClinicalCodes
where CodeSystemName like 'CPM%'


delete [MasterData].[ClinicalCodeslinks]
Where ClinicalCodeId in (
2000462003,
2000462005,
2000462008,
2000462010,
20004620030,
20004620050,
200046200300,
200046200500)



delete
from [MasterData].[ClinicalCodes]
where designation = 'Changing Desc Head2'

/*
SELECT 'TRUNCATE TABLE ' + PS.name+'.'+ PT.name
FROM        
                      sys.tables AS PT 
INNER JOIN sys.schemas AS PS 
ON PT.schema_id = PS.schema_id
WHERE     PS.name IN( 'Fact','MasterData','Staging')
order by  PS.name,PT.name
*/






DELETE T1 
FROM   MASTERDATA.CODESLINKS_V T1 
       INNER JOIN MASTERDATA.CODESINTERNAL_V T2 
               ON T1.SOURCECODEID = T2.CODEID 
WHERE  T2.CONCEPTCODESYSTEM = 'Clinical Links' 

  delete dbmClinicalAnalyticsGateway.MasterData.ClinicalCodes
  where CodeSystem = 'Clinical Links'





TRUNCATE TABLE sysssislog

INSERT INTO sysssislog(      event, computer, operator, source, sourceid, executionid, starttime, endtime, datacode, message)
--VALUES
--('PackageStart',   'STORK8-DATA123',    'DBMOTION\dbmSQL4',  'PopulateDomainPatients',  '6a646888-f333-4832-b7eb-9544d36b7a1e',     'f0715f7b-8129-4668-85e1-463ac812b484',  getdate(),    getdate(),       0,     'Beginning of Package execution.')
VALUES
('PackageStart',     'STORK8-DATA123',    'DBMOTION\dbmSQL4',  'PopulateDomainPatients',  '6a646888-f333-4832-b7eb-9544d36b7a1e',     'f0715f7b-8129-4668-85e1-463ac812b484',DATEAdd(second,-1,getdate()), DATEAdd(second,-1,getdate()),     0,     'Beginning of Package execution.'),

('PackageEnd',     'STORK8-DATA123',    'DBMOTION\dbmSQL4',  'PopulateDomainPatients',  '6a646888-f333-4832-b7eb-9544d36b7a1e',     'f0715f7b-8129-4668-85e1-463ac812b484',DATEAdd(MINUTE,2,getdate()),      DATEAdd(MINUTE,2,getdate()),      0,     'End of Package execution.')



/******************************************************************************************************************************************************
														Mila M.
*******************************************************************************************************************************************************/

USE [dbmClinicalAnalyticsGateway]
GO
/****** Object:  Table [dbo].[TestRegressionCodes]    Script Date: 8/16/2016 2:37:29 PM ******/

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestRegressionCodes]') AND type in (N'U'))
DROP TABLE [dbo].[TestRegressionCodes]

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TestRegressionCodes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TestRegressionCodes](
	--[CodeId] [bigint] NULL,
	[Code] [nvarchar](255) NULL,
	[CodeSystem] [nvarchar](128) NULL
) ON [PRIMARY]
END
GO

INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'99382', N'2.16.840.1.113883.6.12')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'High', N'2.16.840.1.113883.3.57.1.3.5.52.2.10.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'99385', N'2.16.840.1.113883.6.12')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'EVN', N'2.16.840.1.113883.5.1001')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'6200300', N'2.16.840.1.113883.3.57.1.3.5.52.2.17')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'U', N'2.16.840.1.113883.5.1053')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'EMER', N'2.16.840.1.113883.3.57.1.3.5.52.2.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'6200500', N'2.16.840.1.113883.3.57.1.3.5.52.2.17')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'R', N'2.16.840.1.113883.5.7')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'REG', N'2.16.840.1.113883.3.57.1.3.5.52.2.5.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'UR', N'2.16.840.1.113883.5.7')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'195967001', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'IMP', N'2.16.840.1.113883.3.57.1.3.5.52.2.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'027.9', N'2.16.840.1.113883.6.103')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'070.44', N'2.16.840.1.113883.6.103')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'AMB', N'2.16.840.1.113883.3.57.1.3.5.52.2.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'SiteCode_03_Test_000221555_ScnA', N'2.16.840.1.113883.3.57.1.3.5.52.2.7.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'134401001', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'190331003', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'190369008', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'191519005', N'DiagnosisValue_I9_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'191629006', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'13645005', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'21202004', N'DiagnosisValue_I9_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'105541001', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'305838003', N'DiagnosisValue_I9_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'359620001', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'254837009', N'DiagnosisValue_I9_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'26929004', N'DiagnosisValue_I9_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'28670008', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'129839007', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'128462008', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'429087003', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'310578008', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'3109008', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'410795001', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'21454007', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'21454007', N'DiagnosisValue_I9_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'189336000', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'190368000', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'191519005', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'22298006', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'01', N'2.16.840.1.113883.3.57.1.3.5.52.2.17')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'74627003', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'254837009', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'92624000', N'DiagnosisValue_I9_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'26929004', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'62008', N'2.16.840.1.113883.20.12')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'IndicationCode#4_03_Test_000221555_ScnA', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.5')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'UDH', N'2.16.840.1.113883.3.57.1.3.5.52.2.17')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'35489007', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00037043101', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00037067310', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00043620504', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00049397060', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00067503956', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00067602415', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00067618020', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'59530001', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'35919005', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'363358000', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'44323002', N'DiagnosisValue_I9_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'55822004', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'49436004', N'DiagnosisValue_I9_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'64859006', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'94297009', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'53741008', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'620030', N'DiagnosisValue_I9_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'620050', N'DiagnosisValue_I9_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'IndicationCode#1_03_Test_000221555_ScnA', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.5')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'399068003', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'399068003', N'DiagnosisValue_I9_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'77055', N'2.16.840.1.113883.3.57.1.3.5.52.2.82')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'77056', N'2.16.840.1.113883.6.12')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'35489007', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'363510005', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'39156-5', N'2.16.840.1.113883.6.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00009006607', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00037024330', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00037043001', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00037052192', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00037068110', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00067623824', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00067624024', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00067624132', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'8302-2', N'2.16.840.1.113883.6.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'410795001', N'DiagnosisValue_I9_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'TBD', N'DiagnosisValue_I9_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00008122250', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00008499001', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00037054568', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00039002449', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'449759005', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'49436004', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'59530001', N'DiagnosisValue_I9_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'308963', N'2.16.840.1.113883.6.88')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00037044217', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00049052083', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'69322001', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'71642004', N'DiagnosisValue_I9_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'73211009', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'259273007', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'IndicationCode#3_03_Test_000221555_ScnA', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.5')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'84114007', N'2.16.840.1.113883.3.57.1.3.5.52.2.61.3.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'77056', N'2.16.840.1.113883.3.57.1.3.5.52.2.82')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'W', N'2.16.840.1.113883.5.83')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'0001', N'2.16.840.1.113883.5.84')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'0005', N'2.16.840.1.113883.5.84')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'MethodCode', N'2.16.840.1.113883.3.57.1.3.5.52.2.36')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'18170008', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'62010', N'2.16.840.1.113883.20.12')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'Z', N'2.16.840.1.113883.3.57.1.3.5.52.2.81')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00067623824', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'8462-4', N'2.16.840.1.113883.6.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'8480-6', N'2.16.840.1.113883.6.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'207195004', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00049002428', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00008411701', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00008415201', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00043620604', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00049491030', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'429400009', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'100', N'VaccineEntityType_CVX_DemoEMPI')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'38', N'2.16.840.1.113883.6.59')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'%', N'2.16.840.1.113883.5.141')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'%{aggregation}', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'%{loss_AChR}', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'%{residual}', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'/{OIF}', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'/mL', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'[CFU]/mL', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'[IU]/kg/d', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00039002349', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00049003183', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00049398060', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'208183', N'2.16.840.1.113883.6.88')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'Active', N'2.16.840.1.113883.3.57.1.3.5.52.2.80.1.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'0002', N'2.16.840.1.113883.5.84')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'145', N'2.16.840.1.113883.5.84')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'VREG', N'2.16.840.1.113883.5.84')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'259274001', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'%{basal_activity}', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'%{total}', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'[C]', N'2.16.840.1.113883.5.141')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'[CFU]', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'111', N'2.16.840.1.113883.6.59')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'26', N'2.16.840.1.113883.6.59')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'12843005', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'102314', N'2.16.840.1.113883.6.88')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'H', N'2.16.840.1.113883.3.57.1.3.5.52.2.35')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'175166003', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'185349003', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'185465003', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'19681004', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'%{lysis}', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'/L', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'[ACR_BR]', N'2.16.840.1.113883.5.141')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'[BTU_TH]', N'2.16.840.1.113883.5.141')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'[DR_AV]', N'2.16.840.1.113883.5.141')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'44249-1', N'2.16.840.1.113883.6.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00009006404', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00037067310', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00039002049', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'ImmunUnitCode_03_Test_000221555_ScnA', N'2.16.840.1.113883.3.57.1.3.5.52.2.105.2')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'mmHg', N'2.16.840.1.113883.3.57.1.3.5.52.2.112')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'140', N'2.16.840.1.113883.3.57.1.3.5.52.2.87.3')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'MNC1', N'ObservationMethod_MT_COCNB')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'185463005', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'259381005', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'236974004', N'2.16.840.1.113883.3.57.1.3.5.52.2.62.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'31130001', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'%{abnormal}', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'%{bacteria}', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'%{reference}', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'%{uptake}', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'/10*10', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'/100{cells}', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'/cm[H2O]', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'/dL', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'/g{tot_prot}', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'[AU]', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'[DIOP]', N'2.16.840.1.113883.5.141')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'[drp]', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'[DYE''U]', N'2.16.840.1.113883.5.141')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'[FT_BR]', N'2.16.840.1.113883.5.141')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'[FTH_I]', N'2.16.840.1.113883.5.141')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'in', N'2.16.840.1.113883.3.57.1.3.5.52.2.112')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'30', N'2.16.840.1.113883.6.59')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'33', N'2.16.840.1.113883.6.59')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'34', N'2.16.840.1.113883.6.59')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'42', N'2.16.840.1.113883.6.59')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'855818', N'2.16.840.1.113883.6.88')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'33962009', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'A', N'2.16.840.1.113883.3.57.1.3.5.52.2.35')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'L', N'2.16.840.1.113883.5.83')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'10', N'2.16.840.1.113883.5.84')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'12866006', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'161671001', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'42343007', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'473165003', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'[Btu]', N'2.16.840.1.113883.5.141')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'DEB3RR1Z2P', N'2.16.840.1.113883.4.9')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'/U', N'2.16.840.1.113883.6.8')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'992792', N'2.16.840.1.113883.6.88')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'96228009', N'2.16.840.1.113883.6.96')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00043011530', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00043013008', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00043013720', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00067547906', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00067547906', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00067606910', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'00067608104', N'2.16.840.1.113883.6.69')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'2135-2', N'2.16.840.1.113883.5.50')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'2149-3', N'2.16.840.1.113883.5.50')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'2178-2', N'2.16.840.1.113883.6.238')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'2184-0', N'2.16.840.1.113883.6.238')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'H', N'2.16.840.1.113883.3.57.1.3.5.52.2.23')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'GPCP', N'2.16.840.1.113883.3.57.1.2.7')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'1726-9', N'2.16.840.1.113883.5.104')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'1796-2', N'2.16.840.1.113883.5.104')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'1797-0', N'2.16.840.1.113883.5.104')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'LOS ANGELES,CA', N'2.16.840.1.113883.3.57.1.3.5.52.2.14')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'F', N'2.16.840.1.113883.5.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'2146-9', N'2.16.840.1.113883.5.50')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'ENGLISH', N'2.16.840.1.113883.3.57.1.3.5.52.2.71')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'1793-9', N'2.16.840.1.113883.6.238')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'CA', N'2.16.840.1.113883.3.57.1.3.5.52.2.48')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'M', N'2.16.840.1.113883.5.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'M', N'2.16.840.1.113883.3.57.1.3.5.52.2.32')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'1724-4', N'2.16.840.1.113883.6.238')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'2144-4', N'2.16.840.1.113883.6.238')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'2161-8', N'2.16.840.1.113883.5.50')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'2161-8', N'2.16.840.1.113883.6.238')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'2175-8', N'2.16.840.1.113883.5.50')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'2180-8', N'2.16.840.1.113883.5.50')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'1698-0', N'2.16.840.1.113883.5.104')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'1711-1', N'2.16.840.1.113883.5.104')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'CA', N'2.16.840.1.113883.3.57.1.3.5.52.2.49')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'gender_F', N'2.16.840.1.113883.3.57.1.3.5.52.2.12')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'gender_M', N'2.16.840.1.113883.3.57.1.3.5.52.2.12')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'gender_F', N'2.16.840.1.113883.3.57.1.3.5.52.2.12')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'gender_M', N'2.16.840.1.113883.3.57.1.3.5.52.2.12')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'Z94.4', N'2.16.840.1.113883.6.90')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'88.55', N'2.16.840.1.113883.6.104')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'429400009', N'2.16.840.1.113883.3.57.1.3.5.52.2.62.1')
GO
INSERT [dbo].[TestRegressionCodes] ([Code], [CodeSystem]) VALUES (N'H90.6', N'2.16.840.1.113883.6.90')
GO

SELECT [ClinicalCodeId]
INTO #tmpCodeID
FROM [dbo].[TestRegressionCodes] TC
	INNER JOIN [MasterData].[ClinicalCodes] C
	ON TC.CodeSystem = C.CodeSystem
	AND TC.Code = C.Code

--UPDATE [MasterData].[ClinicalCodes]
--   SET [TimeStamp] = '2009-01-01 01:10:48.093'
 
--UPDATE [MasterData].[ClinicalCodeslinks]
--	 SET [TimeStamp] = '2009-01-01 01:10:48.093'

DECLARE @CurrentDate datetime=GETDATE()


UPDATE [MasterData].[ClinicalCodes]
SET [TimeStamp] = @CurrentDate
FROM [MasterData].[ClinicalCodes] original
	INNER JOIN #tmpCodeID regression
	ON original.ClinicalCodeId = regression.ClinicalCodeId

UPDATE [MasterData].[ClinicalCodeslinks]
SET [TimeStamp] = @CurrentDate
FROM [MasterData].[ClinicalCodeslinks] original
	INNER JOIN #tmpCodeID regression
	ON original.ClinicalCodeId = regression.ClinicalCodeId

DROP TABLE #tmpCodeID
