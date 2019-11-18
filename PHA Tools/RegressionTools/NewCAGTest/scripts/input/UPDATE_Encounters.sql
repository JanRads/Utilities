USE [dbmClinicalAnalyticsGateway]
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Merge Patient 
---------ADD entry to syslog
INSERT INTO sysssislog(      event, computer, operator, source, sourceid, executionid, starttime, endtime, datacode, message)
VALUES
('PackageStart',	'STORK8-DATA123',	'DBMOTION\dbmSQL4',	'PopulateDomainPatients',	'6a646888-f333-4832-b7eb-9544d36b7a1e',	'f0715f7b-8129-4668-85e1-463ac812b484',	getdate(),	DATEAdd(second,-1,getdate()),	0,	'Beginning of Package execution.')

DECLARE @MaxPat bigint, 
@MaxPid bigint

DELETE FROM MasterData.Patient
WHERE  EnterprisePatientId      IN (9000379,9000380,  9000381,9000382)
SELECT @MaxPat=MAX(PatientID) FROM MasterData.Patient

INSERT INTO MasterData.Patient( PatientID, PatientID_CDR, EnterprisePatientId, Version, TimeOfBirth, TimeOfDeath, Deceased, GenderCode, GenderCodeSystem, MaritalStatusCode, 
                         MaritalStatusCodeSystem, ReligiousAffiliationCode, ReligiousAffiliationCodeSystem, RaceCode, RaceCodeSystem, BirthcountryCode, BirthCountryCodeSystem, 
                         PreferredLanguageCode, PreferredLanguageCodeSystem, StateOrProvince, City, PostalCode, AddressLine1, FullName, LastName, MiddleName, FirstName, 
                         NameSuffix, Title, MotherMaidenName, HomePhone, BusinessPhone, DeleteKey, TimeStamp, PatientMPIID, LastUpdated, IsGolden
)

VALUES

(@MaxPat+6,	3000002810,	9000379,	'1.0.0',	'1963-02-02 00:00:00.000',	NULL,	NULL,	'M',	'2.16.840.1.113883.3.57.1.3.5.52.2.12',	'M',	'2.16.840.1.113883.3.57.1.3.5.52.2.32',	'CA',	'2.16.840.1.113883.3.57.1.3.5.52.2.49',	'CA',	'2.16.840.1.113883.3.57.1.3.5.52.2.48',	'LOS ANGELES,CA',	'2.16.840.1.113883.3.57.1.3.5.52.2.14',	'ENGLISH',	'2.16.840.1.113883.3.57.1.3.5.52.2.71',	'CA',	'ROSEMEAD',	'91775',	'3622 WALL Str','secondnamePHA_EncAT_P2, firstnamePHA_EncAT_P22, REL',	'secondnamePHA_EncAT_P22',	'REL',	'firstnamePHA_EncAT_P22',	'JR',	'DR',	'PINEDO',	'(626)872 9754 CELL',	'(626)578 5552',	0,	getdate(),	71471,	'2013-12-03 17:58:20.067',	1),
(@MaxPat+7,	3000002811,	9000380,	'1.0.0',	'1946-05-04 00:00:00.000',	NULL,	NULL,	'F',	'2.16.840.1.113883.3.57.1.3.5.52.2.12',	'M',	'2.16.840.1.113883.3.57.1.3.5.52.2.32',	'CA',	'2.16.840.1.113883.3.57.1.3.5.52.2.49',	'CA',	'2.16.840.1.113883.3.57.1.3.5.52.2.48',	'LOS ANGELES,CA',	'2.16.840.1.113883.3.57.1.3.5.52.2.14',	'ENGLISH',	'2.16.840.1.113883.3.57.1.3.5.52.2.71',	'CA',	'ROSEMEAD',	'91776',	'3624 dad AVE','secondnamePHA_EncAT_P3, firstnamePHA_EncAT_P33, REL',	'secondnamePHA_EncAT_P33',	'REL',	'firstnamePHA_EncAT_P33',	'JR',	'DR',	'PINEDO',	'(626)872 9754 CELL',	'(626)578 5552',	0,	getdate(),	71472,	'2013-12-03 18:13:19.320',	1),
(@MaxPat+8,	3000002812,	9000379,	'1.0.0',	'1952-04-22 00:00:00.000',	NULL,	NULL,	'M',	'2.16.840.1.113883.3.57.1.3.5.52.2.12',	'M',	'2.16.840.1.113883.3.57.1.3.5.52.2.32',	'CA',	'2.16.840.1.113883.3.57.1.3.5.52.2.49',	'CA',	'2.16.840.1.113883.3.57.1.3.5.52.2.48',	'LOS ANGELES,CA',	'2.16.840.1.113883.3.57.1.3.5.52.2.14',	'ENGLISH',	'2.16.840.1.113883.3.57.1.3.5.52.2.71',	'CA',	'ROSEMEAD',	'91777',	'3627 mom AVE','secondnamePHA_EncAT_P5, firstnamePHA_EncAT_P55, REL',	'secondnamePHA_EncAT_P55',	'REL',	'firstnamePHA_EncAT_P55',	'JR',	'DR',	'PINEDO',	'(626)872 9754 CELL',	'(626)578 5552',	0,	getdate(),	71474,	'2013-12-03 18:19:18.980',	0),
(@MaxPat+9,	3000002813,	9000382,	'1.0.0',	'1932-06-22 00:00:00.000',	'2013-12-03 18:19:18.980',	1,	'M',	'2.16.840.1.113883.3.57.1.3.5.52.2.12',	'M',	'2.16.840.1.113883.3.57.1.3.5.52.2.32',	'CA',	'2.16.840.1.113883.3.57.1.3.5.52.2.49',	'CA',	'2.16.840.1.113883.3.57.1.3.5.52.2.48',	'LOS ANGELES,CA',	'2.16.840.1.113883.3.57.1.3.5.52.2.14',	'ENGLISH',	'2.16.840.1.113883.3.57.1.3.5.52.2.71',	'CA',	'ROSEMEAD',	'91777',	'3627 mom AVE','secondnamePHA_EncAT_P4, firstnamePHA_EncAT_P4, REL',	'secondnamePHA_EncAT_P4',	'REL',	'firstnamePHA_EncAT_P4',	'JR',	'DR',	'PINEDO',	'(626)872 9754 CELL',	'(626)578 5552',	0,	getdate(),	71474,	'2013-12-03 18:19:18.980',	1)

