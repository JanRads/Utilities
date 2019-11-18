SELECT COUNT(*) as Patient_Name FROM [dbmSemanticAnalyticsSTG].[ACG].[ReferencePatient]  WHERE patient_fullname IS NULL OR patient_fullname = ''

