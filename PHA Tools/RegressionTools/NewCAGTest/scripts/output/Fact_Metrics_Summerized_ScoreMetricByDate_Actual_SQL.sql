select * from (SELECT      datekey,
          Dim.MetricsDefinitions_v.Level2Description,
                cast(SUM(CQM_Metric_Summerized_v.numed_s) / SUM(CQM_Metric_Summerized_v.Denominator)as decimal(16,2)) AS score     
FROM      CQM_Metric_Summerized_v
       JOIN  Dim.MetricsDefinitions_v ON CQM_Metric_Summerized_v.MetricID = Dim.MetricsDefinitions_v.MetricKey
          where Level2Description <>'COMBINED'
GROUP BY CQM_Metric_Summerized_v.datekey , Dim.MetricsDefinitions_v.Level2Description
) as v where Level2Description not like '%locked%' and left(datekey,4)='2017'  ORDER BY 1,2