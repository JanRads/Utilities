USE [dbmSemanticAnalyticsSTG]

update [Log].[LTS]
set [TimeStamp]='2008-01-01'
WHERE Id in(6,35)