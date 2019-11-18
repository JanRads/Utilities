USE [dbmSemanticAnalytics]
GO

with cte_matf as (SELECT     DISTINCT   SS.Id_Patient, SS.date_YearMonth, Dim.Comb_Inds.indicator_num
FROM            Dim.Comb_Inds INNER JOIN
                         Fact.SeverityScores AS SS ON Dim.Comb_Inds.Comb_id = SS.comb_id RIGHT OUTER JOIN
                         Fact.vPopulationMembersMonthly AS MM INNER JOIN
                         Dim.MeasureDefinition ON MM.attrib_Measure = Dim.MeasureDefinition.MeasureKey ON SS.Id_Patient = MM.id_Patient AND 
                         SS.date_YearMonth = MM.date_YearMonth AND SS.ScoreType = 'MCC Score'
WHERE        (SS.date_YearMonth = CAST(DATEPART(yyyy, GETDATE()) AS VARCHAR) + '_01')),

 cte_Denominator
AS (
	SELECT Dim.MeasureDefinition.MeasureLevel3Key
		,SUM(Dim.MeasureDefinition.Weight) AS SumWeight
		,Fact.PopulationMembersMonthly.id_Patient
		,Dim.Patients.FullName FullName
	FROM Dim.MeasureDefinition
	INNER JOIN Fact.PopulationMembersMonthly ON Dim.MeasureDefinition.MeasureKey = Fact.PopulationMembersMonthly.attrib_Measure
	LEFT OUTER JOIN Dim.Patients ON Fact.PopulationMembersMonthly.id_Patient = Dim.Patients.PatientKey
	WHERE (Fact.PopulationMembersMonthly.date_YearMonth = cast(datepart(yyyy, getdate()) AS VARCHAR) + '_02')
	GROUP BY Dim.MeasureDefinition.MeasureLevel3Key
		,Dim.Patients.FullName
		,Fact.PopulationMembersMonthly.id_Patient
	)
	,cte_numerator
AS (
	SELECT Dim.MeasureDefinition.MeasureLevel3Key
		,Dim.MeasureDefinition.MeasureKey
		,Dim.MeasureDefinition.Weight
		,Dim.MeasureDefinition.ImprovementNotation
		,Dim.MeasureDefinition.InverseInd
		,Fact.MeasureMembersMonthly.measure_MemberInd AS numerator
		,Fact.PopulationMembersMonthly.measure_MemberInd AS denominator
		,Fact.PopulationMembersMonthly.id_Patient
	FROM Fact.PopulationMembersMonthly
	INNER JOIN Dim.MeasureDefinition ON Fact.PopulationMembersMonthly.attrib_Measure = Dim.MeasureDefinition.MeasureKey
	LEFT OUTER JOIN Fact.MeasureMembersMonthly ON Fact.PopulationMembersMonthly.id_Patient = Fact.MeasureMembersMonthly.id_Patient
		AND Fact.PopulationMembersMonthly.date_YearMonth = Fact.MeasureMembersMonthly.date_YearMonth
		AND Fact.PopulationMembersMonthly.attrib_Measure = Fact.MeasureMembersMonthly.attrib_Measure
	WHERE (Fact.PopulationMembersMonthly.date_YearMonth = cast(datepart(yyyy, getdate()) AS VARCHAR) + '_02')
	)
	,cte_MCC
AS (
	SELECT Fact.SeverityScores.Severity_Score
		,Fact.SeverityScores.comb_id
		,Dim.Comb_Inds.indicator_num
		,Dim.Comb_Inds.Severity_type
		,Fact.SeverityScores.Id_Patient
	FROM Fact.SeverityScores
	INNER JOIN Dim.Comb_Inds ON Fact.SeverityScores.comb_id = Dim.Comb_Inds.Comb_id
	WHERE (Fact.SeverityScores.ScoreType = 'MCC Score')
		AND (Fact.SeverityScores.date_YearMonth = cast(datepart(yyyy, getdate()) AS VARCHAR) + '_02')
	)
	,cte_All
