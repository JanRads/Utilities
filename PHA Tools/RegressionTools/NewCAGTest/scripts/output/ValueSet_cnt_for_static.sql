/****** Script for SelectTopNRows command from SSMS  ******/
/****** Testing only samples from ValueSets 1 to 50  ******/
select ValueSetID ,count(FK) cnt
from dbmSemanticAnalytics.Factless.ValueSet
where ValueSetID between 1 and 50 
group by ValueSetID
order by ValueSetID