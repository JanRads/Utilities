/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  pat.Id_Root as Patient_Root,pat.Id_Extension as Pateint_Extension, rel.id_Patient as id_Patient,
 pro.MappingProvider_Root  as Provider_Root, pro.MappingProvider_Extension as Provider_Extension, rel.provider_Related, 
AMB.AssignedOrg_Root , AMB.AssignedOrg_Ext, rel.org_RelatedProvider,PCP.From_Date, AMB.AdmissionDate, rel.date_Relationship, rel.measure_PatientCount
  FROM [dbmSemanticAnalytics].[Fact].[PatientRelations] rel
  
  inner join [dbmSemanticAnalyticsSTG].Persist.MappingPatient pat on rel.id_Patient=pat.PatientKey
  inner join [dbmSemanticAnalyticsSTG].Persist.MappingProvider pro on rel.provider_Related=pro.CareProviderKey
  inner join [dbmSemanticAnalyticsSTG].Persist.MasterDataPCP PCP on pat.PPOLId=PCP.PatientPPOLID and pro.PPOLId=PCP.CareProviderPPOLID
  left join (
 select AssignedOrg_Root , AssignedOrg_Ext, Patient_Root, Patient_Ext, AdmittingPhysician_Root, AdmittingPhysician_Ext, Max(AdmissionDate) as AdmissionDate
 from [dbmSemanticAnalyticsSTG]. Persist.FactEncounters
 where EncounterCode = 'AMB'
 group by AssignedOrg_Root , AssignedOrg_Ext, Patient_Root, Patient_Ext, AdmittingPhysician_Root, AdmittingPhysician_Ext
 ) AMB on AMB.Patient_Root=pat.Id_Root and AMB.Patient_Ext=pat.Id_Extension and AMB.AdmittingPhysician_Ext=pro.MappingProvider_Extension and AMB.AdmittingPhysician_Root=pro.MappingProvider_Root
  
  where id_Patient=2567
  order by id_patient, date_Relationship


select *
from fact.PatientRelations
where id_Patient=2567
order by date_Relationship


select *
from [dbmSemanticAnalyticsSTG].Persist.MasterDataPCP
where PatientPPOLID = 439