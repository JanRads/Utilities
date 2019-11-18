SET ANSI_WARNINGS OFF





SELECT        CAST(derivedtbl_3.MonthYearDesc AS varchar(6)) AS Year_Month, derivedtbl_1.numerator AS no_m2m_numerator, 
                         derivedtbl_2.denumerator AS no_m2m_denominator
FROM            (SELECT        SUM(measure_MemberInd) AS numerator, date_YearMonth
                          FROM            [dbmSemanticAnalytics].Fact.MeasureMembersMonthly
                          GROUP BY date_YearMonth) AS derivedtbl_1 INNER JOIN
                             (SELECT        SUM(measure_MemberInd) AS denumerator, date_YearMonth
                               FROM            [dbmSemanticAnalytics].Fact.PopulationMembersMonthly
                               GROUP BY date_YearMonth) AS derivedtbl_2 ON derivedtbl_1.date_YearMonth = derivedtbl_2.date_YearMonth INNER JOIN
                             (SELECT DISTINCT MonthYear, MonthYearDesc
                               FROM            [dbmSemanticAnalytics].Dim.Dates) AS derivedtbl_3 ON derivedtbl_1.date_YearMonth = derivedtbl_3.MonthYear
ORDER BY derivedtbl_1.date_YearMonth DESC