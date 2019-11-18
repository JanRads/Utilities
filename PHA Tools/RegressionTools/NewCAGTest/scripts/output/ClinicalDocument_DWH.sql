---Act---
Set nocount on
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR 

Select distinct PFA.[DocumentId_Root] as DocumentId_Root,
       PFA.[DocumentId_Extension] as DocumentId_Extension,
       PFA.PatientId_Root as PatientId_Root,
       dbmSemanticAnalyticsSTG.dbo.DecryptHR(mp.Enc_Extension)AS PatientId_Extension,  
          PFA.EncounterId_Root AS EncounterId_Root ,
       pFA.EncounterId_Extension AS EncounterId_Extension,
       PFA.[StatusCode] as StatusCode,
       PFA.[StatusCodeSystem] as StatusCodeSystem,
       dbmSemanticAnalyticsSTG.dbo.DecryptHR(PFA.[DocumentEffectiveTimeEnc]) as DocumentEffectiveTime,
       PFA.[DocumentTypeCode] as DocumentTypeCode,
       PFA.[DocumentTypeCodeSystem] as DocumentTypeCodeSystem,
       PFA.[TranscriptionTime]  as TranscriptionTime,
       PFA.[CareProviderId_Root] as CareProviderId_Root,
       PFA.[CareProviderId_Extension] as CareProviderId_Extension
From  [dbmSemanticAnalytics].[Fact].[ClinicalDocument] FA LEFT JOIN 
      [dbmSemanticAnalyticsSTG].[Persist].[FactClinicalDocument] PFA
       on FA.[id_Document] = PFA.[Id_Document]
          left  JOIN
         [dbmSemanticAnalyticsSTG].Persist.MappingPatient mp
              on mp.id_Extension = PFA.Patientid_Extension and mp.Id_Root= PFA.PatientId_Root
Where [FlagNew] = 1 and  [DeleteKey]=0 
Order by 1,2



