;with testData as (

select *
from dbmSemanticAnalyticsSTG.Persist.DimAdminCodes
where BaselineCodeSystem = 'Clinical Links'
)
select T2.LocalDesc, t3.LocalDesc
from (
select *
from dbmSemanticAnalytics.Factless.ConditionsInHierarchy
--where FlagNew = 1
)T1
inner join
testData T2
on T1.FK = T2.AdminCodeKey
inner join
testData T3
on T1.NodeFK = T3.AdminCodeKey
order by 1,2


