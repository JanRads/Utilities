SELECT  COUNT(*) as Patient_Name
FROM [dbmSemanticAnalyticsSTG].[Persist].[ClaimDemographics] P 
INNER JOIN  [dbmSemanticAnalyticsSTG].[ACG].[ReferencePatient] A 
ON  P.id_Patient = A.patient_id where  (A.patient_fullname IS NULL OR A.patient_fullname = '' OR P.FullName IS NULL OR P.FullName = '')
