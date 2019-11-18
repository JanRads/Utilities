SELECT MeasureName,
			   MonthYear, 
			    Member, 
				Pop ,
       Cast(member * 1.0 / pop AS FLOAT)AS Score 
FROM   (SELECT  
				dm.MeasureName,
               date_yearmonth, 
			   d.MonthYearDesc as MonthYear,
               Sum(measure_memberind)     Member, 
               Sum(measure_populationind) Pop 
        FROM   fact.mssp m
		join dim.dates d on d.DateKey = m.date_YearMonth
		join dim.mssp dm on dm.MSSPKey = m.MSSPKey
       where d.Year = 2015
	  -- MSSPKey = 1 
        GROUP  BY 
				  MeasureName
                  ,date_yearmonth
				  ,d.MonthYearDesc
								 )T  	
ORDER  BY       MeasureName
	
		 
