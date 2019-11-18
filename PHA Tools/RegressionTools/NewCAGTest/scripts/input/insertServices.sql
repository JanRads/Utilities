USE dbmSemanticAnalyticsSTG
 truncate table [dbmSemanticAnalyticsSTG].[STG].[MSSP_Services]
insert into [dbmSemanticAnalyticsSTG].[STG].[MSSP_Services]
SELECT distinct(Id_Patient),CareProviderKey,OrganizationKey,date_YearMonth,NULL,NULL,1
  FROM [dbmSemanticAnalyticsSTG].[STG].[MSSP_Services]