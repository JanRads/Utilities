USE [dbmSemanticAnalytics]
GO
EXEC [dbmSemanticAnalyticsSTG].[dbo].[OpenHHR]
SELECT AgeGroupDesc
       ,Count(DISTINCT id_Patient) AS Result
FROM (
       SELECT id_Patient
              ,attrib_PatientAge
       FROM factless.PATIENTRELATIONSFROMTO T2
       WHERE dbmsemanticanalyticsstg.dbo.Unconvert_date(date__from_relationship) <= Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)
              AND dbmsemanticanalyticsstg.dbo.Unconvert_date(date_to_relationship) >= Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)
              AND org_relatedprovider != - 1
       ) T1
INNER JOIN (
       SELECT PatientKey
              ,datediff(dd, [dbmSemanticAnalyticsSTG].[dbo].[DecryptHR]([BirthDate]) , Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)) ageDays
       FROM [Dim].[Patients]
       ) T2 ON T1.id_Patient = T2.PatientKey
LEFT JOIN Factless.AgeInGroup T3 ON T2.ageDays = T3.AgeFK
INNER JOIN (
       SELECT *
       FROM dim.AGEGROUPS
       WHERE HIERARCHYID = 1
       ) T4 ON T3.groupfk = T4.agegroupkey
GROUP BY AgeGroupDesc
