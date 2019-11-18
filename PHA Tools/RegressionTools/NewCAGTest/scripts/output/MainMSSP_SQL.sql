use [dbmSemanticAnalytics]
go
select cast (D.MonthYearDesc as varchar(6)) MonthYearDesc
      ,cast (DM.MeasureName as varchar(80))MeasureName
	  ,cast ( DM.ImpN as varchar(3))ImpN
	  ,cast (DM.[GroupName] as varchar(30)) GroupName
	  ,'All' as Org
	  ,'All' as CareProvider
	   ,case 
         when DM.ImpN <> 2 then cast(C.[Measure Member Ind] as float)/C.[Measure Population Ind] 
              else 1- cast(C.[Measure Member Ind] as float)/C.[Measure Population Ind]  end MeasureScore
	   ,case 
         when DM.ImpN <> 2 then cast(E.[Measure Member Ind] as float)/E.[Measure Population Ind] 
              else 1- cast(E.[Measure Member Ind] as float)/E.[Measure Population Ind]   end PrevMeasureScore
	  
	  ,C.[Measure Member Ind]
	  ,DM.ImpN
	  ,case 
              when DM.ImpN <> 2 then G.AttributedPatientsScore
                 else 1-G.AttributedPatientsScore
                 end  AttributedPatientsScore
	  ,cast (P.Precentile as float(2))mssp_precentile
	  ,cast (p.Points as float(2))mssp_points
	  ,cast (F.mssp_target as float)mssp_target
	 -- ,P.lead    
	   ,case when DM.ImpN <> 2 then ceiling((C.[Measure Population Ind]*P.lead)-	C.[Measure Member Ind])
		            else ceiling(C.[Measure Member Ind]-(C.[Measure Population Ind]*(1-P.lead))) end  gap 
	,C.[Measure Population Ind] Den
	  ,E.[Measure Population Ind]   PrevDenominator
     
from  dim.MSSP DM
left join 
           (
           SELECT [MSSPKey] ,[date_YearMonth] 
                 ,sum([Measure_PopulationInd])[Measure Population Ind]
                 ,sum([Measure_MemberInd])[Measure Member Ind] 
             FROM [dbmSemanticAnalytics].[Fact].[MSSP_Services_Final]
             group by [MSSPKey],[date_YearMonth]
             	)C
      on    cast(C.MSSPKey as varchar) = cast (DM.MSSPKey as varchar)
       -- and cast(C.date_YearMonth as varchar) = cast(D.datekey as varchar)
 join [dim].Dates D
on C.date_YearMonth = D.DateKey

left join 
           (
             SELECT [MSSPKey] ,[date_YearMonth] 
                 ,cast(sum([Measure_MemberInd]) as float)/sum([Measure_PopulationInd])
				   AttributedPatientsScore
             FROM [dbmSemanticAnalytics].[Fact].[MSSP_Services_Final]
			 where date_YearMonth = cast( datepart(yyyy,getdate())  as varchar)+'0101'
			       and Is_Reported =1
             group by [MSSPKey],[date_YearMonth]
             	)G
      on    cast(G.MSSPKey as varchar) = cast (DM.MSSPKey as varchar)
        and cast(G.date_YearMonth as varchar) = cast(D.DateKey as varchar)
left join 
			(
			SELECT [MSSPKey],[Points],[Precentile],[LowLimitPrecent],[HighLimitPrecent]
                   ,case
				         when [Precentile] = 0.9 then 1
						 else  lead([LowLimitPrecent],1)over(order by [MSSPKey] ) 
					end as lead
            FROM [dbmSemanticAnalytics].[Dim].[MsspPoints]
			)P
			on P.MSSPKey = DM.MSSPKey
			--and (cast(C.[Measure Member Ind] as float)/C.[Measure Population Ind]) >= P.LowLimitPrecent
		 --   and (cast(C.[Measure Member Ind] as float)/C.[Measure Population Ind])  <=  P.HighLimitPrecent
			 and (case  when  DM.ImpN = 2 then 1-(cast(C.[Measure Member Ind] as float)/C.[Measure Member Ind]) else (cast(C.[Measure Member Ind] as float)/C.[Measure Population Ind])end) >= P.LowLimitPrecent
                  and (case  when  DM.ImpN = 2 then 1-(cast(C.[Measure Member Ind] as float)/C.[Measure Member Ind]) else (cast(C.[Measure Member Ind] as float)/C.[Measure Population Ind])end)  <=  P.HighLimitPrecent
left join 
           (
           SELECT [MSSPKey] ,[date_YearMonth] 
                 ,sum([Measure_PopulationInd])[Measure Population Ind]
                 ,sum([Measure_MemberInd])[Measure Member Ind] 
             FROM [dbmSemanticAnalytics].[Fact].[MSSP_Services_Final] 
			 where date_YearMonth = cast( datepart(yyyy,getdate()) -1 as varchar)+'0101'
             group by [MSSPKey],[date_YearMonth]
             	)E
		on  cast(E.MSSPKey as varchar) = cast (DM.MSSPKey as varchar)
        and cast(E.date_YearMonth +10000 as varchar) = cast(D.DateKey as varchar)
left join 
			(
		     	SELECT [MSSPKey] ,max([LowLimitPrecent])mssp_target
                FROM [dbmSemanticAnalytics].[Dim].[MsspPoints]
                group by MSSPKey
			)F
			on  cast(F.MSSPKey as varchar) = cast (DM.MSSPKey as varchar)
 where D.[DateKey] = cast( datepart(yyyy,getdate())as varchar)+'0101'
      and DM.MSSPKey< 18 --and MJ.OrganizationKey = 'A' and MJ.CareProviderKey = 'A'
	  and cast(C.[Measure Member Ind] as float)/C.[Measure Population Ind] > 0
	 
order by DM.MSSPKey








