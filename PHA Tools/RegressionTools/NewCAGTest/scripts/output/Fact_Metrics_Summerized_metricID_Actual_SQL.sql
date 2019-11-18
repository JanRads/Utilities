SELECT      Left(CQM_Metric_Summerized_v.datekey,6) datekey, 
            Dim.MetricsDefinitions_v.Level2Description ,
			CQM_Metric_Summerized_v.MetricID,
			Dim.MetricsDefinitions_v.MetricName   ,
			cast(SUM(CQM_Metric_Summerized_v.Numerator) / SUM(CQM_Metric_Summerized_v.Denominator)as decimal(6,2)) AS score                       
FROM        CQM_Metric_Summerized_v 
        JOIN Dim.MetricsDefinitions_v ON CQM_Metric_Summerized_v.MetricID = Dim.MetricsDefinitions_v.MetricKey
WHERE  CQM_Metric_Summerized_v.MetricID > 0
GROUP BY CQM_Metric_Summerized_v.datekey, CQM_Metric_Summerized_v.MetricID, Dim.MetricsDefinitions_v.MetricName, Dim.MetricsDefinitions_v.Level2Description
ORDER BY 1,3

