SET NOCOUNT ON
select date_YearMonth AS [MonthYear], count(distinct id_Patient) as 'PopDistinctPatients'
 from [dbmSemanticAnalytics].Fact.PopulationMembersMonthly 
 group by date_YearMonth
having left(date_YearMonth,4) = cast(year(getdate()) as varchar)
order by 1
