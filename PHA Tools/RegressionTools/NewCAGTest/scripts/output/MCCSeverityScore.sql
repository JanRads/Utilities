/****** Script for SelectTopNRows command from SSMS  ******/
use [dbmSemanticAnalytics]

EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR;

SELECT        [dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](Dim.Patients.[LastName]) AS LastName, Fact.SeverityScores.Severity_Score, Fact.SeverityScores.comb_id, Fact.SeverityScores.date_YearMonth, 
                         Fact.SeverityScores.sys_PartitionDate
FROM            Fact.SeverityScores INNER JOIN
                         Dim.Patients ON Fact.SeverityScores.Id_Patient = Dim.Patients.PatientKey
WHERE        [dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](Dim.Patients.FirstName) LIKE N'firstname_MCC%' AND (Fact.SeverityScores.ScoreType = 'MCC Score') AND (Fact.SeverityScores.sys_PartitionDate = 2014 OR
                         Fact.SeverityScores.sys_PartitionDate = 2015)
ORDER BY Fact.SeverityScores.Id_Patient, Fact.SeverityScores.date_YearMonth