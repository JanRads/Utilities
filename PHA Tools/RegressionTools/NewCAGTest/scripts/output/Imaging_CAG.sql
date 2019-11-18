select [ImagingStudyId_Root]
      ,[ImagingStudyId_Extension]
      ,[PatientId_Root]
      ,[PatientId_Extension] -- DECREPSTION
      ,[EncounterId_Root]
      ,[EncounterId_Extension]
      ,[ImagingRequestId_Root]
      ,[ImagingRequest_Extension]
      ,[PerformingOrgId_Root]
      ,[PerformingOrgId_Extension]
      ,[ImagingStudyPerformerId_Root]
      ,[ImagingStudyPerformerId_Extension]
       ,[ImagingStudy_TypeCodeSystem]
              ,cast(convert(char(11),[ImagingStudy_EffectiveDate], 113) as datetime) As [ImagingStudy_EffectiveDate]
              ,cast(convert(char(11),[ImagingRequest_EffectiveDate], 113) as datetime) As [ImagingRequest_EffectiveDate]
      ,[ImagingStudy_PriorityCode]
      ,[ImagingStudy_PriorityCodeSystem]
      ,[UncertaintyCode]
      ,[UncertaintyCodeSystem]
      ,[MethodCode]
      ,[MethodCodeSystem]
      ,[InterpertationCode]
      ,[InterpertationCodeSystem]
      ,[ImagingStudy_Code]
      ,[ImagingStudy_CodeSystem]
      ,[TargetSiteCode]
      ,[TargetSiteCodeSystem]
from 
(SELECT row_number() over (partition by [ImagingStudyId_Extension] order by timestamp desc) rn ,
		*
  FROM [dbmClinicalAnalyticsGateway].[Fact].[Imaging]
  )q
  where rn = 1 and DeleteKey <> 1
  order by 2
