USE [dbmSemanticAnalytics]
GO

SELECT cast(Severity_type AS VARCHAR(20)) AS MCC
       ,Count(*) AS Result
FROM (
       SELECT T1.id_EDVisit,
         Severity_type
       =CASE 
       WHEN T2.Severity_Score=1 THEn 'Low'
       WHEN T2.Severity_Score=2 THEn 'Moderate'
       WHEN T2.Severity_Score=3 THEn 'High'
       WHEN T2.Severity_Score=4 THEn 'Very High'
       END
       FROM fact.EDVISITS T1
              INNER JOIN
                     factless.PATIENTRELATIONSFROMTO T2
                     ON T2.id_patient = T1.id_patient
                           AND org_relatedprovider != - 1
                           AND dbmsemanticanalyticsstg.dbo.Unconvert_date(date__from_relationship) <= Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)
                           AND dbmsemanticanalyticsstg.dbo.Unconvert_date(date_to_relationship) >= Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)
                     
       
       WHERE Dateadd(year, 1, dbmsemanticanalyticsstg.dbo.Unconvert_date(date_visit)) >= Dateadd(month, Datediff(month, - 1, Getdate()) - 1, - 1)
)T
GROUP BY Severity_type





