SELECT *, 
       case when MSSPKey = 5 then (1 - Cast(member * 1.0 / pop AS FLOAT(24))) 
	   else Cast(member * 1.0 / pop AS FLOAT(24)) end Score
FROM   (SELECT MSSPKey,
			OrganizationKey, 
               date_yearmonth, 
               Sum(measure_memberind)     Member, 
               Sum(measure_populationind) Pop 
        FROM   [Fact].[MSSP_Services_Final]
      
        GROUP  BY OrganizationKey, 
                  date_yearmonth,
			   MSSPKey)T 
ORDER  BY 	cast(MSSPKey as nvarchar),
			cast(OrganizationKey as nvarchar),
			cast(date_yearmonth as nvarchar)
           

