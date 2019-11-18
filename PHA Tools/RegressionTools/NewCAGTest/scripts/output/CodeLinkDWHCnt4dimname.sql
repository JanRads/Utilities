SELECT count(*) cnt,
dimname
--top 100 *
  FROM [dbmSemanticAnalytics].[Factless].[ConditionsInHierarchy]
  where dimname <> '-1'
  group by DimName
order by DimName desc