SET ANSI_WARNINGS OFF
SET ANSI_WARNINGS OFF
SET NOCOUNT ON

DECLARE @source1 TABLE (
	OrganizationKey INT
	,measure_PatientCount INT
	,org_RelatedProvider INT
	,[date_Relationship] BIGINT
	)

INSERT INTO @source1
SELECT O.*
	,measure_PatientCount
	,org_RelatedProvider
	,date_Relationship
FROM (
	SELECT OrganizationKey
	FROM [dbmSemanticAnalytics].Dim.Organizations
	WHERE level3id != - 1
	GROUP BY OrganizationKey
	) O
FULL JOIN (
	SELECT TOP 10000 [date_Relationship]
		,measure_Patientcount
		,id_Patient
		,org_RelatedProvider
	FROM [dbmSemanticAnalytics].[Fact].[PatientRelations]
	WHERE org_RelatedProvider != - 1
	ORDER BY date_Relationship
	) A ON o.OrganizationKey = a.org_RelatedProvider
WHERE OrganizationKey IS NOT NULL
	AND measure_PatientCount IS NOT NULL

DECLARE @source2 TABLE (
	yearmonth INT
	,DC INT
	)

INSERT INTO @source2
SELECT left([date_Relationship], 6) AS yearmonth
	,sum([measure_PatientCount]) AS DC
FROM @source1 B
GROUP BY left([date_Relationship], 6)

DECLARE @D TABLE (
	Year_Month BIGINT
	,admitted_rate_out_numerator INT
	,admitted_rate_out_denuminator INT
	)
DECLARE @C TABLE (
	Year_Month BIGINT
	,admitted_rate_out_numerator INT
	,admitted_rate_out_denuminator INT
	)

INSERT INTO @D
SELECT Year_Month
	,count(DISTINCT b.id_Patient) AS admitted_rate_out_numerator
	,NULL AS admitted_rate_out_denuminator
FROM (
	SELECT YEARMONTH AS Year_Month
		,a.id_Patient
		,NULL AS admitted_rate_out_denuminator
		,org_RelatedProvider_IndexAdm
	FROM (
		SELECT id_Patient
			,left([date_DischargeIndexAdmission], 6) AS yearmonth
			,org_RelatedProvider_IndexAdm
		FROM [dbmSemanticAnalytics].[Fact].[Readmissions]
		WHERE left([date_DischargeIndexAdmission], 6) > 0
			AND (
				[dbmSemanticAnalytics].[Fact].[Readmissions].org_RelatedProvider_IndexAdm <> - 1
				OR [dbmSemanticAnalytics].[Fact].[Readmissions].[sys_PartitionDate] IS NULL
				)
		) AS a
	) b
INNER JOIN (
	SELECT OrganizationKey
	FROM [dbmSemanticAnalytics].Dim.Organizations
	WHERE level3id != - 1
	GROUP BY OrganizationKey
	) O ON o.OrganizationKey = b.org_RelatedProvider_IndexAdm
--where OrganizationKey  is not null
GROUP BY Year_Month
ORDER BY Year_Month

INSERT INTO @C
SELECT Year_Month
	,sum(admitted_rate_out_numerator) AS admitted_rate_out_numerator
	,sum(admitted_rate_out_denuminator) AS admitted_rate_out_denuminator
FROM (
	SELECT *
	FROM @D
	
	UNION
	
	SELECT yearmonth AS Year_Month
		,NULL AS ADMITTED_RATE_out_numerator
		,(
			SELECT TOP 10000 sum(DC)
			FROM @source2 B
			WHERE B.yearmonth <= A.yearmonth
			) AS ADMITTED_RATE_out_denumerator
	FROM @source2 A
	GROUP BY yearmonth
	) tempo
GROUP BY Year_Month

UPDATE A
SET a.admitted_rate_out_denuminator = (
		SELECT admitted_rate_out_denuminator
		FROM @C AS d
		WHERE d.Year_Month = (
				SELECT TOP 1 max(c.Year_Month)
				FROM @C AS c
				WHERE c.Year_Month < a.Year_Month
					AND admitted_rate_out_denuminator IS NOT NULL
				)
		)
FROM @C AS A
WHERE a.admitted_rate_out_denuminator IS NULL

SELECT cast(DDD.MonthYearDesc AS VARCHAR(6)) AS Year_Month
	--,admitted_rate_out_numerator
	--,admitted_rate_out_denuminator
	,CAST(CAST(admitted_rate_out_numerator AS NUMERIC) / CAST(admitted_rate_out_denuminator AS NUMERIC) AS DECIMAL(5, 2)) AS admitted_rate_out_score
FROM (
	SELECT Year_Month
		,admitted_rate_out_numerator
		,admitted_rate_out_denuminator
	FROM @C
	WHERE admitted_rate_out_denuminator IS NOT NULL
		AND admitted_rate_out_denuminator != 0
		AND admitted_rate_out_numerator IS NOT NULL
	) F
JOIN (
	SELECT DISTINCT LEFT(DD.DateKey, 6) AS YM
		,DD.MonthYearDesc
	FROM [dbmSemanticAnalytics].DIM.DATES DD
	) DDD ON DDD.YM = F.Year_Month
WHERE F.admitted_rate_out_numerator > 0
ORDER BY F.Year_Month
