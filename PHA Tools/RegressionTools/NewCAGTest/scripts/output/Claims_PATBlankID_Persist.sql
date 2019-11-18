SELECT  COUNT(*) as Patient_ID
FROM [dbmSemanticAnalyticsSTG].[Persist].[ClaimDemographics] P 
INNER JOIN  [dbmSemanticAnalyticsSTG].[ACG].[ReferencePatient] A 
ON  P.id_Patient = A.patient_id where  (A.patient_id IS NULL OR A.patient_id = '' OR P.id_Patient IS NULL OR P.id_Patient = '')


