--ACT--DHW--
use [dbmSemanticAnalytics]

---Site1---
select (select count(distinct level2) 
from [Dim].[Organizations]
where level1='PHA_Automation_Root_Org' and level2 !='PHA_Automation_Root_Org' and siteid = 1) L1,

(select count(distinct level3) 
from [Dim].[Organizations]
where orgname!='Outpatient' and level2 ='Outpatient' and siteid = 1) 'L2-Outpatient',

(select count(distinct level3) 
from [Dim].[Organizations]
where orgname!='Inpatient' and level2 ='Inpatient' and siteid = 1) 'L2-Inpatient',

(select count(distinct level3) 
from [Dim].[Organizations]
where orgname!='Hospital_1_Level_3' and level3 ='Hospital_1_Level_3' and siteid = 1) L3,

(select top 1 1 
from [Dim].[Organizations]
where SiteId = 1) SiteId

union
---Site2---

select (select count(distinct level2) 
from [Dim].[Organizations]
where level1='PHA_Automation_Root_Org' and level2 !='PHA_Automation_Root_Org' and siteid = 2) L1,

(select count(distinct level3) 
from [Dim].[Organizations]
where orgname!='Outpatient' and level2 ='Outpatient' and siteid = 2) 'L2-Outpatient',

(select count(distinct level3) 
from [Dim].[Organizations]
where orgname!='Inpatient' and level2 ='Inpatient' and siteid = 2) 'L2-Inpatient',

(select count(distinct level3) 
from [Dim].[Organizations]
where orgname!='Hospital_1_Level_3' and level3 ='Hospital_1_Level_3' and siteid = 2) L3,

(select top 1 2
from [Dim].[Organizations]
where SiteId = 2) SiteId