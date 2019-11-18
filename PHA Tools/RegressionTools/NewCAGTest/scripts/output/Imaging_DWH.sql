Set nocount on
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR

select 
       PFI. [ImagingStudyId_Root]
       ,PFI.[ImagingStudyId_Extension]
       ,[PatientId_Root]
       ,dbmSemanticAnalyticsSTG.dbo.DecryptHR(mp.Enc_Extension) AS [PatientId_Extension]
       ,PFI.[EncounterId_Root]
       , PFI.[EncounterId_Extension]
       ,PFI.[ImagingRequestId_Root]
       ,PFI.[ImagingRequest_Extension]
       ,PFI.[PerformingOrgId_Root]
       ,PFI.[PerformingOrgId_Extension] 
       ,PFI.[ImagingStudyPerformerId_Root] 
       ,PFI.[ImagingStudyPerformerId_Extension] 
       ,PFI.[ImagingStudy_TypeCodeSystem]
       ,cast(convert(char(11),dbmSemanticAnalyticsSTG.[dbo].[DecryptHR](FI.[ImagingStudy_EffectiveDateEnc]), 113) as datetime) As ImagingStudy_EffectiveDate
       ,cast(convert(char(11),dbmSemanticAnalyticsSTG.[dbo].[DecryptHR](FI.[ImagingRequest_EffectiveDateEnc]), 113) as datetime) As ImagingRequest_EffectiveDate
       ,PFI.[ImagingStudy_PriorityCode]
       ,PFI.[ImagingStudy_PriorityCodeSystem]
       ,PFI.[UncertaintyCode]
       ,PFI.[UncertaintyCodeSystem]
       ,PFI.[MethodCode]
       ,PFI.[MethodCodeSystem]
       ,PFI.[InterpretationCode] 
       ,PFI.[InterpretationCodeSystem]
       ,PFI.[ImagingStudy_code]
       ,PFI.[ImagingStudy_CodeSystem]
       ,PFI.[TargetSiteCode]
       ,PFI.[TargetSiteCodeSystem]

       from [dbmSemanticAnalytics].[Fact].[Imaging] FI
       INNER JOIN
       [dbmSemanticAnalyticsSTG].[Persist].[FactImaging] PFI on FI.[id_Imaging]=PFI.[id_Imaging]
		INNER  JOIN
       [dbmSemanticAnalyticsSTG].Persist.MappingPatient mp
       on mp.id_Extension = PFI.PatientID_Extension and mp.Id_Root= PFI.Patientid_Root
	   AND PFI.[ImagingStudyId_Extension] is not null
       order by 2
