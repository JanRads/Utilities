
truncate table [dbmSemanticAnalyticsSTG].[Mirror].[ProviderOrganiztion_services] 
insert into [dbmSemanticAnalyticsSTG].[Mirror].[ProviderOrganiztion_services] values
('2.16.840.1.113883.3.57.1.3.5.52.1.26','godlinak','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','HH',0),
--('2.16.840.1.113883.3.57.1.3.5.52.1.26','svetavo','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','HH',0),will be close
('2.16.840.1.113883.3.57.1.3.5.52.1.26','PHA25_Stroke_P4_prov1','2.16.840.1.113883.3.57.1.3.5.52.1.6.1','HH',0),
('2.16.840.1.113883.3.57.1.3.5.52.1.26','PHA25_Stroke_P5_prov1', '2.16.840.1.113883.3.57.1.3.5.52.1.6.1','PHA_EncAT_org1',0),
('2.16.840.1.113883.3.57.1.3.5.52.1.26','PHA25_Stroke_P3_prov1', '2.16.840.1.113883.3.57.1.3.5.52.1.6.1','PHA_EncAT_org1',0)

update [dbmSemanticAnalytics].[Factless].[ProviderOrganizationRelations_Service]
set [DateFrom]= [dbmSemanticAnalyticsSTG].[dbo].[Convert_Date](dateadd(dd,-2,getdate()))

update [dbmSemanticAnalyticsSTG].[Persist].[ProviderOrganizationRelation_Services]
set [From_Date]=dateadd(dd,-2,getdate())