
--EXP--CAG-- 
use [dbmClinicalAnalyticsGateway]

select (select count(ParentOrganizationId) 
from [MasterData].[Organization] 
where ParentOrganizationId= -9000000001) L1,

(select count(ParentOrganizationId) 
from [MasterData].[Organization] 
where ParentOrganizationId= -9000000003) 'L2-Outpatient',

(select count(ParentOrganizationId) 
from [MasterData].[Organization] 
where ParentOrganizationId= -9000000002) 'L2-Inpatient',

(select count(ParentOrganizationId) 
from [MasterData].[Organization] 
where ParentOrganizationId= -9000000004) L3,

(select 1)  as SiteId