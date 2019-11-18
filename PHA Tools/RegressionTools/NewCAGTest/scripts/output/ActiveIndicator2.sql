/****** Script for SelectTopNRows command from SSMS  ******/
use [dbmSemanticAnalytics]
set nocount on
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR;

SELECT       [dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](Dim.Patients.[LastName])AS LastName, Fact.ActiveIndicator.IndicatorId , Fact.ActiveIndicator.FromDate, Fact.ActiveIndicator.To_Date, 
Fact.ActiveIndicator.measure_IndicatorInd
FROM            Dim.Patients RIGHT OUTER JOIN
                         Fact.ActiveIndicator ON Dim.Patients.PatientKey = Fact.ActiveIndicator.Id_Patient
WHERE      
 [dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](FirstName)  LIKE N'%firstname_A_%' and 
 Fact.ActiveIndicator.IndicatorId<=17 ---mcc
order by LastName, IndicatorId