--ACTUAL
use dbmSemanticAnalyticsSTG
select MP.CareProviderKey,isnull(DO.OrganizationKey,-1), PPO.To_Date, PPO.OrganizationType
from
	(select Provider_Root,Provider_Extension,Organization_Root,Organization_Extension,
	 dbmSemanticAnalyticsSTG.dbo.Convert_Date((select max(AlternateDateDesc) from dbmSemanticAnalytics.dim.dates))	 To_Date, OrganizationType
	from [Mirror].[ProviderOrganiztion_services])PPO
inner join persist.MappingProvider MP
	on PPO.Provider_Root=MP.MappingProvider_Root
	and PPO.Provider_Extension=MP.MappingProvider_Extension
inner join Persist.OrganizationMapping OM
	on PPO.Organization_Root =OM.id_Root
	and PPO.Organization_Extension =OM.id_Extension
inner join [dbmSemanticAnalytics].[Dim].[Organizations]DO
	on DO.PPOLID= OM.organizationId
order by 1,2,3,4