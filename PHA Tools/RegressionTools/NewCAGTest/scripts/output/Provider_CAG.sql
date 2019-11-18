
---EXP---
select ltrim(rtrim(MP.[CareProviderId_Root])) as CareProviderId_Root, 
       ltrim(rtrim(MP.[CareProviderId_Extension])) as CareProviderId_Extension, 
	   MP.[EnterpriseProviderID] as EnterpriseProviderID, 
       ltrim(rtrim(C.FullName)) as FullName,
	   DATEPART(yyyy,TimeOfBirth)*10000+DATEPART(MM,TimeOfBirth)*100+DATEPART(DD,TimeOfBirth) as TimeOfBirth, 1 as SiteId
from [dbmClinicalAnalyticsGateway].[MasterData].[CareProvider] C
left join [dbmClinicalAnalyticsGateway].[MasterData].[CareProviderIdentifier] MP
on C.EnterpriseProviderID = MP.EnterpriseProviderID 
where MP.[CareProviderId_Extension] LIKE N'PHA_EncAT_P%' 
order by MP.[CareProviderId_Root], MP.[CareProviderId_Extension]
;