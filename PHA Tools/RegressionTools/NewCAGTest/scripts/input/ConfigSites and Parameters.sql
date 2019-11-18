update dbo.[ssis configurations]
set ConfiguredValue = 1
where  ConfigurationFilter='Match_by_MRN'

update dbo.[ssis configurations]
set ConfiguredValue = 1
where  ConfigurationFilter='Registries'


---InsertSites---

USE [dbmSemanticAnalyticsSTG]

CREATE TABLE #T (
	[SiteKey] [int] NOT NULL,
	[SiteName] [nvarchar](255) NOT NULL,
	[IP] [nvarchar](255) NOT NULL,
	[UserName] [nvarchar](255) NOT NULL,
	[Password] [nvarchar](255) NOT NULL, 
	IsActive [int] NOT NULL)

insert into #T
values (1,'AsafHarofe', '10.60.8.112\inst02', 'AsafHarofe1', 'AsafHarofe123', 1), --dbm8-data112\inst02
(2,'Meuhedet', '10.60.8.112\INST03', 'Meuhedet1', 'Meuhedet123', 1) --dbm8-data112\inst03

--dbm8-data111	10.60.8.111
--dbm8-data112	10.60.8.112
--dbm8-mstr		10.60.4.11
--PHAMSTR1		10.133.14.202
--AnalyticsDev1	10.133.14.201
--Analytics-St2	10.60.9.71
--AnalyticsDev3	10.133.14.204


select * from #T

DECLARE @S Sites_Services
INSERT INTO @S  
SELECT  [SiteKey], 
 	[SiteName],
	[IP],
	[UserName],
	[Password], 
	[IsActive]
FROM #T
 
EXEC [Mirror].[Sites_Services_ins] @S 
DROP TABLE #T


SELECT * FROM config.Sites