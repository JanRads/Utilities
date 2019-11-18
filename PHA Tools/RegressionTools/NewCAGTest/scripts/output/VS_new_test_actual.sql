
SELECT --distinct b.*, a.*
	   b.name
      ,count([FK]) cnt
  FROM [dbmSemanticAnalytics].[Factless].[ValueSet] a
  join [dbmSemanticAnalytics].dim.[ValueSet] b
  on a.ValueSetID = b.ID
  where name in ('A1C Labs','Asthma')
group by b.name
order by 1
