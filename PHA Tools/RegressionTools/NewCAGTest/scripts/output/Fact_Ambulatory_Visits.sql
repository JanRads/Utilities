--EXP
use [dbmSemanticAnalytics]

EXEC dbmSemanticAnalyticsSTG.dbo.OpenHHR
select distinct  --,*
  id_patient,provider_attending, org_assigned,[dbmSemanticAnalyticsSTG].[dbo].[Convert_Date](dbmSemanticAnalyticsSTG.[dbo].[DecryptHR](admissionDateEnc))
from [Fact].[AmbulatoryVisits]
where
 id_patient in(36) and 
provider_attending  <>-1
order by id_patient,provider_attending, org_assigned
