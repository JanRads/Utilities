Use dbmSemanticAnalytics
EXEC sp_MSForEachTable 'TRUNCATE TABLE ?'

Use dbmSemanticAnalyticsSTG
EXEC sp_MSForEachTable 'if ''?'' = ''[dbo].[SSIS Configurations]'' or ''?'' = ''[Config].[MOBOTConfig]'' select 1 else truncate table ?'