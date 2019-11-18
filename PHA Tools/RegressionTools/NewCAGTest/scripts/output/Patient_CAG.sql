SELECT 
	-- MP.[PatientId_Root] AS PatientId_Root
	--,MP.[PatientId_Extension] AS PatientId_Extension
	MP.[EnterprisePatientId] AS EnterprisePatientId
	,P.PatientMPIID AS PatientMPIID
	,P.FullName AS FullName
	,P.FirstName AS FirstName
	,P.LastName AS LastName
	,P.MiddleName AS MiddleName
	,DATEPART(yyyy, TimeOfBirth) * 10000 + DATEPART(MM, TimeOfBirth) * 100 + DATEPART(DD, TimeOfBirth) AS TimeOfBirth
	,DATEPART(yyyy, TimeOfDeath) * 10000 + DATEPART(MM, TimeOfDeath) * 100 + DATEPART(DD, TimeOfDeath) AS TimeOfDeath
	,P.AddressLine1 AS AddressLine1
	,P.AddressLine2 AS AddressLine2
	,P.MobilePhone AS MobilePhone
	,P.HomeEmail AS HomeEmail
	--,P.[GenderCode] AS GenderCode
	--,P.[GenderCodeSystem] AS GenderCodeSystem
	,G.Designation GenderDesc
FROM [dbmClinicalAnalyticsGateway].[MasterData].[Patient] P
INNER JOIN [dbmClinicalAnalyticsGateway].[MasterData].[PatientIdentifier] MP ON P.EnterprisePatientId = MP.EnterprisePatientId
					AND P.IsGolden = MP.isGolden
					AND  MP.IdentifierTypeCode<>'SSN' 
LEFT OUTER JOIN (
	SELECT Distinct
LocalCode.ConceptCode AS LocalCode
       ,LocalCode.ConceptCodeSystem AS LocalCodeSystem
       
	   ,COALESCE( BaselineCode.Designation ,LocalCode.Designation) Designation
FROM [dbmClinicalAnalyticsGateway].MasterData.Codes_v LocalCode
LEFT OUTER JOIN [dbmClinicalAnalyticsGateway].MasterData.CodesLinks_v links ON LocalCode.CodeId = links.SourceCodeId
       AND RelationType = 'EQUALS_TO'
       AND LocalCode.IsLocal = 1  --- It is local
LEFT OUTER JOIN [dbmClinicalAnalyticsGateway].MasterData.Codes_v BaselineCode ON links.TargetCodeId = BaselineCode.CodeId
       AND BaselineCode.IsLocal = 0 -- It is baseline
       AND LocalCode.UMSDomain = BaselineCode.UMSDomain
       WHERE LocalCode.UMSDomain='AdministrativeGender'
       

	) G ON P.[GenderCode] = G.LocalCode
	AND P.[GenderCodeSystem] = G.LocalCodeSystem
WHERE MP.PatientId_Extension LIKE N'PHA_EncAT_P%' and MP.IsGolden=1
ORDER BY MP.[EnterprisePatientId]
	--MP.[PatientId_Root]
	--,MP.[PatientId_Extension]
