SELECT *, 
       case when MSSPKey = 5 then (1 - Cast(member * 1.0 / pop AS FLOAT)) else Cast(member * 1.0 / pop AS FLOAT) end Score 
FROM   (SELECT	careproviderkey, 
				MSSPKey,
				--date_yearmonth, 
				Sum(measure_memberind)     Member, 
				Sum(measure_populationind) Pop 
        FROM   fact.mssp 
        where date_yearmonth=20150201	--MSSPKey = 1 or MSSPKey = 9
        GROUP  BY	careproviderkey, 
					MSSPKey				
					)T 
ORDER  BY cast(CareProviderKey as nvarchar), 
           cast(MSSPKey as nvarchar) 

