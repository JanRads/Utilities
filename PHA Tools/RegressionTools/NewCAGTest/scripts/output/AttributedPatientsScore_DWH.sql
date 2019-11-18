select cast (D.MonthYearDesc as varchar(6))MonthYearDesc ,cast (A.reported/B.all_MSSP as  DECIMAL(5, 2))  AttributedPatientsScore
from
     (SELECT
      cast ([date_YearMonth] as int)[date_YearMonth],
      cast (sum (Measure_MemberInd)as money) reported
     FROM [dbmSemanticAnalytics].[Fact].[MSSP_Services_Final]
     where [Is_Reported] = 1 
     group by  [date_YearMonth])A
join
      (SELECT
            cast([date_YearMonth]as int)[date_YearMonth],
            cast (count ( Measure_PopulationInd) AS DECIMAL(5, 2)) all_MSSP
      FROM [dbmSemanticAnalytics].[Fact].[MSSP_Services_Final] 
	  	      group by  [date_YearMonth])B
on A.date_YearMonth = B.date_YearMonth
join [dbmSemanticAnalytics].[Dim].[Dates] D
on A.[date_YearMonth] = D.[DateKey]
order by A.date_YearMonth 

