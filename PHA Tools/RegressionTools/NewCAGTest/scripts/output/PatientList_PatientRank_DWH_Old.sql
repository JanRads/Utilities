
USE [dbmSemanticAnalytics]
GO
With cte_Denominator AS (SELECT Dim.MeasureDefinition.MeasureLevel3Key, SUM(Dim.MeasureDefinition.Weight) AS SumWeight, Fact.PopulationMembersMonthly.id_Patient, 
                         Dim.Patients.FullName
FROM            Dim.MeasureDefinition INNER JOIN
                         Fact.PopulationMembersMonthly ON Dim.MeasureDefinition.MeasureKey = Fact.PopulationMembersMonthly.attrib_Measure LEFT OUTER JOIN
                         Dim.Patients ON Fact.PopulationMembersMonthly.id_Patient = Dim.Patients.PatientKey
WHERE        (Fact.PopulationMembersMonthly.date_YearMonth = cast( datepart(yyyy,getdate())as varchar)+'_01')
GROUP BY Dim.MeasureDefinition.MeasureLevel3Key, Dim.Patients.FullName, Fact.PopulationMembersMonthly.id_Patient),
					

cte_numerator AS (SELECT Dim.MeasureDefinition.MeasureLevel3Key, Dim.MeasureDefinition.MeasureKey, Dim.MeasureDefinition.Weight, Dim.MeasureDefinition.ImprovementNotation, Dim.MeasureDefinition.InverseInd, 
                         Fact.MeasureMembersMonthly.measure_MemberInd AS numerator, Fact.PopulationMembersMonthly.measure_MemberInd AS denominator, 
                         Fact.PopulationMembersMonthly.id_Patient
FROM            Fact.PopulationMembersMonthly INNER JOIN
                         Dim.MeasureDefinition ON Fact.PopulationMembersMonthly.attrib_Measure = Dim.MeasureDefinition.MeasureKey LEFT OUTER JOIN
                         Fact.MeasureMembersMonthly ON Fact.PopulationMembersMonthly.id_Patient = Fact.MeasureMembersMonthly.id_Patient AND 
                         Fact.PopulationMembersMonthly.date_YearMonth = Fact.MeasureMembersMonthly.date_YearMonth AND 
                         Fact.PopulationMembersMonthly.attrib_Measure = Fact.MeasureMembersMonthly.attrib_Measure
WHERE        (Fact.PopulationMembersMonthly.date_YearMonth = cast( datepart(yyyy,getdate())as varchar)+'_01')),


cte_All AS (SELECT  cte_numerator.MeasureLevel3Key, cte_numerator.Weight, cte_numerator.Weight/cte_Denominator.SumWeight as NewWeight , cte_numerator.ImprovementNotation, cte_numerator.InverseInd, cte_numerator.denominator, cte_numerator.numerator, cte_Denominator.id_Patient, cte_Denominator.FullName,
PatientRank=
(CASE 

				WHEN cte_numerator.ImprovementNotation=1 AND cte_numerator.InverseInd=1 and cte_numerator.denominator>0 and cte_numerator.numerator>0  THEN cte_numerator.Weight/cte_Denominator.SumWeight
				WHEN cte_numerator.ImprovementNotation=1 AND cte_numerator.InverseInd=1 and cte_numerator.denominator>0 and cte_numerator.numerator is null  THEN 0

				WHEN cte_numerator.ImprovementNotation=1 AND cte_numerator.InverseInd=2 and cte_numerator.denominator>0 and cte_numerator.numerator>0  THEN 0
				WHEN cte_numerator.ImprovementNotation=1 AND cte_numerator.InverseInd=2 and cte_numerator.denominator>0 and cte_numerator.numerator is null  THEN cte_numerator.Weight/cte_Denominator.SumWeight
				
				WHEN cte_numerator.ImprovementNotation=2 AND cte_numerator.InverseInd=1 and cte_numerator.denominator>0 and cte_numerator.numerator>0  THEN 0
				WHEN cte_numerator.ImprovementNotation=2 AND cte_numerator.InverseInd=1 and cte_numerator.denominator>0 and cte_numerator.numerator is null  THEN cte_numerator.Weight/cte_Denominator.SumWeight
							
			END)

FROM cte_Denominator inner join cte_numerator on cte_Denominator.MeasureLevel3Key = cte_numerator.MeasureLevel3Key  and cte_Denominator.id_Patient = cte_numerator.id_Patient ),


cte_total AS (SELECT  cte_All.id_Patient, cte_All.FullName, cte_All.MeasureLevel3Key ,SUM(cte_All.PatientRank)  AS SumPatientRank
			FROM cte_All
			GROUP BY cte_All.MeasureLevel3Key, cte_All.id_Patient, cte_All.FullName )


SELECT cte_total.FullName as Patient , CAST(SUM(cte_total.SumPatientRank) AS MONEY) AS TotalPatientRank
 FROM cte_total
 GROUP BY cte_total.FullName
 ORDER BY 1 DESC



















