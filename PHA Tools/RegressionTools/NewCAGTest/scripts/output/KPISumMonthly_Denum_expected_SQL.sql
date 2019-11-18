

with kpi as (
(
SELECT distinct
		P.date_YearMonth
		,P.attrib_Measure
		,P.attrib_PatientAge
		,CASE 
			WHEN D.InverseInd = 1
				THEN isnull(M.measure_population, 0)
			ELSE P.measure_population - isnull(M.measure_population, 0)
			END AS numerator
			,d.InverseInd
			,P.measure_population * 1.0 AS denumerator
	FROM Fact.PopulationSumMonthly P WITH (NOLOCK)
	LEFT OUTER JOIN Fact.MeasureSumMonthly M ON P.sys_PartitionDate = M.sys_PartitionDate
		AND P.attrib_PatientAge = M.attrib_PatientAge
		AND P.attrib_Org = M.attrib_Org
		AND P.attrib_Provider = M.attrib_Provider
		AND P.attrib_Measure = M.attrib_Measure
		AND P.date_YearMonth = M.date_YearMonth
		AND P.Gender = M.Gender
		AND P.Severity_Score = M.Severity_Score
	INNER JOIN [Dim].[MeasureDefinition] D ON P.attrib_Measure = D.[MeasureKey]
	  where m.date_YearMonth =  cast( datepart(yyyy,getdate())as varchar)+'_01'
 and m.attrib_Org = -2
 and m.attrib_PatientAge > -2
 and m.attrib_Provider = -2
  AND m.Severity_Score=-2
  AND m.Gender=-2 
  and m.attrib_Program = -2
)

union

(	
		select distinct
		P.date_YearMonth
		,P.attrib_Measure
		,P.attrib_PatientAge
	    ,P.measure_population - 0  AS numerator
	   			,d.InverseInd
			,P.measure_population * 1.0 AS denumerator
		from [dbmSemanticAnalytics].Fact.PopulationSumMonthly P 
		JOIN  [dbmSemanticAnalytics].[Dim].[MeasureDefinition] D
		  on P.attrib_Measure = D.[MeasureKey]
		  join Fact.MeasureSumMonthly M 
		  on P.attrib_PatientAge = M.attrib_PatientAge
		AND P.attrib_Org = M.attrib_Org
		AND P.attrib_Provider = M.attrib_Provider
		AND P.Gender = M.Gender
		AND P.Severity_Score = M.Severity_Score
		WHERE NOT EXISTS (
						SELECT top (1)1
						FROM [dbmSemanticAnalytics]. Fact.MeasureSumMonthly M 
						JOIN  [dbmSemanticAnalytics].[Dim].[MeasureDefinition] D
						on M.attrib_Measure = D.[MeasureKey]
						and p.date_YearMonth = m.date_YearMonth
						AND P.attrib_PatientAge = M.attrib_PatientAge
						AND P.attrib_Org = M.attrib_Org
						AND P.attrib_Provider = M.attrib_Provider
						AND P.attrib_Measure = M.attrib_Measure
						AND P.date_YearMonth = M.date_YearMonth
						AND P.Gender = M.Gender
						AND P.Severity_Score = M.Severity_Score
						WHERE  D.[InverseInd] = 2
						and 	m.date_YearMonth =  cast( datepart(yyyy,getdate())as varchar)+'_01'
												
		)
	and	P.date_YearMonth =  cast( datepart(yyyy,getdate())as varchar)+'_01'
	and m.attrib_Org = -2
 and m.attrib_PatientAge > -2
 and m.attrib_Provider = -2
  AND m.Severity_Score=-2
  AND m.Gender=-2 
  and D.[InverseInd] = 2
   and m.attrib_Program = -2

))

select [date_YearMonth]
      ,[attrib_Measure]
      ,[attrib_PatientAge]
	  ,InverseInd
	  ,denumerator
	  ,kpi_score 
from 
(select [date_YearMonth]
      ,[attrib_Measure]
      ,[attrib_PatientAge]
	  ,InverseInd
	  ,denumerator
	  ,max(denumerator) over (partition by [date_YearMonth]
      ,[attrib_Measure]
      ,[attrib_PatientAge]
	  ,InverseInd) max_d
	  ,kpi_score 
from 

(select 
 [date_YearMonth]
      ,[attrib_Measure]
      ,[attrib_PatientAge]
    --  ,[numerator]
	  ,InverseInd
	  ,denumerator
	  ,cast (numerator/denumerator as decimal(4,2))as kpi_score 
	  
	  from kpi 
	  where  [numerator] > 0
	  ) q ) qq
where max_d = denumerator

order by 2,3

