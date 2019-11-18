/* This query is testing specific patients - [FirstName] like '%PHA_Relat_EncAT%' - 
please do not add patients with the prefix PHA_Relat_EncAT, because it will cause the test to fail  */

USE dbmSemanticAnalytics
GO
 
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Set nocount on
 EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR

SELECT
 --[id_Patient],
dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.FirstName) [FirstName]
  --  ,[provider_Related]
	  ,C.[FullName]
--   ,[org_RelatedProvider]
	  ,O.level3
      ,[date__from_Relationship]
      ,[date_To_Relationship]
      ,[attrib_PatientAge]
	  ,Severity_Score
	  ,comb_prog
 FROM [Factless].[PatientRelationsFromTo] A
  INNER JOIN [Dim].[Patients] P
ON A.id_Patient=P.[PatientKey]
AND dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.FirstName) like '%PHA_Relat_EncAT%'
INNER JOIN [Dim].[CareProviders] C
ON provider_Related=C.CareProviderKey
INNER JOIN [Dim].[Organizations] O
ON org_RelatedProvider =o.OrganizationKey
--inner join factless.CombPrograms combp
--on combp.id_CombProg = a.comb_prog

--where dbmSemanticAnalyticsSTG.dbo.DecryptHR(P.FirstName)= 'firstnamePHA_Relat_EncAT_P2'

ORDER BY [FirstName],date__from_Relationship

