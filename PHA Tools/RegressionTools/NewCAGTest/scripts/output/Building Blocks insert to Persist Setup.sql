USE [dbmSemanticAnalyticsSTG]
GO

EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR


--[DEA].[KnowledgeModules]

insert into [dbmSemanticAnalyticsSTG].[DEA].[KnowledgeModules]
([KmId]
      ,[ScopingEntityId]
      ,[BusinessId]
      ,[Version]
      ,[IsKeyKm]
      ,[Description]
      ,[Created]
      ,[LastUpdated])
VALUES 
(43,	'allscripts.analytics.pha',	'khcc'	,'1.0.0',	0,	NULL,getdate(),getdate()),
(76,		'allscripts.analytics.pha',		'leadtest',	'1.0.0'	,0,	NULL,getdate(),getdate()),
(10093,		'allscripts.analytics.pha',		'kmhedisflexiblesig',	'1.0.0',	0,	NULL,getdate(),getdate()),
(10127,		'allscripts.analytics.pha',		'hedisaba1',	'1.0.0'	,0,	NULL,getdate(),getdate()),
(10165,		'allscripts.analytics.pha',		'unilateralmastectomy',	'1.0.0',	0,	'Unilateral mastectomy And a bilateral modifier',getdate(),getdate()),
(10175,		'allscripts.analytics.pha',		'rightunilateralmaste',	'1.0.0'	,0,	'Right unilateral mastectomy',getdate(),getdate())

--DEA.KmResults



insert into       [dbmSemanticAnalyticsSTG].DEA.KmResults ( KmId, Name, Type, FlagNew)
VALUES

(43,	'women_cervical_cytology',	1000,	1),
(76,	'Lead Test'	,1000	,1),
(10165,	'Unilateral mastectomy And a bilateral modifier',	1000,	1),
(10175,	'Right unilateral mastectomy',	1000	,1),
(10127,	'had an outpatient visit',	1000,	1),
(10093,	'FlexibleSigmoidoscopy',	1000,	1)


Go

