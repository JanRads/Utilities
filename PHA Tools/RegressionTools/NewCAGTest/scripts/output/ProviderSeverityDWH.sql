USE [dbmSemanticAnalytics]
GO

DECLARE @intDate INT

SET @intDate = YEAR(getdate())*10000+131;


WITH cte_ReL
AS (
	SELECT A.id_Patient
		,A.provider_Related
		,Pr1.Severity_Score
	FROM (
		SELECT PR.id_Patient
			,PR.provider_Related
			,MAX(PR.date_Relationship) FROM_D
			,MIN(PR1.date_Relationship) AS To_D
		FROM Fact.PatientRelations AS PR
		INNER JOIN Fact.PatientRelations AS PR1 ON PR.id_Patient = PR1.id_Patient
			AND PR.provider_Related = PR1.provider_Related
			AND PR.Severity_Score = PR1.Severity_Score
			AND PR.attrib_PatientAge = PR1.attrib_PatientAge
			AND PR.org_RelatedProvider = PR1.org_RelatedProvider
		--AND  PR.org_RelatedProvider <>-1
		WHERE (
				PR.measure_PatientCount = 1
				AND PR1.measure_PatientCount = - 1
				)
			AND PR.date_Relationship < PR1.date_Relationship
			AND @intDate BETWEEN PR.date_Relationship
				AND PR1.date_Relationship
		GROUP BY PR.id_Patient
			,PR.provider_Related
			
		) A
	INNER JOIN Fact.PatientRelations AS PR1 ON A.id_Patient = PR1.id_Patient
		AND A.provider_Related = PR1.provider_Related
		AND A.FROM_D = PR1.date_Relationship
		AND PR1.measure_PatientCount = 1
	)

	
	,cte_Rel_Type
AS (
	SELECT A.id_Patient
		,A.provider_Related
		,CM.Severity_type
		,1 AS Indic
	FROM cte_ReL A
	left JOIN [Dim].[Comb_Inds] CM ON A.Severity_Score = CM.Severity_id
	)

	,cte_Rel_Gr_pr
AS (
	SELECT provider_Related
		,Severity_type
		,COUNT(DISTINCT id_Patient) ProvSum
	FROM cte_Rel_Type
	GROUP BY provider_Related
		,Severity_type
	)

		
	,cte_Rel_Gr_S
AS (
	SELECT provider_Related
		,COUNT(DISTINCT id_Patient) SSum
	FROM cte_Rel_Type
	GROUP BY provider_Related
	)
SELECT SUBSTRING(DC.FullName, 1, 15) Provider
	,A.Severity_type Severity_type
	,CAST((A.ProvSum * 1.0) / (B.SSum * 1.0) AS DECIMAL(6, 4)) AS Severity_Score
FROM cte_Rel_Gr_pr A
INNER JOIN cte_Rel_Gr_S B ON A.provider_Related = B.provider_Related
INNER JOIN [Dim].[CareProviders] DC ON A.provider_Related = DC.CareProviderKey
ORDER BY 1	, 2 


