/* This query is testing specific pateints - FirstName like '%PHA_Relat_EncAT%' - 
please do not add or change patients wth the prefix PHA_Relat_EncAT, because it will cause the test to fail  */

USE dbmSemanticAnalytics
GO
 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Set nocount on
 EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR
CREATE TABLE #RelationTipe (RelationType INT)

INSERT INTO #RelationTipe(RelationType)

SELECT --@RelationTipe = 
AdminCodeKey
FROM Dim.AdminCodes
WHERE (Baseline_Code = N'GPCP')



SELECT 
--[id_Patient],
dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.FirstName) [FirstName],
--[provider_Related],
C.[FullName],
[date_From],
[date_To]
FROM [Factless].[PatientProviderRelations] A
 INNER JOIN [Dim].[Patients] P
ON A.id_Patient=P.[PatientKey]
AND dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.FirstName) like '%PHA_Relat_EncAT%'
INNER JOIN [Dim].[CareProviders] C
ON provider_Related=C.CareProviderKey
INNER JOIN #RelationTipe R
ON  A.attrib_RelationType = R.RelationType
ORDER BY [FirstName],[FullName],date_From

DROP TABLE #RelationTipe