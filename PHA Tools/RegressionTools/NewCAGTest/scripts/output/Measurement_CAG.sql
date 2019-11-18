---EXP--
USE [dbmClinicalAnalyticsGateway]
;
WITH MSR as
(SELECT MeasurementEventId_Root
	,MeasurmentEventId_Extension
	,MeasurementId_Root
	,MeasurementId_Extension
	,PatientId_Root
	,PatientId_Extension
	,EncounterId_Root
	,EncounterId_Extension
	,MeasurementCode
	,[DeleteKey]
	,row_number() OVER (
		PARTITION BY MeasurmentEventId_Extension,MeasurementId_Extension ORDER BY id desc
		) AS rn
FROM [dbmClinicalAnalyticsGateway].Fact.Measurement
) 

SELECT MSR.MeasurementEventId_Root
	,MSR.MeasurmentEventId_Extension
	,MSR.MeasurementId_Root
	,MSR.MeasurementId_Extension
	,MSR.PatientId_Root
	,MSR.PatientId_Extension
	,MSR.EncounterId_Root
	,MSR.EncounterId_Extension
	,MSR.MeasurementCode
	,[AuthorCodeProvider_Root]
	,[AuthorCodeProvider_Extension]
	,[PerformerCodeProvider_Root]
	,[PerformerCodeProvider_Extension]
	,[ReferringCodeProvider_Root]
	,[ReferringCodeProvider_Extension]
FROM MSR 
LEFT OUTER JOIN (
SELECT max(CASE MEP.PerformerTypeIndicator
			WHEN 'AUT'
				THEN MEP.CareProviderId_Extension
			ELSE NULL
			END) AS AuthorCodeProvider_Extension
	,max(CASE MEP.PerformerTypeIndicator
			WHEN 'AUT'
				THEN MEP.CareProviderId_Root
			ELSE NULL
			END) AS AuthorCodeProvider_Root
	,max(CASE MEP.PerformerTypeIndicator
			WHEN 'PPRF'
				THEN MEP.CareProviderId_Extension
			ELSE NULL
			END) AS PerformerCodeProvider_Extension
	,max(CASE MEP.PerformerTypeIndicator
			WHEN 'PPRF'
				THEN MEP.CareProviderId_Root
			ELSE NULL
			END) AS PerformerCodeProvider_Root
	,max(CASE MEP.PerformerTypeIndicator
			WHEN 'REF'
				THEN MEP.CareProviderId_Extension
			ELSE NULL
			END) AS ReferringCodeProvider_Extension
	,max(CASE MEP.PerformerTypeIndicator
			WHEN 'REF'
				THEN MEP.CareProviderId_Root
			ELSE NULL
			END) AS ReferringCodeProvider_Root
	,MEP.MeasurementEventID_Extension
	,MEP.MeasurementEvent_Root
FROM Fact.MeasurementPerformers AS MEP
WHERE DeleteKey = 0
GROUP BY MEP.MeasurementEventID_Extension
	,MEP.MeasurementEvent_Root
	) AS MEP ON MSR.MeasurmentEventId_Extension = MEP.MeasurementEventID_Extension
	AND MSR.MeasurementEventId_Root = MEP.MeasurementEvent_Root
	WHERE rn=1 and DeleteKey=0

ORDER BY MSR.MeasurementEventId_Root
	,MSR.MeasurmentEventId_Extension
	,MeasurementId_Extension
;