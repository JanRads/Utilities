SELECT Care_Provider, YearMonth,  Member, Pop ,
       Cast(member * 1.0 / pop AS FLOAT)AS Score 
FROM   (SELECT CareProviderKey as Care_Provider, 
				date_yearmonth  ,
               d.MonthYearDesc AS YearMonth, 
               Sum(measure_memberind)     Member, 
               Sum(measure_populationind) Pop 
        FROM   fact.mssp m
		join dim.Dates d on d.DateKey = m.date_YearMonth
        where MSSPKey = 1 
        GROUP  BY CareProviderKey, 
				date_yearmonth, 
                  d.MonthYearDesc
				   )T 
ORDER  BY cast(Care_Provider as nvarchar) 
      ,YearMonth
