use [dbmSemanticAnalytics]
SELECT count(distinct v.AdminCodeKey), r.Name
--distinct v.AdminCodeKey, v.IndicatorId, v.ValueSetID
  FROM [dbmSemanticAnalytics].[Factless].[ValueSetMapIndicator] v
  inner join dim.ValueSet r
  on r.ID = v.ValueSetID
  --inner join dim.AdminCodes c 
  --on v.AdminCodeKey=c.AdminCodeKey
 -- where v.ValueSetID = 
 where IndicatorId >= 39
 group by r.Name
order by 1,2desc --,2