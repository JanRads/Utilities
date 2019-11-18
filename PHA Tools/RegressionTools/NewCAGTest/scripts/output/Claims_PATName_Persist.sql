SELECT  A.patient_fullname as Patient_Name
FROM [dbmSemanticAnalyticsSTG].[Persist].[ClaimDemographics] P 
INNER JOIN  [dbmSemanticAnalyticsSTG].[ACG].[ReferencePatient] A 
 ON  P.id_Patient = A.patient_id