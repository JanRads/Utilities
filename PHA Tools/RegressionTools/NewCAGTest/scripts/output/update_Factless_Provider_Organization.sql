--EXP
use [dbmSemanticAnalytics]

select ProviderRelated, org_RelatedProvider, DateTo, OrganizationType
from dbmSemanticAnalytics.Factless.providerOrganizationRelations_service
where --flagNew =1 and  
ProviderRelated in (13,26,24) or (ProviderRelated =25 and org_RelatedProvider = 4)
--order by 1,2,3,4
union 

select ProviderRelated, org_RelatedProvider, DateTo, OrganizationType
from dbmSemanticAnalytics.Factless.providerOrganizationRelations_service
--where --flagNew =1 and  
--ProviderRelated =14 and org_RelatedProvider = 4
order by 1,2,3,4