---EXP--
USE [dbmClinicalAnalyticsGateway]
;
WITH MSR as
(SELECT  
      [DocumentId_Root]
     ,[DocumentId_Extension]
     ,[PatientId_Root]
     ,[PatientId_Extension]
     ,[EncounterId_Root]
     ,[EncounterId_Extension]
     ,[StatusCode]
     ,[StatusCodeSystem]
     ,[DocumentEffectiveTime]
     ,[DocumentTypeCode]
     ,[DocumentTypeCodeSystem]
     ,[TranscriptionTime]
     ,[dbmAvailabilityTime]
     ,[DeleteKey]
       ,row_number() OVER (
              PARTITION BY [DocumentId_Extension] ORDER BY id desc
              ) AS rn
FROM [dbmClinicalAnalyticsGateway].[Fact].[ClinicalDocument]
) 

SELECT MSR.[DocumentId_Root]
       ,MSR.[DocumentId_Extension]
       ,MSR.PatientId_Root
       ,MSR.PatientId_Extension
       ,MSR.EncounterId_Root
       ,MSR.EncounterId_Extension
       ,MSR.[StatusCode]
       ,MSR.[StatusCodeSystem]
       ,convert(nvarchar(max),MSR.[DocumentEffectiveTime])
    ,MSR.[DocumentTypeCode]
    ,MSR.[DocumentTypeCodeSystem]
    ,MSR.[TranscriptionTime]
       ,[PerformerCodeProvider_Root]
       ,[PerformerCodeProvider_Extension]
FROM MSR 
LEFT OUTER JOIN (
SELECT 
       max(CASE MEP.PerformerTypeIndicator
                     WHEN 'AUT'
                           THEN MEP.CareProviderId_Extension
                     ELSE NULL
                     END) AS PerformerCodeProvider_Extension
       ,max(CASE MEP.PerformerTypeIndicator
                     WHEN 'AUT'
                           THEN MEP.CareProviderId_Root
                     ELSE NULL
                     END) AS PerformerCodeProvider_Root
       ,MEP.DocumentId_Extension
       ,MEP.DocumentId_Root
FROM  [dbmClinicalAnalyticsGateway].[Fact].[ClinicalDocumentPerformers] AS MEP
WHERE DeleteKey = 0
GROUP BY MEP.DocumentId_Extension
           ,MEP.DocumentId_Root
       ) AS MEP ON MSR.[DocumentId_Extension]= MEP.DocumentId_Extension
       AND MSR.[DocumentId_Root]= MEP.DocumentId_Root
       WHERE rn=1 and DeleteKey=0

ORDER BY MSR.[DocumentId_Root]
       ,MSR.[DocumentId_Extension]

;


