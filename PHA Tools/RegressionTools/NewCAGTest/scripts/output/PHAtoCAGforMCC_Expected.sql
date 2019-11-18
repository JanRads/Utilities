EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR

SELECT [dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](b.Enc_Extension) AS PatId_Extension
	,date_YearMonth AS EffectiveTime_Start
	,Severity_Score AS Value
FROM (
	SELECT *
	FROM (
		SELECT Id_Patient
			,Severity_Score
			,date_YearMonth
			,ScoreTypeId
			,ROW_NUMBER() OVER (
				PARTITION BY Id_Patient
				,Severity_Score ORDER BY date_yearmonth
				) AS rn
		FROM [dbmSemanticAnalytics].Fact.SeverityScores
		GROUP BY Id_Patient
			,Severity_Score
			,date_YearMonth
			,date_YearMonth
			,ScoreTypeId
		HAVING ScoreTypeId = 1
		) t
	WHERE rn = 1
	) a
JOIN dbmSemanticAnalyticsSTG.Persist.MappingPatient b ON a.Id_Patient = b.PatientKey
WHERE [dbmSemanticAnalyticsSTG].[dbo].[DecryptHR](b.Enc_Extension) LIKE '%MCC%'
ORDER BY 1
	,2