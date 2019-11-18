--SET ANSI_WARNINGS OFF

with first as 
(
	
	
SELECT      CAST(MonthYearDesc AS varchar(6)) AS Year_Month, 
            COUNT(DISTINCT [dbmSemanticAnalytics].Fact.PopulationMembersMonthly.id_Patient) AS comunity_score
FROM           	[dbmSemanticAnalytics].Dim.Dates d
				INNER JOIN [dbmSemanticAnalytics].Fact.PopulationMembersMonthly 
				ON d.MonthYear = [dbmSemanticAnalytics].Fact.PopulationMembersMonthly.date_YearMonth
GROUP BY d.MonthYearDesc
		,d.MonthYear
--ORDER BY [dbmSemanticAnalytics].Dim.Dates.MonthYear

)

, secondd as
(


SELECT      CAST(MonthYearDesc AS varchar(6)) AS Year_Month, d.MonthYear,
		    COUNT(DISTINCT [dbmSemanticAnalytics].Fact.MeasureMembersMonthly.id_Patient) AS combined_score--, 
FROM            [dbmSemanticAnalytics].Fact.MeasureMembersMonthly 
				INNER JOIN 
				[dbmSemanticAnalytics].Dim.Dates d
				ON [dbmSemanticAnalytics].Fact.MeasureMembersMonthly.date_YearMonth = d.MonthYear 
GROUP BY d.MonthYearDesc
	    ,d.MonthYear
--ORDER BY [dbmSemanticAnalytics].Dim.Dates.MonthYear
)

select f.Year_Month, s.combined_score,f.comunity_score
from first f
	inner join secondd s
	on f.Year_Month = s.Year_Month
order by MonthYear

