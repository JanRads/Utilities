SELECT PatId_Extension
	,b.MonthYear as EffectiveTime_Start
	,cast(Value AS INT) AS Value
FROM dbmClinicalAnalyticsGateway.PHA_Stage.MetricResults a
JOIN
[dbmSemanticAnalytics].[Dim].[Months_v] b
ON a.EffectiveTime_Start = b.StartMonthDate
WHERE MetricCode = '0130'
	AND PatId_Extension LIKE '%MCC%'
ORDER BY 1
	,2