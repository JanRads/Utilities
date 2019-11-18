---exp--
use [dbmSemanticAnalytics]

SELECT count(distinct v.FK),  d.Name
--distinct v.FK, act.IndicatorId, d.ID
  FROM [dbmSemanticAnalytics].[Factless].[ValueSet] v
  inner join dim.ValueSet d
  on d.ID = v.ValueSetID
  inner join dim.ActiveIndicators act
  on act.ValueSetName = d.Name
where act.IndicatorId >= 39
group by   d.Name
order by 1,2 desc--,2




  
  ---3490
