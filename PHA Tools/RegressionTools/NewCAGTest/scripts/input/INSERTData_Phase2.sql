/*
--Content--
1. Readmission
2. Fact Conditions
3. AMB Data for Realtionships
4. PCP Data for Realtionships
5. Patients
6. Relation
7. Fact.Encounters
8. Org
9. Clinical Codes
10. Fact.Procedures
11. Data for CAG - ED
12. Fact.Imaging
13. Fact.Labs
*/



USE [dbmClinicalAnalyticsGateway]
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


INSERT INTO sysssislog(      event, computer, operator, source, sourceid, executionid, starttime, endtime, datacode, message)
--VALUES
--('PackageStart',	'STORK8-DATA123',	'DBMOTION\dbmSQL4',	'PopulateDomainPatients',	'6a646888-f333-4832-b7eb-9544d36b7a1e',	'f0715f7b-8129-4668-85e1-463ac812b484',	getdate(),	getdate(),	0,	'Beginning of Package execution.')
VALUES
('PackageStart',	'STORK8-DATA123',	'DBMOTION\dbmSQL4',	'PopulateDomainPatients',	'6a646888-f333-4832-b7eb-9544d36b7a1e',	'f0715f7b-8129-4668-85e1-463ac812b484',	getdate(),	DATEAdd(second,-1,getdate()),	0,	'Beginning of Package execution.')


----------------------------------------------------------------------------Readmissions Phase 2---------------------------------------------------------

INSERT INTO Fact.Encounters(       EncounterId, EncounterId_Root, EncounterId_Extension, SourceSystemId_Root, SourceSystemId_Extension, EncounterClassIndicator, PatientRecordID, 
                         PatientId_Root, PatientId_Extension, AssignedOrgId_Root, AssignedOrgId_Extension, ReferringOrgId_Root, ReferringOrgId_Extension, StartDate, EndDate, 
                         EncounterCode, EncounterCodeSystem, LengthOfStayValue, LengthOfStayCode, LengthOfStayCodeSystem, StatusCode, StatusCodeSystem, PriorityCode, 
                         PriorityCodeSystem, DischargeDispositionCode, DischargeDispositionCodeSystem, ChiefComplaint, LastUpdated, DeleteKey, NodeID, TimeStamp, NewFlag)
VALUES