AS (
	SELECT cte_numerator.MeasureLevel3Key
		,cte_numerator.Weight
		,cte_numerator.Weight / cte_Denominator.SumWeight AS NewWeight
		,cte_numerator.ImprovementNotation
		,cte_numerator.InverseInd
		,cte_numerator.denominator
		,cte_numerator.numerator
		,cte_Denominator.id_Patient
		,cte_Denominator.FullName
		,PatientRank = (
			CASE 
				WHEN cte_numerator.ImprovementNotation = 1
					AND cte_numerator.InverseInd = 1
					AND cte_numerator.denominator > 0
					AND cte_numerator.numerator > 0
					THEN cte_numerator.Weight / cte_Denominator.SumWeight
				WHEN cte_numerator.ImprovementNotation = 1
					AND cte_numerator.InverseInd = 1
					AND cte_numerator.denominator > 0
					AND cte_numerator.numerator IS NULL
					THEN 0
				WHEN cte_numerator.ImprovementNotation = 1
					AND cte_numerator.InverseInd = 2
					AND cte_numerator.denominator > 0
					AND cte_numerator.numerator > 0
					THEN 0
				WHEN cte_numerator.ImprovementNotation = 1
					AND cte_numerator.InverseInd = 2
					AND cte_numerator.denominator > 0
					AND cte_numerator.numerator IS NULL
					THEN cte_numerator.Weight / cte_Denominator.SumWeight
				WHEN cte_numerator.ImprovementNotation = 2
					AND cte_numerator.InverseInd = 1
					AND cte_numerator.denominator > 0
					AND cte_numerator.numerator > 0
					THEN 0
				WHEN cte_numerator.ImprovementNotation = 2
					AND cte_numerator.InverseInd = 1
					AND cte_numerator.denominator > 0
					AND cte_numerator.numerator IS NULL
					THEN cte_numerator.Weight / cte_Denominator.SumWeight
				END
			)
	FROM cte_Denominator
	INNER JOIN cte_numerator ON cte_Denominator.MeasureLevel3Key = cte_numerator.MeasureLevel3Key
		AND cte_Denominator.id_Patient = cte_numerator.id_Patient
	)
	,cte_total
AS (
	SELECT cte_All.id_Patient
		,cte_All.FullName
		,cte_All.MeasureLevel3Key
		,SUM(cte_All.PatientRank) AS SumPatientRank
	FROM cte_All
	GROUP BY cte_All.MeasureLevel3Key
		,cte_All.id_Patient
		,cte_All.FullName
	)
	Select Patient, Severity_type, Indicator_num, TotalPatientRank, score_lastmonth
	from (
SELECT cte_total.FullName AS Patient  
	--,ISNULL(cte_MCC.comb_id, 0) Comb_ID
	,ISNULL(cte_MCC.Severity_type, 'Low') Severity_type
	,ISNULL(cte_MCC.indicator_num, 0) Indicator_num
	--,ISNULL(cte_MCC.Severity_Score,1) Severity_Id
	,CAST(SUM(cte_total.SumPatientRank) AS MONEY) AS TotalPatientRank
	,CAST(ISNULL( MAX(cte_matf.INDICATOR_NUM),0) AS MONEY) AS score_lastmonth, cte_total.id_Patient
FROM cte_total
LEFT OUTER JOIN cte_MCC ON cte_total.id_Patient = cte_MCC.Id_Patient LEFT OUTER JOIN cte_matf on cte_matf.id_patient = cte_total.id_Patient

GROUP BY cte_total.FullName 
	,ISNULL(cte_MCC.indicator_num, 0)
	,ISNULL(cte_MCC.Severity_type, 'Low')
	--	,ISNULL(cte_MCC.Severity_Score,1) 
	,ISNULL(cte_MCC.comb_id, 0)
	, cte_total.id_Patient

	having CAST(max(cte_total.SumPatientRank) AS MONEY) > 0
	)T
	inner join (
	Select distinct id_Patient
	From Factless.PatientRelationsFromTo
	where year(dbmSemanticAnalyticsSTG.dbo.unConvert_Date(date_To_Relationship))>= YEAR(GETDATE())
	) PRFT
	on T.id_Patient = PRFT.id_Patient
ORDER BY 1
