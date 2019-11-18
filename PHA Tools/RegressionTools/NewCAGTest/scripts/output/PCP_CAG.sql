USE dbmClinicalAnalyticsGateway
GO

SELECT 
FirstName
	,FullName
	,date_From
	,date_To
FROM (
	SELECT FirstName
		,FullName
		,date_From
		,date_To
		,LEAD(date_From) OVER (
			PARTITION BY FirstName
			,FullName ORDER BY FirstName
				,[date_From]
				,FullName
			) Leaddate_From
		,LEAD(date_To) OVER (
			PARTITION BY FirstName
			,FullName ORDER BY FirstName
				,[date_From]
				,FullName
			) LeadTo
	,LAG(date_To) OVER(PARTITION BY FirstName,FullName  ORDER BY FirstName,[date_From],FullName) LagTo
	,RANK() OVER(PARTITION BY FirstName  ORDER BY [date_From]) Rn
	FROM (
		SELECT MasterData.Patient.FirstName
			,MasterData.CareProvider.FullName
			,YEAR(StartDate) * 10000 + MONTH(StartDate) * 100 + DAY(StartDate) AS date_From
			,COALESCE(YEAR(EndDate) * 10000 + MONTH(EndDate) * 100 + DAY(EndDate),YEAR([TimeOfDeath]) * 10000 + MONTH([TimeOfDeath]) * 100 + DAY([TimeOfDeath]), 20301231) AS date_To
		FROM MasterData.Relationship
		INNER JOIN MasterData.CareProvider ON MasterData.Relationship.SourceEntityId = MasterData.CareProvider.EnterpriseProviderID
		INNER JOIN MasterData.Patient ON MasterData.Relationship.TargetEntityId = MasterData.Patient.EnterprisePatientId
		WHERE (MasterData.Patient.FirstName LIKE N'%PHA_Relat_EncAT%')
		) S
	) Z
WHERE 
 (LeadTo IS NULL AND  LagTo is  null)
OR (date_to < Leaddate_From)
OR RN>2
UNION

SELECT FirstName
	,FullName
	,date_From
	,LeadTo
FROM (
	SELECT FirstName
		,FullName
		,date_From
		,date_To
		,LEAD(date_From) OVER (
			PARTITION BY FirstName
			,FullName ORDER BY FirstName
				,[date_From]
				,FullName
			) Leaddate_From
		,LEAD(date_To) OVER (
			PARTITION BY FirstName
			,FullName ORDER BY FirstName
				,[date_From]
				,FullName
			) LeadTo
	FROM (
		SELECT MasterData.Patient.FirstName
			,MasterData.CareProvider.FullName
			,YEAR(StartDate) * 10000 + MONTH(StartDate) * 100 + DAY(StartDate) AS date_From
			,ISNULL(YEAR(EndDate) * 10000 + MONTH(EndDate) * 100 + DAY(EndDate), 20301231) AS date_To
		FROM MasterData.Relationship
		INNER JOIN MasterData.CareProvider ON MasterData.Relationship.SourceEntityId = MasterData.CareProvider.EnterpriseProviderID
		INNER JOIN MasterData.Patient ON MasterData.Relationship.TargetEntityId = MasterData.Patient.EnterprisePatientId
		WHERE (MasterData.Patient.FirstName LIKE N'%PHA_Relat_EncAT%')
		) S
	) Z
WHERE LeadTo IS NOT NULL -- or LagTo is not null
	AND date_to >= Leaddate_From
ORDER BY FirstName
,FullName
	,date_From
	
