--ACTUAL
select id_Patient,provider_Related,isnull(org_RelatedProvider,-1) org_RelatedProvider, min([date_To]) 
from
				(
				select [id_Patient],[provider_Related], [date_To]
					from 
					dbmSemanticAnalytics.factless.PatientProviderRelations PPR
					where isnull(PPR.date_From,[dbmSemanticAnalyticsSTG].[dbo].[Convert_Date](getdate())) <= [dbmSemanticAnalyticsSTG].[dbo].[Convert_Date](getdate()) and isnull(PPR.date_To,[dbmSemanticAnalyticsSTG].[dbo].[Convert_Date](getdate()))>=[dbmSemanticAnalyticsSTG].[dbo].[Convert_Date](getdate())
				) PatPro
				
				left join
				(
				select POR.org_RelatedProvider, POR.ProviderRelated, POR.DateFrom,POR.DateTo--, POR.timestamp
					from 
					dbmSemanticAnalytics.factless.providerOrganizationRelations_service POR
					where POR.DateFrom <= [dbmSemanticAnalyticsSTG].[dbo].[Convert_Date](getdate()) and POR.DateTo >= [dbmSemanticAnalyticsSTG].[dbo].[Convert_Date](getdate())
					and POR.OrganizationType = 0
				) OrgPro
				on 
			OrgPro.providerRelated = PatPro.provider_Related 
			where id_patient in(173,174,175)
			group by id_Patient,provider_Related,org_RelatedProvider
			order by 1,2,3,4