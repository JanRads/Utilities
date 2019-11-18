---Act---
Set nocount on
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR 

select PFA.[AllergyId_Root] as [AllergyId_Root],
       PFA.[Allergyid_Extension] as [Allergyid_Extension],
          PFA.PatientId_Root as PatientId_Root,
		  dbmSemanticAnalyticsSTG.dbo.DecryptHR(mp.Enc_Extension)AS PatientId_Extension,  
		  PFA.EncounterId_Root AS EncounterId_Root ,
          pFA.EncounterId_Extension AS EncounterId_Extension,
		  PFA.AssignedOrgId_Root as AssignedOrgId_Root,
          PFA.[AssignedOrgId_Extension] as [AssignedOrgId_Extension],
          PFA.AllergyCode as AllergyCode,
          PFA.AllergyCodeSystem as AllergyCodeSystem,
          PFA.PerformerId_Root as PerformerId_Root,
          PFA.PerformerId_Extension as PerformerId_Extension,
          PFA.[AllergyValueCode] as [AllergyValueCode],
          PFA.AllergyValueCodeSystem as AllergyValueCodeSystem,
          PFA.[SourceSystemId_Root] as [SourceSystemId_Root],
          PFA.[SourceSystemId_Extension] as [SourceSystemId_Extension],
          PFA.[UncertaintyCode] as [UncertaintyCode],
          PFA.[UncertaintyCodeSystem] as [UncertaintyCodeSystem]
          
from  [dbmSemanticAnalytics].[Fact].[Allergies] FA INNER JOIN  [dbmSemanticAnalyticsSTG].[Persist].[FactAllergies] PFA
       on FA.id_Allergy = PFA.Id_allergy
	   AND   Allergyid_Extension like 'PHA%'
	   left  JOIN
	     [dbmSemanticAnalyticsSTG].Persist.MappingPatient mp
		on mp.id_Extension = PFA.Patientid_Extension and mp.Id_Root= PFA.PatientId_Root
		   AND mp.Id_Root <> '1.11.111.1.111111.1.11.1.1.1.11.1.1.1' 
	order by 1,2

