select patient_fullname as Patient_Name
from [dbmSemanticAnalyticsSTG].[ACG].[ReferencePatient]
where patient_id <> (SELECT MIN(patient_id)
                                 FROM [dbmSemanticAnalyticsSTG].[ACG].[ReferencePatient]
                                 WHERE patient_fullname= 'Unassigned')

