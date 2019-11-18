

select  [MetricKey]
      ,[MetricName]
      ,[Description]
      ,[Author]
      ,[Source]
      ,[Level1]
      ,[Level2]
      ,[Level3]
      ,[InHierarchy]
      ,[Weight]
      ,[ImpN]
      ,[TargetScore]
      ,[IsNew]
      ,[IsDelete]
      ,[StrXML]
from dbmSemanticAnalyticsSTG.config.MetricsDefinitions
where MetricKey in (1,2,3,4)
order by 1
