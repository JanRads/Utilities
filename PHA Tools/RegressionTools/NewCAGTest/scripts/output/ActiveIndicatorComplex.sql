/****** Script for SelectTopNRows command from SSMS  ******/
use [dbmSemanticAnalytics]
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR;
SELECT        TOP (1000)  [dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](Dim.Patients.[LastName]) AS LastName, Fact.ActiveIndicator.IndicatorId, Fact.ActiveIndicator.FromDate, Fact.ActiveIndicator.To_Date, 
                         Fact.ActiveIndicator.measure_IndicatorInd, Fact.ActiveIndicator.FlagNew
FROM            Fact.ActiveIndicator INNER JOIN
                         Dim.Patients ON Fact.ActiveIndicator.Id_Patient = Dim.Patients.PatientKey
WHERE        [dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](FirstName)LIKE N'%firstname_C_%'
AND Fact.ActiveIndicator.IndicatorId<=17
order by LastName, IndicatorId