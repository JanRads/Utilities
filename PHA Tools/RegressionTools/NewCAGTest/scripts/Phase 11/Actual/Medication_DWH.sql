---Act---
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR
SELECT distinct   
	   med.Medication_Root MedId_Root
	  , med.Medication_Ext MedId_Ext
      , mp.Id_Root PatientId_Root --,[id_Patient]
	  , dbmSemanticAnalyticsSTG.dbo.DecryptHR(mp.Enc_Extension) AS [PatientId_Extension]
	  , en.Encounter_Root EncounterId_Root
	  , en.Encounter_Ext EncounterId_Extension
      ,mappro.MappingProvider_Root CareProviderId_Root--,[provider_Author]
	  ,mappro.MappingProvider_Extension CareProviderId_Extension
      ,dac2.Code MedicationCode --,[attrib_Medication]
	  ,dac2.CodeSystem MedicationCodeSystem
	  ,m.date_RequiredStart as  [TimeStart]
	  ,case when m.[date_RequiredEnd] is null then '-1' else  m.[date_RequiredEnd] end  as  [TimeEnd]

	  
FROM [dbmSemanticAnalytics].[Fact].[MedicationOrders] m
	 INNER join [dbmSemanticAnalyticsSTG].[Persist].[MappingPatient] mp
	 on m.id_Patient = mp.PatientKey
	 AND dbmSemanticAnalyticsSTG.dbo.DecryptHR(MP.Enc_Extension) != CONVERT(NVARCHAR(50), MP.PPOLId)
	 left join [dbmSemanticAnalyticsSTG].[Persist].[MappingProvider] mappro
	 on m.provider_Author = mappro.CareProviderKey
	   AND  mappro.MappingProvider_Root <> '2.22.222.2.222222.2.22.2.2.2.22.2.2.2'
	 left join [dbmSemanticAnalyticsSTG].[Persist].[FactMedications] med
	 on m.id_MedicationOrder = med.id_Medication
	 left join [dbmSemanticAnalyticsSTG].[Persist].[FactEncounters] en
	 on m.id_Encounter = en.id_Encounter
	 left join 	 [dbmSemanticAnalyticsSTG].[Persist].[DimAdminCodes] dac2
		 	 on dac2.dimName = 'Medications'
				and dac2.Code = med.MedicationCode
				and dac2.CodeSystem = med.MedicationCodeSystem
	where mp.Id_Root <> '1.11.111.1.111111.1.11.1.1.1.11.1.1.1' --,[provider_Author]
order by MedId_Ext
;

