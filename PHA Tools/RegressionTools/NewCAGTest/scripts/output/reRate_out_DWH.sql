SET ANSI_WARNINGS OFF

SELECT cast(D.MonthYearDesc AS VARCHAR(6)) AS Year_Month
	,isnull(numerator, 0) AS readmission_rate_out_numerator
	,isnull(denumenator, 0) AS readmission_rate_out_denumerator
	,CASE 
		WHEN denumenator > 0
			THEN CAST(CAST(numerator AS NUMERIC) / CAST(denumenator AS NUMERIC) AS DECIMAL(5, 2))
		ELSE NULL
		END AS readmission_rate_out_score
FROM (
	SELECT [dbmSemanticAnalytics].dim.dates.MonthYear
		,ISNULL(SUM([dbmSemanticAnalytics].[Fact].[Readmissions].measure_ReadmissionInd),0) AS numerator
		,SUM([dbmSemanticAnalytics].[Fact].[Readmissions].mesure_IndexAdmissionInd) AS denumenator
	FROM [dbmSemanticAnalytics].[Fact].[Readmissions]
	INNER JOIN [dbmSemanticAnalytics].dim.dates ON [dbmSemanticAnalytics].[Fact].[Readmissions].date_DischargeIndexAdmission = [dbmSemanticAnalytics].dim.dates.DateKey
	INNER JOIN [dbmSemanticAnalytics].Dim.Organizations ON [dbmSemanticAnalytics].[Fact].[Readmissions].org_RelatedProvider_IndexAdm = [dbmSemanticAnalytics].Dim.Organizations.OrganizationKey
	WHERE (
			[dbmSemanticAnalytics].Dim.Organizations.level3Id <> - 1
			OR [sys_PartitionDate] IS NULL
			)
	GROUP BY [dbmSemanticAnalytics].dim.dates.MonthYear
	) T
	,(
		SELECT DISTINCT MonthYear
			,MonthYearDesc
		FROM [dbmSemanticAnalytics].dim.dates
		) D
WHERE T.MonthYear = D.MonthYear
	AND numerator + denumenator > 0
ORDER BY d.MonthYear
