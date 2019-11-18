USE [dbmSemanticAnalytics]
GO

SET ANSI_WARNINGS OFF
SET NOCOUNT ON

SELECT cast(Severity_type AS VARCHAR(20)) AS MCC
       ,Count(*) AS Result
FROM (
       SELECT T1.[id_Admission]
              ,Severity_type = CASE 
                     WHEN T2.Severity_Score = 1
                           THEN 'Low'
                     WHEN T2.Severity_Score = 2
                           THEN 'Moderate'
                     WHEN T2.Severity_Score = 3
                           THEN 'High'
                     WHEN T2.Severity_Score = 4
                           THEN 'Very High'
                     END
       FROM fact.Admissions T1
       INNER JOIN factless.PATIENTRELATIONSFROMTO T2 ON T2.id_patient = T1.id_patient
              AND T2.org_relatedprovider != - 1
              AND dbmsemanticanalyticsstg.dbo.Unconvert_date(date__from_relationship) <= Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)
              AND dbmsemanticanalyticsstg.dbo.Unconvert_date(date_to_relationship) >= Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)
       WHERE date_Discharge != - 1
              --and org_RelatedProvider != -1
              AND Dateadd(year, 1, dbmsemanticanalyticsstg.dbo.Unconvert_date(date_Discharge)) >= Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)
              AND dbmsemanticanalyticsstg.dbo.Unconvert_date(date_Discharge) <= Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)
       )Z
GROUP BY Severity_type

