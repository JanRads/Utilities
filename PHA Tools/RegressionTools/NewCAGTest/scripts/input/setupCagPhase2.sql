use [dbmClinicalAnalyticsGateway]
go

INSERT INTO sysssislog(      event, computer, operator, source, sourceid, executionid, starttime, endtime, datacode, message)
--VALUES
--('PackageStart',   'STORK8-DATA123',    'DBMOTION\dbmSQL4',  'PopulateDomainPatients',  '6a646888-f333-4832-b7eb-9544d36b7a1e',     'f0715f7b-8129-4668-85e1-463ac812b484',  getdate(),    getdate(),       0,     'Beginning of Package execution.')
VALUES
('PackageStart',     'STORK8-DATA123',    'DBMOTION\dbmSQL4',  'PopulateDomainPatients',  '6a646888-f333-4832-b7eb-9544d36b7a1e',     'f0715f7b-8129-4668-85e1-463ac812b484',DATEAdd(second,-1,getdate()), DATEAdd(second,-1,getdate()),     0,     'Beginning of Package execution.'),

('PackageStart',     'STORK8-DATA123',    'DBMOTION\dbmSQL4',  'PopulateDomainPatients',  '6a646888-f333-4832-b7eb-9544d36b7a1e',     'f0715f7b-8129-4668-85e1-463ac812b484',DATEAdd(MINUTE,2,getdate()),      DATEAdd(MINUTE,2,getdate()),      0,     'End of Package execution.')


DELETE FROM [MasterData].[PatientIdentifier]
WHERE [PatientID_CDR] in (1000000164)

DELETE FROM [MasterData].[Patient]
WHERE [PatientID_CDR] in (1000000164,3100000004)