DELETE FROM            MasterData.PatientIdentifier
WHERE        
EnterprisePatientId IN (9000379,9000380,  9000381,9000382)

SELECT @MaxPid=MAX(PatientIdentifierId) FROM  MasterData.PatientIdentifier
INSERT INTO  MasterData.PatientIdentifier(       PatientIdentifierId, PatientID_CDR, EnterprisePatientId, PatientId_Root, PatientId_Extension, IdentifierTypeCode, IdentifierTypeCodeSystem, TimeStamp, IsPrimary, 
                         DeleteKey, isGolden)

VALUES

(@MaxPid+6,	3000002810,	9000379,	'2.16.840.1.113883.3.57.1.3.5.52.1.8.6',	'PHA_EncAT_P22',	'MRN',	'2.16.840.1.113883.3.57.1.2.6',	getdate(),	1,	0,	1),
(@MaxPid+7,	3000002811,	9000380,	'2.16.840.1.113883.3.57.1.3.5.52.1.8.6',	'PHA_EncAT_P33',	'MRN',	'2.16.840.1.113883.3.57.1.2.6',	getdate(),	1,	0,	1),
(@MaxPid+8,	3000002812,	9000379,	'2.16.840.1.113883.3.57.1.3.5.52.1.8.6',	'PHA_EncAT_P55',	'MRN',	'2.16.840.1.113883.3.57.1.2.6',	getdate(),	1,	0,	0),
(@MaxPid+9,	3000002813,	9000382,	'2.16.840.1.113883.3.57.1.3.5.52.1.8.6',	'PHA_EncAT_P4',	'MRN',	'2.16.840.1.113883.3.57.1.2.6',	getdate(),	1,	0,	1),
(@MaxPid+16,	-9000379,	9000379,	'2.16.840.1.113883.3.57.1.3.0.3.3.6',	'9000379',	NULL,	NULL,	getdate(),	1 ,0,	0),
(@MaxPid+17,	-9000380,	9000380,	'2.16.840.1.113883.3.57.1.3.0.3.3.6',	'9000380',	NULL,	NULL,	getdate(),	1 ,0,	0),
(@MaxPid+18,	-9000382,	9000382,	'2.16.840.1.113883.3.57.1.3.0.3.3.6',	'9000382',	NULL,	NULL,	getdate(),	1 ,0,	0)


DELETE R FROM MasterData.Relationship R
where R.TargetEntityId=9000381
---------ADD entry to syslog
INSERT INTO sysssislog(      event, computer, operator, source, sourceid, executionid, starttime, endtime, datacode, message)
VALUES
('PackageEnd',	'STORK8-DATA123',	'DBMOTION\dbmSQL4',	'PopulateDomainPatients',	'6a646888-f333-4832-b7eb-9544d36b7a1e',	'f0715f7b-8129-4668-85e1-463ac812b484',	getdate(),	getdate(),	0,	'End of Package execution.')


----2 encounters received End Date
INSERT INTO Fact.Encounters(       EncounterId, EncounterId_Root, EncounterId_Extension, SourceSystemId_Root, SourceSystemId_Extension, EncounterClassIndicator, PatientRecordID, 
                         PatientId_Root, PatientId_Extension, AssignedOrgId_Root, AssignedOrgId_Extension, ReferringOrgId_Root, ReferringOrgId_Extension, StartDate, EndDate, 
                         EncounterCode, EncounterCodeSystem, LengthOfStayValue, LengthOfStayCode, LengthOfStayCodeSystem, StatusCode, StatusCodeSystem, PriorityCode, 
                         PriorityCodeSystem, DischargeDispositionCode, DischargeDispositionCodeSystem, ChiefComplaint, LastUpdated, DeleteKey, NodeID, TimeStamp, NewFlag)
