
SELECT [ValueSetID]
      ,count([FK]) cnt
  FROM [dbmSemanticAnalytics].[Factless].[ValueSet]
  where ValueSetID in (137)
group by [ValueSetID]
order by 1

