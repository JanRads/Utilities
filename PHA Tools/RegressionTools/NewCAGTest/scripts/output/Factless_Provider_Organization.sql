--EXP
use [dbmSemanticAnalytics]

select ProviderRelated, org_RelatedProvider, DateTo, OrganizationType
from dbmSemanticAnalytics.Factless.providerOrganizationRelations_service
order by 1,2,3,4