VALUES

(1000003822,	'2.16.840.1.113883.3.57.1.3.5.52.1.9',  'PHA_EncAT_enc1',	'2.16.840.1.113883.3.57.1.3.5.52.1.5', 'DemoEMPI',	'IMP',	3000002795, '2.16.840.1.113883.3.57.1.3.5.52.1.8.6',	'PHA_EncAT_P1',	'2.16.840.1.113883.3.57.1.3.5.52.1.6.1',	'HH',				NULL,	NULL,	'2013-11-20 21:50:00.000',	'2013-11-27 09:50:00.000',	'IMP',	'2.16.840.1.113883.3.57.1.3.5.52.2.1',	5,	'D',	'2.16.840.1.113883.5.141',	NULL,	NULL,	'REG',	'2.16.840.1.113883.3.57.1.3.5.52.2.5.1',	'UDH',	'2.16.840.1.113883.3.57.1.3.5.52.2.17',	'PAIN IN BACK',	'2013-12-03 17:57:37.277',	0,	1	,getdate(),	0),

(1000003824,	'2.16.840.1.113883.3.57.1.3.5.52.1.9',  'PHA_EncAT_enc3',	'2.16.840.1.113883.3.57.1.3.5.52.1.5', 'DemoEMPI',	'IMP',	3000002797, '2.16.840.1.113883.3.57.1.3.5.52.1.8.6',	'PHA_EncAT_P3',	'2.16.840.1.113883.3.57.1.3.5.52.1.6.1',	'PHA_EncAT_org1',	NULL,	NULL,	'2013-11-20 21:50:00.000',	'2013-11-28 10:50:00.000',	'IMP',	'2.16.840.1.113883.3.57.1.3.5.52.2.1',	5,	'D',	'2.16.840.1.113883.5.141',	NULL,	NULL,	'REG',	'2.16.840.1.113883.3.57.1.3.5.52.2.5.1',	'UDH',	'2.16.840.1.113883.3.57.1.3.5.52.2.17',	'PAIN IN BACK',	'2013-12-03 18:12:06.063',	0,	1	,getdate(),	0)




INSERT INTO Fact.EncounterParticipants(       EncounterParticipantId_Root, EncounterParticipantId_Extension, SourceSystemId_Root, SourceSystemId_Extension, EncounterId_Root, EncounterId_Extension, 
                         EncounterId, ParticipantTypeIndicator, TypeCode, TypeCodeSystem, CareProviderId_Root, CareProviderId_Extension, LastUpdated, DeleteKey, NodeID, TimeStamp, 
                         NewFlag)
VALUES

('2.16.840.1.113883.3.57.1.3.5.52.1.23',	'PHA_EncAT_enc1_PHA_EncAT_prov1_ADM',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_EncAT_enc1',	1000003822,	'ADM',		'ADM',	'2.16.840.1.113883.5.90',	'2.16.840.1.113883.3.57.1.3.5.52.1.26',	'PHA_EncAT_prov1',	'2013-12-03 17:57:37.727',	0,	1,	getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23',	'PHA_EncAT_enc1_PHA_EncAT_prov1_ATND',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_EncAT_enc1',	1000003822,	'ATND',	'ATND',	'2.16.840.1.113883.5.90',	'2.16.840.1.113883.3.57.1.3.5.52.1.26',	'PHA_EncAT_prov1',	'2013-12-03 17:57:37.727',	0,	1,	getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23',	'PHA_EncAT_enc1_PHA_EncAT_prov2_REF',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_EncAT_enc1',	1000003822,	'REF',		'REF',	'2.16.840.1.113883.5.90',	'2.16.840.1.113883.3.57.1.3.5.52.1.26',	'PHA_EncAT_prov2',	'2013-12-03 17:57:37.727',	0,	1,	getdate(),0),

('2.16.840.1.113883.3.57.1.3.5.52.1.23',	'PHA_EncAT_enc3_PHA_EncAT_prov3_ADM',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_EncAT_enc3',	1000003824,	'ADM',		'ADM',	'2.16.840.1.113883.5.90',	'2.16.840.1.113883.3.57.1.3.5.52.1.26',	'PHA_EncAT_prov3',	'2013-12-03 18:12:06.167',	0,	1,	getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23',	'PHA_EncAT_enc3_PHA_EncAT_prov3_ATND',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_EncAT_enc3',	1000003824,	'ATND',	'ATND',	'2.16.840.1.113883.5.90',	'2.16.840.1.113883.3.57.1.3.5.52.1.26',	'PHA_EncAT_prov3',	'2013-12-03 18:12:06.167',	0,	1,	getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23',	'PHA_EncAT_enc3_PHA_EncAT_prov4_REF',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_EncAT_enc3',	1000003824,	'REF',		'REF',	'2.16.840.1.113883.5.90',	'2.16.840.1.113883.3.57.1.3.5.52.1.26',	'PHA_EncAT_prov4',	'2013-12-03 18:12:06.167',	0,	1,	getdate(),0)
       
