use [dbmSemanticAnalytics]
go

with cte1 
as
(SELECT D.MeasureLevel3Key
	,SUM(D.Weight) AS SumWeight
	,PMM.id_Patient
	,PMM.date_YearMonth
	,PMM.id_PopulationMember

FROM Dim.MeasureDefinition D   with (nolock)
INNER JOIN Fact.PopulationMembersMonthly PMM  with (nolock )ON D.MeasureKey = PMM.attrib_Measure
where  PMM.date_YearMonth = cast( datepart(yyyy,getdate())as varchar)+'_'+CONVERT(varchar(2), GETDATE(), 101)
GROUP BY D.MeasureLevel3Key
	,PMM.id_Patient
	,PMM.date_YearMonth
	,PMM.id_PopulationMember
	)


, cte2
as
(
SELECT D.MeasureLevel3Key
	,D.MeasureKey
	,D.Weight
	,D.ImprovementNotation
	,D.InverseInd
	,MMM.measure_MemberInd AS numerator
	,PMM.measure_MemberInd AS denominator
	,PMM.id_Patient
	,PMM.date_YearMonth

FROM Fact.PopulationMembersMonthly PMM   with (nolock )
INNER JOIN Dim.MeasureDefinition D   with (nolock ) ON PMM.attrib_Measure = D.MeasureKey
LEFT OUTER JOIN Fact.MeasureMembersMonthly MMM   with (nolock ) ON PMM.id_Patient = MMM.id_Patient
	AND PMM.date_YearMonth = MMM.date_YearMonth
	AND PMM.attrib_Measure = MMM.attrib_Measure
)

, cte3 
as
(
SELECT A.[id_PopulationMember]
		,[provider_Related]
		,[org_RelatedProvider]
		,PC.[sys_PartitionDate]
		,A.id_Patient [Patient]
		,CAST([TotalPatientRank] AS MONEY) AS TotalPatientRank
		,A.[date_YearMonth]
		,CASE 
		WHEN SS.comb_id IS NULL
			THEN 0
		ELSE SS.comb_id
		END AS comb_id
		FROM
(SELECT RD.date_YearMonth
	,RD.id_PopulationMember
	,RD.id_Patient
	,TotalPatientRank = SUM(CASE 
			WHEN RN.ImprovementNotation = 1
				AND RN.InverseInd = 1
				AND RN.denominator > 0
				AND RN.numerator > 0
				THEN RN.Weight / RD.SumWeight
			WHEN RN.ImprovementNotation = 1
				AND RN.InverseInd = 1
				AND RN.denominator > 0
				AND RN.numerator IS NULL
				THEN 0
			WHEN RN.ImprovementNotation = 1
				AND RN.InverseInd = 2
				AND RN.denominator > 0
				AND RN.numerator > 0
				THEN 0
			WHEN RN.ImprovementNotation = 1
				AND RN.InverseInd = 2
				AND RN.denominator > 0
				AND RN.numerator IS NULL
				THEN RN.Weight / RD.SumWeight
			WHEN RN.ImprovementNotation = 2
				AND RN.InverseInd = 1
				AND RN.denominator > 0
				AND RN.numerator > 0
				THEN 0
			WHEN RN.ImprovementNotation = 2
				AND RN.InverseInd = 1
				AND RN.denominator > 0
				AND RN.numerator IS NULL
				THEN RN.Weight / RD.SumWeight
			END)
FROM cte1 RD
INNER JOIN cte2 RN ON RD.MeasureLevel3Key = RN.MeasureLevel3Key
	AND RD.id_Patient = RN.id_Patient
	AND RN.date_YearMonth = RD.date_YearMonth
GROUP BY RD.date_YearMonth
	,RD.id_PopulationMember
	,RD.id_Patient)
	A 
	INNER JOIN [Factless].[PopulationPCPOrg] PC ON A.id_PopulationMember =PC.id_PopulationMember
	AND PC.org_RelatedProvider>0
	LEFT OUTER JOIN Fact.SeverityScores SS  with (nolock ) ON A.id_Patient = SS.Id_Patient
	AND A.date_YearMonth = SS.date_YearMonth
	AND SS.ScoreType = 'MCC Score'
)

select distinct F.* 
from cte3 F
join [dbmSemanticAnalytics].Dim.Dates D
   on F.date_YearMonth = D.MonthYear
  where D.Year =  cast( datepart(yyyy,getdate())as varchar)
  order by 1