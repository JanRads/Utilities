
with hag_cte1 as 
(SELECT        Fact.Metrics_CQM.datekey, Fact.Metrics_CQM.[Patient Key], MetricKey  , MetricsDefinitions_v.Level2Description,   case when Dim.MetricsDefinitions_v.ImpN  = 1 then Fact.Metrics_CQM.Numerator else 1-Fact.Metrics_CQM.Numerator end as new_num 
FROM            Fact.Metrics_CQM INNER JOIN
                         Dim.MetricsDefinitions_v ON Fact.Metrics_CQM.[Measure Key] = Dim.MetricsDefinitions_v.MetricKey     )

, hag_cte2 as 

( select  datekey ,[Patient Key] ,   Level2Description  ,  cast(sum(new_num)as numeric)  / cast(count (*) as numeric)  as counti from hag_cte1 group by [Patient Key] , datekey ,  Level2Description  ) 




  ,hag_cte3 as ( select datekey ,Level2Description ,   cast(sum(counti)  / cast(count (*) as numeric) as decimal(6,2 ) )    as score from hag_cte2 group by datekey ,Level2Description  ) 

  select * from hag_cte3 where left(datekey,4)='2017'order by 1,2  
