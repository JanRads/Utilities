--ACT--DHW--
use [dbmSemanticAnalytics]

select (select count(distinct level2) 
from [Dim].[Organizations]
where level1='PHA_Automation_Root_Org' and level2 !='PHA_Automation_Root_Org') L1,

(select count(distinct level3) 
from [Dim].[Organizations]
where orgname!='Outpatient' and level2 ='Outpatient') 'L2-Outpatient',

(select count(distinct level3) 
from [Dim].[Organizations]
where orgname!='Inpatient' and level2 ='Inpatient') 'L2-Inpatient',

(select count(distinct level3) 
from [Dim].[Organizations]
where orgname!='Hospital_1_Level_3' and level3 ='Hospital_1_Level_3') L3,

(select top 1 SiteId
from [Dim].[Organizations]
where SiteId <> -1) SiteId