
with 

cte1 
as  
(SELECT D.DateKey as [date_Relationship],
        F.measure_PatientCount
 FROM [dbmSemanticAnalytics].Dim.Dates D LEFT OUTER JOIN [dbmSemanticAnalytics].Fact.PatientRelations F
     ON D.DateKey = F.date_Relationship
 )

, cte2 
  as 
  (
    select  [date_Relationship]   
           ,[measure_PatientCount], 
            sum([measure_PatientCount]) over(order by [date_Relationship] rows unbounded preceding) as runningSUM
     from  cte1
   ) 
   
, 
cte3
 as
( 
select cte2.* , cte2.date_Relationship / 100 as Month_Year
from cte2
) 

, 
cte4 
as 
(
SELECT ROW_NUMBER() OVER (ORDER BY Month_Year,runningSUM) AS Row,
       runningSUM ,
	   Month_Year
 FROM cte3
)  

, cte5
 as 
 ( 

select max(row) maxi ,
       Month_Year
from cte4 
group by Month_Year

  ) 

select cte4.runningSUM  as Community,
       D.MonthYear         
from cte4 inner join cte5 
  on cte4.Row = cte5.maxi  
  join  [dbmSemanticAnalytics].Dim.Dates D
   on (cast (cte4.Month_Year as varchar)+'01') = D.DateKey
where runningSUM is not null 
and D.year = (cast( datepart(yyyy,getdate())as varchar))  
order by D.MonthYear 