(4000000002,'2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_2','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','IMP',3000002795,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_2_Level_3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2013-03-20 18:39:15.493','2013-03-25 18:39:15.493','IMP','2.16.840.1.113883.3.57.1.3.5.52.2.1',5,'D','2.16.840.1.113883.5.141',null,null,'UR','2.16.840.1.113883.3.57.1.3.5.52.2.5.1','UDH','2.16.840.1.113883.3.57.1.3.5.52.2.17','PAIN IN BACK','2013-03-25 18:39:15.493',0,1,getdate(),0),
(4000000004,'2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_4','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','IMP',3000002796,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2013-04-20 18:39:15.493','2013-04-30 18:39:15.493','IMP','2.16.840.1.113883.3.57.1.3.5.52.2.1',10,'D','2.16.840.1.113883.5.141',null,null,'REG','2.16.840.1.113883.3.57.1.3.5.52.2.5.1','REG','2.16.840.1.113883.3.57.1.3.5.52.2.17','PAIN IN BACK','2013-04-30 18:39:15.493',1,1,getdate(),0),
(4000000005,'2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_5','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','IMP',3000002797,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2013-03-17 18:39:15.493','2013-03-19 18:39:15.493','IMP','2.16.840.1.113883.3.57.1.3.5.52.2.1',2,'D','2.16.840.1.113883.5.141',null,null,'REG','2.16.840.1.113883.3.57.1.3.5.52.2.5.1','REG','2.16.840.1.113883.3.57.1.3.5.52.2.17','PAIN IN BACK','2013-03-19 18:39:15.493',1,1,getdate(),0),
(4000000022,'2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_EncFUV_22','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','IMP',3000002798,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_2_Level_3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_2_Level_3','2012-11-20 18:39:15.493','2012-11-29 23:39:15.493','IMP','2.16.840.1.113883.3.57.1.3.5.52.2.1',9,'D','2.16.840.1.113883.5.141',null,null,'UR','2.16.840.1.113883.3.57.1.3.5.52.2.5.1','UDH','2.16.840.1.113883.3.57.1.3.5.52.2.17','PAIN IN BACK','2012-11-29 23:39:15.493',0,1,getdate(),0)

INSERT INTO Fact.EncounterParticipants(       EncounterParticipantId_Root, EncounterParticipantId_Extension, SourceSystemId_Root, SourceSystemId_Extension, EncounterId_Root, EncounterId_Extension, 
                         EncounterId, ParticipantTypeIndicator, TypeCode, TypeCodeSystem, CareProviderId_Root, CareProviderId_Extension, LastUpdated, DeleteKey, NodeID, TimeStamp, 
                         NewFlag)
VALUES

('2.16.840.1.113883.3.57.1.3.5.52.1.23','Readmissions_Enc_2_prov_ADM','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_2',4000000002,'ADM','ADM','2.16.840.1.113883.5.90','2.16.840.1.113883.3.57.1.3.5.52.1.26','PHA_EncAT_prov4','2013-12-03 16:54:07.707',0,1,getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23','Readmissions_Enc_2_prov_ATND','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_2',4000000002,'ATND','ATND','2.16.840.1.113883.5.90','2.16.840.1.113883.3.57.1.3.5.52.1.26','PHA_EncAT_prov5','2013-12-03 16:54:07.707',0,1,getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23','Readmissions_Enc_2_prov_REF','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_2',4000000002,'REF','REF','2.16.840.1.113883.5.90','2.16.840.1.113883.3.57.1.3.5.52.1.26','PHA_EncAT_prov6','2013-12-03 16:54:07.707',0,1,getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23','Readmissions_Enc_4_prov_ADM','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_4',4000000004,'ADM','ADM','2.16.840.1.113883.5.90','2.16.840.1.113883.3.57.1.3.5.52.1.26','PHA_EncAT_prov4','2013-12-03 16:54:07.707',0,1,getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23','Readmissions_Enc_4_prov_ATND','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_4',4000000004,'ATND','ATND','2.16.840.1.113883.5.90','2.16.840.1.113883.3.57.1.3.5.52.1.26','PHA_EncAT_prov5','2013-12-03 16:54:07.707',0,1,getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23','Readmissions_Enc_4_prov_REF','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_4',4000000004,'REF','REF','2.16.840.1.113883.5.90','2.16.840.1.113883.3.57.1.3.5.52.1.26','PHA_EncAT_prov6','2013-12-03 16:54:07.707',0,1,getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23','Readmissions_Enc_5_prov_ADM','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_5',4000000005,'ADM','ADM','2.16.840.1.113883.5.90','2.16.840.1.113883.3.57.1.3.5.52.1.26','PHA_EncAT_prov1','2013-12-03 16:54:07.707',0,1,getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23','Readmissions_Enc_5_prov_ATND','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_5',4000000005,'ATND','ATND','2.16.840.1.113883.5.90','2.16.840.1.113883.3.57.1.3.5.52.1.26','PHA_EncAT_prov2','2013-12-03 16:54:07.707',0,1,getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23','Readmissions_Enc_5_prov_REF','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_5',4000000005,'REF','REF','2.16.840.1.113883.5.90','2.16.840.1.113883.3.57.1.3.5.52.1.26','PHA_EncAT_prov3','2013-12-03 16:54:07.707',0,1,getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23','Readmissions_Enc_20_prov_ATND','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_EncFUV_22',4000000022,'ATND','ATND','2.16.840.1.113883.5.90','2.16.840.1.113883.3.57.1.3.5.52.1.26','PHA_EncAT_prov5','2013-12-03 16:54:07.707',0,1,getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23','Readmissions_Enc_20_prov_REF','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_EncFUV_22',4000000022,'REF','REF','2.16.840.1.113883.5.90','2.16.840.1.113883.3.57.1.3.5.52.1.26','PHA_EncAT_prov6','2013-12-03 16:54:07.707',0,1,getdate(),0)

-----UPSERT in Fact Conditions------
INSERT INTO  Fact.Conditions
(ConditionId_Root, ConditionId_Extension, 
SourceSystemId_Root, SourceSystemId_Extension, 
PatientRecordID, PatientId_Root, 
PatientId_Extension, EncounterId, 
 EncounterID_Root, EncounterID_Extension, 
 AssignedOrgId_Root, AssignedOrgId_Extension, 
 StartDate, ConditionCode, 
 ConditionCodeSystem,ConditionDisplayName, 
 ConditionClassIndicator, ConditionTypeCode, 
 ConditionTypeCodeSystem, Priority, 
 NodeID, DeleteKey, 
 dbmAvailibilityTime,  IsPrimary, 
 dbmClassCodeID,  ConditionTypeCodeBaseline,
 [TimeStamp]
)
VALUES --first row - new. 2,3 - update. 4,5 - delete. 6 - For duplicate test
 ('2.16.840.1.113883.3.57.1.3.5.52.1.10',	'PHA_Relat_EncAT_Cond4_2',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'3100000004',	'2.16.840.1.113883.3.57.1.3.5.52.1.8.6',	'PHA_Relat_EncAT_P4',	3100000011,	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_Relat_EncAT_enc1_1',	'2.16.840.1.113883.3.57.1.3.5.52.1.6.1',	'PHA_EncAT_org1',	'2013-11-20 21:50:00.000',	'psychiatric_C',	'DiagnosisValue_I9_DemoEMPI',	'psychiatric_C',	'Diagnosis',	'ADMDX',	'2.16.840.1.113883.3.57.1.3.5.52.2.34'	,1,	1,	0,	'2014-01-10 11:25:03.243',		1,	65536	,'ADMDX',getdate())
,('2.16.840.1.113883.3.57.1.3.5.52.1.10',	'PHA_Relat_EncAT_Cond4',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'3100000004',	'2.16.840.1.113883.3.57.1.3.5.52.1.8.6',	'PHA_Relat_EncAT_P4',	3100000001,	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_Relat_EncAT_enc1',	'2.16.840.1.113883.3.57.1.3.5.52.1.6.1',	'PHA_EncAT_org1',	'2013-11-20 21:50:00.000',	'psychiatric_C',	'DiagnosisValue_I9_DemoEMPI',	'psychiatric_C',	'Diagnosis',	'ADMDX',	'2.16.840.1.113883.3.57.1.3.5.52.2.34'	,1,	1,	0,	'2014-01-10 11:25:03.243',		1,	65536	,'ADMDX',getdate())
,('2.16.840.1.113883.3.57.1.3.5.52.1.10',	'PHA_Relat_EncAT_Cond4',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'3100000004',	'2.16.840.1.113883.3.57.1.3.5.52.1.8.6',	'PHA_Relat_EncAT_P4',	3100000001,	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_Relat_EncAT_enc1',	'2.16.840.1.113883.3.57.1.3.5.52.1.6.1',	'PHA_EncAT_org1',	'2013-11-20 21:50:00.000',	'TBD',	'DiagnosisValue_I9_DemoEMPI',	'TBD psychiatric_C',	'Diagnosis',	'DISDX',	'2.16.840.1.113883.3.57.1.3.5.52.2.34'	,1,	1,	0,	'2014-01-10 11:25:03.243',		1,	65536	,'DISDX',getdate())
,('2.16.840.1.113883.3.57.1.3.5.52.1.10',	'PHA_Relat_EncAT_Cond3',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'3100000002',	'2.16.840.1.113883.3.57.1.3.5.52.1.8.6',	'PHA_Relat_EncAT_P3',	3100000003,	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_Relat_EncAT_enc3',	'2.16.840.1.113883.3.57.1.3.5.52.1.6.1',	'PHA_EncAT_org1',	'2013-11-24 21:50:00.000',	'TBDfgfd',	'DiagnosisValue_I9_DemoEMPI',	'Any fdg',	'Diagnosis',	'ADMDX',	'2.16.840.1.113883.3.57.1.3.5.52.2.34'	,1,	1,	1,	'2014-01-13 10:10:37.137',1,	65536	,'ADMDX',getdate())
,('2.16.840.1.113883.3.57.1.3.5.52.1.10',	'PHA_Relat_EncAT_Cond3',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'3100000002',	'2.16.840.1.113883.3.57.1.3.5.52.1.8.6',	'PHA_Relat_EncAT_P3',	3100000003,	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_Relat_EncAT_enc3',	'2.16.840.1.113883.3.57.1.3.5.52.1.6.1',	'PHA_EncAT_org1',	'2013-11-24 21:50:00.000',	'TBD',	'DiagnosisValue_I9_DemoEMPI',	'Any',	'Diagnosis',	'DISDX',	'2.16.840.1.113883.3.57.1.3.5.52.2.34'	,1,	1,	1,	'2014-01-13 10:10:37.137',1,	65536	,'DISDX',getdate())
,('2.16.840.1.113883.3.57.1.3.5.52.1.10',	'PHA_Relat_EncAT_Cond4_2',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'3100000004',	'2.16.840.1.113883.3.57.1.3.5.52.1.8.6',	'PHA_Relat_EncAT_P4',	3100000011,	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_Relat_EncAT_enc1_1',	'2.16.840.1.113883.3.57.1.3.5.52.1.6.1',	'PHA_EncAT_org1',	'2013-11-20 21:50:00.000',	'psychiatric_C',	'DiagnosisValue_I9_DemoEMPI',	'psychiatric_C',	'Diagnosis',	'ADMDX',	'2.16.840.1.113883.3.57.1.3.5.52.2.34'	,1,	1,	0,	'2014-01-10 11:25:03.243',		1,	65536	,'ADMDX',getdate())

-----END: UPSERT in Fact Conditions------


INSERT INTO Fact.MetricsResults(MetricId_Root,	MetricId_Extension,	PatientId_Root,	PatientId_Extension,	EffectiveTime_Start,	EffectiveTime_End,	
LastUpdatedTime,	MetricTypeCode,	MetricTypeCodeSystem,	Compliance,	Clinical_ConceptCodeSystem,	Clinical_ConceptCode,	InterpretationCodeSystem,	InterpretationCode,
Clinical_QuantitiveValue,Clinical_QuantitiveValueText	,	DeleteKey,	NodeID,	TimeStamp,	NewFlag
)
VALUES

('2.16.840.1.113883.3.57.1.2.17.88','007240000000011','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P22','2013-11-03 18:39:15.493','2013-11-10 18:39:15.493',getdate(),'0072','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,'2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_11',50,'Surgery/Gynecology',1,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','007440000000014','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1','2013-07-20 18:39:15.493','2013-07-28 18:39:15.493',getdate(),'0074','2.16.840.1.113883.3.57.1.2.17.89',1,'2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_14','2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_13',null,Null,1,1,getdate(),1)


--------- Add Data for Realtionships Testing------------------

--------- Add AMB Data for Realtionships Testing------------------
INSERT INTO Fact.Encounters(       EncounterId, EncounterId_Root, EncounterId_Extension, SourceSystemId_Root, SourceSystemId_Extension, EncounterClassIndicator, PatientRecordID, 
                         PatientId_Root, PatientId_Extension, AssignedOrgId_Root, AssignedOrgId_Extension, ReferringOrgId_Root, ReferringOrgId_Extension, StartDate, EndDate, 
                         EncounterCode, EncounterCodeSystem, LengthOfStayValue, LengthOfStayCode, LengthOfStayCodeSystem, StatusCode, StatusCodeSystem, PriorityCode, 
                         PriorityCodeSystem, DischargeDispositionCode, DischargeDispositionCodeSystem, ChiefComplaint, LastUpdated, DeleteKey, NodeID, TimeStamp, NewFlag)
VALUES
(4000000021,'2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_1_AMBVisit','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','AMB',3000002810,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P22','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','HH','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','HH','2013-01-02 18:39:15.493',null,'AMB','2.16.840.1.113883.3.57.1.3.5.52.2.1',0,'D','2.16.840.1.113883.5.141',null,null,'REG','2.16.840.1.113883.3.57.1.3.5.52.2.5.1','REG','2.16.840.1.113883.3.57.1.3.5.52.2.17','PAIN IN BACK','2013-01-01 18:39:15.493',0,1,getdate(),0)

INSERT INTO Fact.EncounterParticipants(       EncounterParticipantId_Root, EncounterParticipantId_Extension, SourceSystemId_Root, SourceSystemId_Extension, EncounterId_Root, EncounterId_Extension, 
                         EncounterId, ParticipantTypeIndicator, TypeCode, TypeCodeSystem, CareProviderId_Root, CareProviderId_Extension, LastUpdated, DeleteKey, NodeID, TimeStamp, 
                         NewFlag)
VALUES

('2.16.840.1.113883.3.57.1.3.5.52.1.23','Readmissions_Enc_21_prov_AMB','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_1_AMBVisit',4000000021,'ADM','ADM','2.16.840.1.113883.5.90','2.16.840.1.113883.3.57.1.3.5.52.1.26','PHA_EncAT_prov1','2013-12-03 16:54:07.707',0,1,getdate(),0)

--------- Add PCP Data for Realtionships Testing------------------
delete from [MasterData].[Relationship] where TargetEntityId = 9000378 and (SourceEntityId = 90039871 or SourceEntityId = 90039877)
DECLARE @RelID bigint
SELECT @RelID = MAX(ID) from [MasterData].[Relationship]


INSERT INTO [MasterData].[Relationship]
(   ID, SourceEntityId, TargetEntityId, RoleTypeCode, RoleTypeCodeSystem, TypeDiscriminator, StartDate, EndDate, TimeStamp, DataSource, RoleTypeCodeCTS
)
VALUES
(@RelID+1,	90039877,	9000378,	'GPCP',	'2.16.840.1.113883.3.57.1.2.7',	1,	'2013-05-10 14:53:20.343'	,NULL,	getdate(),	'PPOL',	'7a609afaa6856dd93c053b6afd87e044'),

(@RelID+2,	90039871,	9000378,	'GPCP',	'2.16.840.1.113883.3.57.1.2.7',	1,	'2012-01-10 01:01:25.030'	,'2013-05-10 14:53:20.343',	getdate(),	'PPOL',	'7a609afaa6856dd93c053b6afd87e044')


GO

DECLARE @MaxPat bigint, 
@MaxPid bigint,
@MaxCar bigint,
@MaxCarId bigint, @RelID bigint

CREATE TABLE #Pat(PatientID_CDR BIGINT, 
EnterprisePatientId bigint, 
PatientId_Extension NVARCHAR(255))

INSERT INTO #Pat
SELECT        PatientID_CDR, EnterprisePatientId, PatientId_Extension
FROM            MasterData.PatientIdentifier
WHERE        (PatientId_Extension = N'PHA_Relat_EncAT_P4')


DELETE P FROM MasterData.Patient P
INNER JOIN  #Pat Pat
ON P.PatientID_CDR=Pat.PatientID_CDR

DELETE P FROM MasterData.Patient P
INNER JOIN  #Pat Pat
ON P.EnterprisePatientId=Pat.EnterprisePatientId

SELECT @MaxPat=MAX(PatientID) FROM MasterData.Patient

INSERT INTO MasterData.Patient( PatientID, PatientID_CDR, EnterprisePatientId, Version, TimeOfBirth, TimeOfDeath, Deceased, GenderCode, GenderCodeSystem, MaritalStatusCode, 
                         MaritalStatusCodeSystem, ReligiousAffiliationCode, ReligiousAffiliationCodeSystem, RaceCode, RaceCodeSystem, BirthcountryCode, BirthCountryCodeSystem, 
                         PreferredLanguageCode, PreferredLanguageCodeSystem, StateOrProvince, City, PostalCode, AddressLine1, FullName, LastName, MiddleName, FirstName, 
                         NameSuffix, Title, MotherMaidenName, HomePhone, BusinessPhone, DeleteKey, TimeStamp, PatientMPIID, LastUpdated, IsGolden
)

VALUES
(@MaxPat+1,	3100000004,	9100004,	'1.0.0',	'1932-06-22 00:00:00.000',	'2014-02-21',	NULL,	'M',	'2.16.840.1.113883.3.57.1.3.5.52.2.12',	'M',	'2.16.840.1.113883.3.57.1.3.5.52.2.32',	'CA',	'2.16.840.1.113883.3.57.1.3.5.52.2.49',	'CA',	'2.16.840.1.113883.3.57.1.3.5.52.2.48',	'LOS ANGELES,CA',	'2.16.840.1.113883.3.57.1.3.5.52.2.14',	'ENGLISH',	'2.16.840.1.113883.3.57.1.3.5.52.2.71',	'CA',	'ROSEMEAD',	'91777',	'3627 mom AVE','secondnamePHA_Relat_EncAT_P4, firstnamePHA_Relat_EncAT_P4, REL',	'secondnamePHA_Relat_EncAT_P4',	'REL',	'firstnamePHA_Relat_EncAT_P4',	'JR',	'DR',	'PINEDO',	'(626)872 9754 CELL',	'(626)578 5552',	0,	getdate(),	71474,	'2013-12-03 18:19:18.980',	1)

--Create list of Patients to be removed

DELETE P FROM MasterData.PatientIdentifier P
INNER JOIN  #Pat Pat
ON P.PatientID_CDR=Pat.PatientID_CDR

DELETE P FROM MasterData.PatientIdentifier P
INNER JOIN  #Pat Pat
ON P.EnterprisePatientId=Pat.EnterprisePatientId

SELECT @MaxPid=MAX(PatientIdentifierId) FROM  MasterData.PatientIdentifier
INSERT INTO  MasterData.PatientIdentifier(       PatientIdentifierId, PatientID_CDR, EnterprisePatientId, PatientId_Root, PatientId_Extension, IdentifierTypeCode, IdentifierTypeCodeSystem, TimeStamp, IsPrimary, 
                         DeleteKey, isGolden)

VALUES
(@MaxPid+9,	3100000004,	9100004,	'2.16.840.1.113883.3.57.1.3.5.52.1.8.6',	'PHA_Relat_EncAT_P4',	'MRN',	'2.16.840.1.113883.3.57.1.2.6',	getdate(),	1,	0,	1)

---------ADD entry to syslog
INSERT INTO sysssislog(      event, computer, operator, source, sourceid, executionid, starttime, endtime, datacode, message)
VALUES
('PackageEnd',	'STORK8-DATA123',	'DBMOTION\dbmSQL4',	'PopulateDomainPatients',	'6a646888-f333-4832-b7eb-9544d36b7a1e',	'f0715f7b-8129-4668-85e1-463ac812b484',	getdate(),	getdate(),	0,	'End of Package execution.')

--Patient Provider Relationship

SELECT @RelID = MAX(ID) from [MasterData].[Relationship]

DELETE R FROM MasterData.Relationship R
WHERE TargetEntityId=9100107

INSERT INTO [MasterData].[Relationship]
(   ID, SourceEntityId, TargetEntityId, RoleTypeCode, RoleTypeCodeSystem, TypeDiscriminator, StartDate, EndDate, TimeStamp, DataSource, RoleTypeCodeCTS
)
VALUES

(@RelID+1,	92000001,	9100107,	'GPCP',	'2.16.840.1.113883.3.57.1.2.7',	1,	'2012-12-03 18:10:06.720'	,'2014-03-03 12:10:06.720',	getdate(),	'PPOL',	'7a609afaa6856dd93c053b6afd87e044'),
(@RelID+2,	92000006,	9100107,	'GPCP',	'2.16.840.1.113883.3.57.1.2.7',	1,	'2014-03-03 12:10:06.720'	,NULL,	getdate(),	'PPOL',	'7a609afaa6856dd93c053b6afd87e044')

--Fact.Encounters

INSERT INTO Fact.Encounters(       EncounterId, EncounterId_Root, EncounterId_Extension, SourceSystemId_Root, SourceSystemId_Extension, EncounterClassIndicator, PatientRecordID, 
                         PatientId_Root, PatientId_Extension, AssignedOrgId_Root, AssignedOrgId_Extension, ReferringOrgId_Root, ReferringOrgId_Extension, StartDate, EndDate, 
                         EncounterCode, EncounterCodeSystem, LengthOfStayValue, LengthOfStayCode, LengthOfStayCodeSystem, StatusCode, StatusCodeSystem, PriorityCode, 
                         PriorityCodeSystem, DischargeDispositionCode, DischargeDispositionCodeSystem, ChiefComplaint, LastUpdated, DeleteKey, NodeID, TimeStamp, NewFlag)
VALUES
(3100000091,	'2.16.840.1.113883.3.57.1.3.5.52.1.9',  'PHA_Relat_EncAT_enc9_1',	'2.16.840.1.113883.3.57.1.3.5.52.1.5', 'DemoEMPI',	'AMB',	3100000009, '2.16.840.1.113883.3.57.1.3.5.52.1.8.6',	'PHA_Relat_EncAT_P9',	'2.16.840.1.113883.3.57.1.3.5.52.1.6.1',	'PHA_EncAT_org8',	'2.16.840.1.113883.3.57.1.3.5.52.1.6.1',	'PHA_EncAT_org8',	'2014-01-13 09:50:00.000',	NULL,	'AMB',	'2.16.840.1.113883.3.57.1.3.5.52.2.1',	5,	'D',	'2.16.840.1.113883.5.141',	NULL,	NULL,	'REG',	'2.16.840.1.113883.3.57.1.3.5.52.2.5.1',	'UDH',	'2.16.840.1.113883.3.57.1.3.5.52.2.17',	'PAIN IN BACK',	'2013-12-03 18:17:31.587',	0,	1	,getdate(),	0)
,(3100000191,	'2.16.840.1.113883.3.57.1.3.5.52.1.9',  'PHA_Relat_EncAT_enc_100_9_1',	'2.16.840.1.113883.3.57.1.3.5.52.1.5', 'DemoEMPI',	'AMB',	3100000109, '2.16.840.1.113883.3.57.1.3.5.52.1.8.6',	'PHA_Relat_EncAT_P9',	'2.16.840.1.113883.3.57.1.3.5.52.1.6.1',	'PHA_EncAT_org8',	'2.16.840.1.113883.3.57.1.3.5.52.1.6.1',	'PHA_EncAT_org8',	'2014-01-18 09:50:00.000',	NULL,	'AMB',	'2.16.840.1.113883.3.57.1.3.5.52.2.1',	5,	'D',	'2.16.840.1.113883.5.141',	NULL,	NULL,	'REG',	'2.16.840.1.113883.3.57.1.3.5.52.2.5.1',	'UDH',	'2.16.840.1.113883.3.57.1.3.5.52.2.17',	'PAIN IN BACK',	'2013-12-03 18:17:31.587',	0,	1	,getdate(),	0)


INSERT INTO Fact.EncounterParticipants(       EncounterParticipantId_Root, EncounterParticipantId_Extension, SourceSystemId_Root, SourceSystemId_Extension, EncounterId_Root, EncounterId_Extension, 
                         EncounterId, ParticipantTypeIndicator, TypeCode, TypeCodeSystem, CareProviderId_Root, CareProviderId_Extension, LastUpdated, DeleteKey, NodeID, TimeStamp, 
                         NewFlag)
VALUES
('2.16.840.1.113883.3.57.1.3.5.52.1.23',	'PHA_Relat_EncAT_enc9_1_PHA_Relat_EncAT_prov5_ADM',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_Relat_EncAT_enc9_1',	3100000091,	'ADM',		'ADM',	'2.16.840.1.113883.5.90',	'2.16.840.1.113883.3.57.1.3.5.52.1.26',	'PHA_Relat_EncAT_prov5',	'2013-12-03 18:17:31.603',	0,	1,	getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23',	'PHA_Relat_EncAT_enc9_1_PHA_Relat_EncAT_prov5_ATND',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_Relat_EncAT_enc9_1',	3100000091,	'ATND',		'ATND',	'2.16.840.1.113883.5.90',	'2.16.840.1.113883.3.57.1.3.5.52.1.26',	'PHA_Relat_EncAT_prov5',	'2013-12-03 18:17:31.603',	0,	1,	getdate(),0),

('2.16.840.1.113883.3.57.1.3.5.52.1.23',	'PHA_Relat_EncAT_enc9_1_PHA_Relat_EncAT_prov5_DIS',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_Relat_EncAT_enc9_1',	3100000091,	'DIS',	'DIS',	'2.16.840.1.113883.5.90',	'2.16.840.1.113883.3.57.1.3.5.52.1.26',	'PHA_Relat_EncAT_prov5',	'2013-12-03 18:17:31.603',	0,	1,	getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23',	'PHA_Relat_EncAT_enc9_1_PHA_Relat_EncAT_prov6_REF',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_Relat_EncAT_enc9_1',	3100000091,	'REF',		'REF',	'2.16.840.1.113883.5.90',	'2.16.840.1.113883.3.57.1.3.5.52.1.26',	'PHA_Relat_EncAT_prov5',	'2013-12-03 18:17:31.603',	0,	1,	getdate(),0)
,
('2.16.840.1.113883.3.57.1.3.5.52.1.23',	'PHA_Relat_EncAT_enc9100_1_PHA_Relat_EncAT_prov5_ADM',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_Relat_EncAT_enc_100_9_1',	3100000191,	'ADM',		'ADM',	'2.16.840.1.113883.5.90',	'2.16.840.1.113883.3.57.1.3.5.52.1.26',	'PHA_Relat_EncAT_prov5',	'2013-12-03 18:17:31.603',	0,	1,	getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23',	'PHA_Relat_EncAT_enc9100_1_PHA_Relat_EncAT_prov5_ATND',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_Relat_EncAT_enc_100_9_1',	3100000191,	'ATND',		'ATND',	'2.16.840.1.113883.5.90',	'2.16.840.1.113883.3.57.1.3.5.52.1.26',	'PHA_Relat_EncAT_prov5',	'2013-12-03 18:17:31.603',	0,	1,	getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23',	'PHA_Relat_EncAT_enc9100_1_PHA_Relat_EncAT_prov5_DIS',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_Relat_EncAT_enc_100_9_1',	3100000191,	'DIS',	'DIS',	'2.16.840.1.113883.5.90',	'2.16.840.1.113883.3.57.1.3.5.52.1.26',	'PHA_Relat_EncAT_prov5',	'2013-12-03 18:17:31.603',	0,	1,	getdate(),0),
('2.16.840.1.113883.3.57.1.3.5.52.1.23',	'PHA_Relat_EncAT_enc9100_1_PHA_Relat_EncAT_prov6_REF',	'2.16.840.1.113883.3.57.1.3.5.52.1.5',	'DemoEMPI',	'2.16.840.1.113883.3.57.1.3.5.52.1.9',	'PHA_Relat_EncAT_enc_100_9_1',	3100000191,	'REF',		'REF',	'2.16.840.1.113883.5.90',	'2.16.840.1.113883.3.57.1.3.5.52.1.26',	'PHA_Relat_EncAT_prov5',	'2013-12-03 18:17:31.603',	0,	1,	getdate(),0)


--Org

DELETE FROM MasterData.Organization where OrganizationId =9100000004
INSERT INTO MasterData.Organization
( OrganizationId, EnterpriseOrganizationId, Name, ParentOrganizationId, TimeStamp, NodeId)
VALUES
(9100000004, -9100000004,'PHA_EncAT_org4', -9000000003,getdate(),1)


DELETE FROM MasterData.OrganizationIdentifier where OrganizationId =9100000004
INSERT INTO  MasterData.OrganizationIdentifier
(organizationId, EnterpriseOrganizationId, OrganizationId_Extension, OrganizationId_Root, TimeStamp, NodeId)
VALUES
(9100000004, -9100000004,'PHA_EncAT_org4', '2.16.840.1.113883.3.57.1.3.5.52.1.6.1',getdate(),1)

DROP TABLE #Pat

DELETE FROM dbmClinicalAnalyticsGateway.masterdata.clinicalcodes 
WHERE  code = '62004' 
       AND codesystem = '2.16.840.1.113883.20.12' 

DELETE FROM dbmClinicalAnalyticsGateway.masterdata.clinicalcodes 
WHERE  code = '62009' 
       AND codesystem = '2.16.840.1.113883.20.12' 

DELETE FROM dbmClinicalAnalyticsGateway.masterdata.clinicalcodes 
WHERE  code = '620040'
       AND codesystem = 'DiagnosisValue_I9_DemoEMPI'

DELETE FROM dbmClinicalAnalyticsGateway.masterdata.clinicalcodes 
WHERE  code = '6200400'
       AND codesystem = '2.16.840.1.113883.3.57.1.3.5.52.2.17'

delete from dbmClinicalAnalyticsGateway.MasterData.ClinicalCodes
where ID in
(
2874056,
2588931,
2053943,
2006,
2009,
20060,
200600
)

--Clinical Codes

set IDENTITY_INSERT dbmClinicalAnalyticsGateway.MasterData.ClinicalCodes on

INSERT INTO dbmClinicalAnalyticsGateway.MasterData.ClinicalCodes
	([ID], [ClinicalCodeId], [Code], [CodeSystem], [CodeSystemName], [Designation], [IsLocal], [UMSDomain], [LastUpdated], [TimeStamp], [NodeId], [DeleteKey], [SysFlag], [CTSCode], [NewFlag], [DomainCode])
VALUES

	(2874056, 1000714520, 77056, '2.16.840.1.113883.3.57.1.3.5.52.2.82', 'DiagnosticImageCode', 'Mammography Bilateral', 1, 'DiagnosticImageCode', '2014-05-28 15:35:00', '2014-05-28 15:37:00', 1, 1, 0, 'ad65e5213a064e9854b58411ac597085', NULL, 'DiagnosticImageCode'),
	--(2874054, 1000676971, 77056, '2.16.840.1.113883.6.12', 'CPT-4', 'Mammography Bilateral', 0, 'DiagnosticImageCode', '2014-05-28 15:35:00', '2014-05-28 15:37:00', 1, 0, 0, '4598556555d86013fffa9743e4c47e88', NULL, 'imaging_chest'),
--	(2874052, 1000714520, 77056, '2.16.840.1.113883.3.57.1.3.5.52.2.82', 'DiagnosticImageCode', 'Mammography Bilateral', 1, 'DiagnosticImageCode', '2014-05-28 15:25:00', '2014-05-28 15:37:00', 1, 0, 1, NULL, NULL, 'DiagnosticImageCode'),
--	(2874045, 1000714519, 429400009, '2.16.840.1.113883.3.57.1.3.5.52.2.62.1', 'ActProcedureCode_Local', 'Mastectomy of right breast_proc', 1, 'ActProcedureCode', '2014-05-28 10:20:00', '2014-05-28 10:24:00', 1, 0, 0, 'f8e4fe162ced41aeffaf56d26b94e0c9', NULL, 'ActProcedureCode'),
---	(2874042, 1000464546, 429400009, '2.16.840.1.113883.6.96', 'SNOMED-CT', 'Mastectomy of right breast', 0, 'ActProcedureCode', '2014-05-28 10:20:00', '2014-05-28 10:24:00', 1, 0, 0, 'b601a93d52aba48ee5cb23b529e7d43b', NULL, '39c9f071ec323c9743c8ea28045b207e'),
	(2588931, 1000714519, 429400009, '2.16.840.1.113883.3.57.1.3.5.52.2.62.1', 'ActProcedureCode_Local', 'Mastectomy of right breast_procedure', 1, 'ActProcedureCode', '2014-05-27 11:51:00', '2014-05-27 17:29:00', 1, 0, 1, NULL, NULL, 'ActProcedureCode'),
--	(2532648, 1000676971, 77056, '2.16.840.1.113883.6.12', 'CPT-4', 'Mammography Bilateral', 0, 'DiagnosticImageCode', '2013-09-27 16:41:00', '2014-05-27 17:29:00', 1, 0, 1, NULL, NULL, 'imaging_chest'),
	(2053943, 1001464546, 429402209, '3.16.840.1.113883.6.96', 'SNOMED-CT', 'Mastectomy of right breasts', 0, 'ActProcedureCode', '2013-09-27 15:40:00', '2014-05-27 17:29:00', 1, 0, 1, NULL, NULL, '39c9f071ec323c9743c8ea28045b207e'),
	(2006, 1000462004, 62004, '2.16.840.1.113883.20.12', 'SNOMED-CT', 'Changing Desc Head2', 0, 'dbmProcedureType', '2013-09-28 15:40:00', '2014-06-28 17:29:00', 1, 0, 0, NULL, NULL, '39c9f071ec323c9743c8ea28045b207e'),
	(2009, 1000462009, 62009, '2.16.840.1.113883.20.12', 'SNOMED-CT', 'Changing Desc Head2', 0, 'dbmImagingType', '2013-09-28 15:40:00', '2014-06-28 17:29:00', 1, 0, 0, NULL, NULL, '39c9f071ec323c9743c8ea28045b207e'),
	(20060, 10004620040, 620040, 'DiagnosisValue_I9_DemoEMPI', 'SNOMED-CT', 'Changing Desc Head2', 0, 'ObservationValue', '2013-09-28 15:40:00', '2014-06-28 17:29:00', 1, 0, 0, NULL, NULL, '39c9f071ec323c9743c8ea28045b207e'),
	(200600, 100046200400, 6200400, '2.16.840.1.113883.3.57.1.3.5.52.2.17', 'SNOMED-CT', 'Changing Desc Head2', 0, 'ActPriority', '2013-09-28 15:40:00', '2014-06-28 17:29:00', 1, 0, 0, NULL, NULL, '39c9f071ec323c9743c8ea28045b207e')
;


set IDENTITY_INSERT dbmClinicalAnalyticsGateway.MasterData.ClinicalCodes off


--Insert Clinicalcodes_Links for Procedure Test

DELETE FROM dbmClinicalAnalyticsGateway.masterdata.clinicalcodeslinks 
WHERE  clinicalcodeid = '1000462003' 
       AND linkedclinicalcodeid = '1000462001' 

INSERT INTO dbmClinicalAnalyticsGateway.MasterData.ClinicalCodeslinks
	([ClinicalCodeId],[LinkedClinicalCodeId],[LinkType],[TimeStamp],[NodeId],[DeleteKey],[SysFlag])
VALUES
	(1000462003, 1000462002, 'EQUALS_TO', '2014-06-28 17:29:00', 1, 0, 0)
;

--Insert Clinicalcodes_Links for Imaging Test

DELETE FROM dbmClinicalAnalyticsGateway.masterdata.clinicalcodeslinks 
WHERE  clinicalcodeid = '1000462008' 
       AND linkedclinicalcodeid = '1000462006' 

INSERT INTO dbmClinicalAnalyticsGateway.MasterData.ClinicalCodeslinks
	([ClinicalCodeId],[LinkedClinicalCodeId],[LinkType],[TimeStamp],[NodeId],[DeleteKey],[SysFlag])
VALUES
	(1000462008, 1000462007, 'EQUALS_TO', '2014-06-28 17:29:00', 1, 0, 0)

DELETE FROM dbmClinicalAnalyticsGateway.masterdata.clinicalcodeslinks 
WHERE  clinicalcodeid = '10004620030'
       AND linkedclinicalcodeid = '10004620010'

DELETE FROM dbmClinicalAnalyticsGateway.masterdata.clinicalcodeslinks 
WHERE  clinicalcodeid = '100046200300'
       AND linkedclinicalcodeid = '100046200100'
       
       INSERT INTO dbmClinicalAnalyticsGateway.MasterData.ClinicalCodeslinks
	([ClinicalCodeId],[LinkedClinicalCodeId],[LinkType],[TimeStamp],[NodeId],[DeleteKey],[SysFlag])
VALUES
	(10004620030, 10004620020, 'EQUALS_TO', '2014-06-28 17:29:00', 1, 0, 0),
	(100046200300, 100046200200, 'EQUALS_TO', '2014-06-28 17:29:00', 1, 0, 0)
;

--Procedures for Phase 2

INSERT INTO [Fact].[Procedures]
           ( [ProcedureId_Root] , [ProcedureId_Extension] ,[PatientId_Root] ,[PatientId_Extension],[EncounterID],[EncounterId_Root],[EncounterId_Extension] , [ProcedureCode] ,[ProcedureCodeSystem]
            ,[ProcedureStartDate] ,[ProcedureEndDate]  ,[StatusCode]  ,[StatusCodeSystem] ,[DeleteKey] ,[TimeStamp])


     VALUES  ('2.16.840.1.113883.3.57.1.3.5.52.1.14','Procedure_1',null,null,null,null,null,null,null,null,null,NULL,NULL,1,getdate()),
	  
			 ('2.16.840.1.113883.3.57.1.2.9','Procedure_2','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_Relat_EncAT_P3',4000000001,'2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_1','429400009','2.16.840.1.113883.6.96','2012-01-10 01:01:25.030','2012-01-10 02:01:25.030',NULL,NULL,0,getdate()),

			 ('2.16.840.1.113883.3.57.1.2.9','Procedure_6','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_Relat_EncAT_P5',null,null,null,'429400009','2.16.840.1.113883.6.96','2012-01-10 01:01:25.030','2012-01-10 02:01:25.030',NULL,NULL,0,getdate()),
			--For duplicate test:
			 ('2.16.840.1.113883.3.57.1.2.9','Procedure_6','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_Relat_EncAT_P5',null,null,null,'429400009','2.16.840.1.113883.6.96','2012-01-10 01:01:25.030','2012-01-10 02:01:25.030',NULL,NULL,0,getdate())
     
-------------------------------------------------------------------------------------------------------------------------------------------------------

--Update data for CAG - ED

INSERT INTO Fact.Encounters(       EncounterId, EncounterId_Root, EncounterId_Extension, SourceSystemId_Root, SourceSystemId_Extension, EncounterClassIndicator, PatientRecordID, 
                         PatientId_Root, PatientId_Extension, AssignedOrgId_Root, AssignedOrgId_Extension, ReferringOrgId_Root, ReferringOrgId_Extension, StartDate, EndDate, 
                         EncounterCode, EncounterCodeSystem, LengthOfStayValue, LengthOfStayCode, LengthOfStayCodeSystem, StatusCode, StatusCodeSystem, PriorityCode, 
                         PriorityCodeSystem, DischargeDispositionCode, DischargeDispositionCodeSystem, ChiefComplaint, LastUpdated, DeleteKey, NodeID, TimeStamp, NewFlag)
VALUES
(4000000001,'2.16.840.1.113883.3.57.1.3.5.52.1.9','CPM_Enc_1','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','IMP',3000002795,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2013-03-03 18:39:15.493','2013-03-05 18:39:15.493','IMP','2.16.840.1.113883.3.57.1.3.5.52.2.1',2,'D','2.16.840.1.113883.5.141',null,null,'REG','2.16.840.1.113883.3.57.1.3.5.52.2.5.1','REG','2.16.840.1.113883.3.57.1.3.5.52.2.17','PAIN IN Leg','2013-03-05 18:49:15.493',1,1,getdate(),0),
(4000000002,'2.16.840.1.113883.3.57.1.3.5.52.1.9','CPM_Enc_7','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','IMP',3000002795,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2013-03-20 18:39:15.493','2013-03-25 18:39:15.493','IMP','2.16.840.1.113883.3.57.1.3.5.52.2.1',5,'D','2.16.840.1.113883.5.141',null,null,'UR','2.16.840.1.113883.3.57.1.3.5.52.2.5.1','UDH','2.16.840.1.113883.3.57.1.3.5.52.2.17','PAIN IN BACK','2013-03-25 18:49:15.493',0,1,getdate(),0),
--For duplicate test:
(4000000002,'2.16.840.1.113883.3.57.1.3.5.52.1.9','CPM_Enc_7','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','IMP',3000002795,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2013-03-20 18:39:15.493','2013-03-25 18:39:15.493','IMP','2.16.840.1.113883.3.57.1.3.5.52.2.1',5,'D','2.16.840.1.113883.5.141',null,null,'UR','2.16.840.1.113883.3.57.1.3.5.52.2.5.1','UDH','2.16.840.1.113883.3.57.1.3.5.52.2.17','PAIN IN BACK','2013-03-25 18:49:15.493',0,1,getdate(),0),
(4000000003,'2.16.840.1.113883.3.57.1.3.5.52.1.9','CPM_Enc_3','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','AMB',3000002796,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2013-04-03 18:39:15.493','2013-04-07 18:39:15.493','AMB','2.16.840.1.113883.3.57.1.3.5.52.2.1',14,'D','2.16.840.1.113883.5.141',null,null,'UR','2.16.840.1.113883.3.57.1.3.5.52.2.5.1','REG','2.16.840.1.113883.3.57.1.3.5.52.2.17','PAIN IN BACK','2013-04-07 18:49:15.493',0,1,getdate(),0),
(4000000004,'2.16.840.1.113883.3.57.1.3.5.52.1.9','CPM_Enc_8','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','AMB',3000002796,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2012-04-20 18:39:15.493','2012-04-30 18:39:15.493','AMB','2.16.840.1.113883.3.57.1.3.5.52.2.1',10,'D','2.16.840.1.113883.5.141',null,null,'REG','2.16.840.1.113883.3.57.1.3.5.52.2.5.1','REG','2.16.840.1.113883.3.57.1.3.5.52.2.17','PAIN IN BACK','2012-04-30 18:49:15.493',0,1,getdate(),0),
--For duplicate test:
(4000000004,'2.16.840.1.113883.3.57.1.3.5.52.1.9','CPM_Enc_8','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','AMB',3000002796,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2012-04-20 18:39:15.493','2012-04-30 18:39:15.493','AMB','2.16.840.1.113883.3.57.1.3.5.52.2.1',10,'D','2.16.840.1.113883.5.141',null,null,'REG','2.16.840.1.113883.3.57.1.3.5.52.2.5.1','REG','2.16.840.1.113883.3.57.1.3.5.52.2.17','PAIN IN BACK','2012-04-30 18:49:15.493',0,1,getdate(),0),
(4000000005,'2.16.840.1.113883.3.57.1.3.5.52.1.9','CPM_Enc_5','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','EMER',3000002797,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2013-03-18 18:39:15.493','2013-03-20 18:39:15.493','EMER','2.16.840.1.113883.3.57.1.3.5.52.2.1',2,'D','2.16.840.1.113883.5.141',null,null,'REG','2.16.840.1.113883.3.57.1.3.5.52.2.5.1','REG','2.16.840.1.113883.3.57.1.3.5.52.2.17','PAIN IN BACK','2013-03-19 18:49:15.493',0,1,getdate(),0),
(4000000006,'2.16.840.1.113883.3.57.1.3.5.52.1.9','CPM_Enc_9','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','EMER',3000002797,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2013-03-20 18:39:15.493','2013-03-29 18:39:15.493','EMER','2.16.840.1.113883.3.57.1.3.5.52.2.1',9,'D','2.16.840.1.113883.5.141',null,null,'UR','2.16.840.1.113883.3.57.1.3.5.52.2.5.1','UDH','2.16.840.1.113883.3.57.1.3.5.52.2.17','PAIN IN BACK','2013-03-29 18:49:15.493',0,1,getdate(),0),
--For duplicate test:
(4000000006,'2.16.840.1.113883.3.57.1.3.5.52.1.9','CPM_Enc_9','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI','EMER',3000002797,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','Hospital_1_Level_3','2013-03-20 18:39:15.493','2013-03-29 18:39:15.493','EMER','2.16.840.1.113883.3.57.1.3.5.52.2.1',9,'D','2.16.840.1.113883.5.141',null,null,'UR','2.16.840.1.113883.3.57.1.3.5.52.2.5.1','UDH','2.16.840.1.113883.3.57.1.3.5.52.2.17','PAIN IN BACK','2013-03-29 18:49:15.493',0,1,getdate(),0)

-------------------------------------Delete Update and Insert round 2 for Imaging------------------------------------------------------------------------------

INSERT INTO [dbmClinicalAnalyticsGateway].[Fact].[Imaging]
([ImagingStudyID],[ImagingStudyId_Root],[ImagingStudyId_Extension],[DeleteKey],[TimeStamp])

VALUES (  4000000237,'2.16.840.1.113883.3.57.1.3.5.52.1.43','PHA2_PBC_AT13img_1',1,GETDATE())

INSERT INTO [dbmClinicalAnalyticsGateway].[Fact].[Imaging]
([ImagingStudyID],[ImagingStudyId_Root],[ImagingStudyId_Extension],[SourceSystemId_Root],[SourceSystemId_Extension],[PatientID],[PatientId_Root],[PatientId_Extension],[EncounterID],[EncounterId_Root],[EncounterId_Extension],[ImagingRequestId_Root],[ImagingRequest_Extension],[ImagingRequest_EffectiveDate],[PerformingOrgId_Root],[PerformingOrgId_Extension],[ImagingStudyPerformerId_Root],[ImagingStudyPerformerId_Extension],[ImagingStudy_StatusCode],[ImagingStudy_StatusCodeSystem],[ImagingStudy_TypeCode],[ImagingStudy_TypeCodeSystem],[ImagingStudy_Title],[ImagingStudy_Text],[ImagingStudy_EffectiveDate],[ImagingStudy_PriorityCode],[ImagingStudy_PriorityCodeSystem],[UncertaintyCode],[UncertaintyCodeSystem],[MethodCode],[MethodCodeSystem],[InterpertationCode],[InterpertationCodeSystem],[ImagingStudy_Code],[ImagingStudy_CodeSystem],[TargetSiteCode],[TargetSiteCodeSystem],[dbmAvailibilityTime],[TimeStamp],[NewFlag],[LastUpdatedTime])
 
 VALUES (  4000000238,'2.16.840.1.113883.3.57.1.3.5.52.1.43','PHA2_PBC_AT13img_2','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI',4000002796,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA2_PBC_AT13_P3',4000000002,'2.16.840.1.113883.3.57.1.3.5.52.1.9','Readmissions_Enc_2','2.16.840.1.113883.3.57.1.3.5.52.1.17','PHA2_PBC_AT13imgR_1_P2','2013-10-05 09:27:00.000','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','PHA_EncAT_org1','2.16.840.1.113883.3.57.1.3.5.52.1.26','1211000','S','2.16.840.1.113883.3.57.1.3.5.1.111.2.8.11','Z','2.16.840.1.113883.3.57.1.3.5.52.2.81','PHA2_PBC_AT13imgR_1_P2_TITLE',NULL,'2013-10-04 09:27:00.000','R','2.16.840.1.113883.5.7','N','2.16.840.1.113883.5.1053','0002', '2.16.840.1.113883.5.84','W','2.16.840.1.113883.5.83','77055','2.16.840.1.113883.3.57.1.3.5.52.2.82','W','2.16.840.1.113883.5.83','2014-06-29 12:25:12.273',GETDATE(),0,NULL),
		  	
		(  4000000240,'2.16.840.1.113883.3.57.1.3.5.52.1.43','PHA2_PBC_AT13img_4','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI',4000002796,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA2_PBC_AT13_P3',null,'TestingEncounterRIRoot','TestingEncounterRIExt','2.16.840.1.113883.3.57.1.3.5.52.1.17','PHA2_PBC_AT13imgR_1_P3','2013-10-05 09:27:00.000','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','PHA_EncAT_org1','2.16.840.1.113883.3.57.1.3.5.52.1.26','1211000','S','2.16.840.1.113883.3.57.1.3.5.1.111.2.8.11','RAD','2.16.840.1.113883.3.57.1.3.5.52.2.81','PHA2_PBC_AT13imgR_1_P3_TITLE',NULL,'2013-10-05 09:27:00.000','R','2.16.840.1.113883.5.7','N','2.16.840.1.113883.5.1053','0002', '2.16.840.1.113883.5.84','W','2.16.840.1.113883.5.83','77055','2.16.840.1.113883.3.57.1.3.5.52.2.82','W','2.16.840.1.113883.5.83','2014-06-29 12:25:12.273',GETDATE(),0,NULL),
	--For duplicate test:
		(  4000000240,'2.16.840.1.113883.3.57.1.3.5.52.1.43','PHA2_PBC_AT13img_4','2.16.840.1.113883.3.57.1.3.5.52.1.5','DemoEMPI',4000002796,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA2_PBC_AT13_P3',null,'TestingEncounterRIRoot','TestingEncounterRIExt','2.16.840.1.113883.3.57.1.3.5.52.1.17','PHA2_PBC_AT13imgR_1_P3','2013-10-05 09:27:00.000','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','PHA_EncAT_org1','2.16.840.1.113883.3.57.1.3.5.52.1.26','1211000','S','2.16.840.1.113883.3.57.1.3.5.1.111.2.8.11','RAD','2.16.840.1.113883.3.57.1.3.5.52.2.81','PHA2_PBC_AT13imgR_1_P3_TITLE',NULL,'2013-10-05 09:27:00.000','R','2.16.840.1.113883.5.7','N','2.16.840.1.113883.5.1053','0002', '2.16.840.1.113883.5.84','W','2.16.840.1.113883.5.83','77055','2.16.840.1.113883.3.57.1.3.5.52.2.82','W','2.16.840.1.113883.5.83','2014-06-29 12:25:12.273',GETDATE(),0,NULL)

-----------------------------------------------------------

  update dbmSemanticAnalyticsSTG.Log.LTS
  set TimeStamp = '2014-05-28 17:29:00.000'
  where ID = 6

-----------Delete Update and Insert for Labs----------
DELETE [dbmClinicalAnalyticsGateway].[Fact].[LaboratoryResults] 
WHERE [LabRequestExtension] IN ('Lab_RequestId_RegTest_1','Lab_RequestId_RegTest_4')

--#1 Update patient, #2 Delete, #3Insert, #4For duplicate test
INSERT INTO [dbmClinicalAnalyticsGateway].[Fact].[LaboratoryResults] 
([LabRequestRoot],[LabRequestExtension],[LabRequest_PriorityCode],[LabRequest_PriorityCodeSystem],[Patient_Id_Root],[Patient_Id_Extension],[Encounter_Id_Root],[EncounterId_Extension],[CollectionDate],[LabResultId_Root],[LabResultId_Extension],[ResultDate],[DeleteKey],[TimeStamp],[NewFlag])
VALUES 
('2.16.840.1.113883.3.57.1.3.5.52.1.11', 'Lab_RequestId_RegTest_1','LabRequestPriority_RegTest_1','2.16.840.1.113883.3.57.1.3.5.52.2.5.3','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3','2.16.840.1.113883.3.57.1.3.5.52.1.9','PHA_EncAT_enc4','2014-06-06 05:02:00.000','2.16.840.1.113883.3.57.1.2.9','Lab_ResultId_RegTest_1','2014-11-09 13:34:24.000','0',GETDATE(),'1'),
('2.16.840.1.113883.3.57.1.3.5.52.1.11', 'Lab_RequestId_RegTest_1','LabRequestPriority_RegTest_2','2.16.840.1.113883.3.57.1.3.5.52.2.5.3','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2','2.16.840.1.113883.3.57.1.3.5.52.1.9','PHA_EncAT_enc4','2014-06-06 05:02:00.000','2.16.840.1.113883.3.57.1.2.9','Lab_ResultId_RegTest_2','2014-11-09 13:34:24.000','1',GETDATE(),'1'),
('2.16.840.1.113883.3.57.1.3.5.52.1.11', 'Lab_RequestId_RegTest_4','LabRequestPriority_RegTest_3','2.16.840.1.113883.3.57.1.3.5.52.2.5.3','2.16.840.1.113883.3.57.1.3.0.3.3.6','9000369','2.16.840.1.113883.3.57.1.3.5.52.1.9','PHA_EncAT_enc1','2014-06-06 05:02:00.000','2.16.840.1.113883.3.57.1.2.9','Lab_ResultId_RegTest_5','2014-11-09 13:34:24.000','0',GETDATE(),'1'),
('2.16.840.1.113883.3.57.1.3.5.52.1.11', 'Lab_RequestId_RegTest_4','LabRequestPriority_RegTest_3','2.16.840.1.113883.3.57.1.3.5.52.2.5.3','2.16.840.1.113883.3.57.1.3.0.3.3.6','9000369','2.16.840.1.113883.3.57.1.3.5.52.1.9','PHA_EncAT_enc1','2014-06-06 05:02:00.000','2.16.840.1.113883.3.57.1.2.9','Lab_ResultId_RegTest_5','2014-11-09 13:34:24.000','0',GETDATE(),'1')
-----------END Delete Update and Insert for Labs----------