---Act---
select cast(ltrim(rtrim(MP.MappingProvider_Root)) as nvarchar(255)) as CareProviderId_Root, ltrim(rtrim(MP.MappingProvider_Extension)) as CareProviderId_Extension, MP.PPOLID as EnterpriseProviderID,
cast(ltrim(rtrim(C.FullName)) as nvarchar(500)) as FullName, C.TimeOfBirth as TimeOfBirth, C.SiteId
from [dbmSemanticAnalytics].dim.CareProviders C
left join [dbmSemanticAnalyticsSTG].[Persist].[MappingProvider] MP
on C.CareProviderKey = MP.CareProviderKey
where MP.MappingProvider_Extension LIKE N'PHA_EncAT_P%'  
order by MP.MappingProvider_Root, MP.MappingProvider_Extension
;


