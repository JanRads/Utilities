USE [msdb]
GO

DECLARE @SERVERNAME AS VARCHAR(500) = @@SERVERNAME
SELECT @SERVERNAME = CASE WHEN CHARINDEX('\', @SERVERNAME) > 0 THEN 'LOCALHOST\' + RIGHT(@SERVERNAME, LEN(@SERVERNAME) - CHARINDEX('\', @SERVERNAME)) ELSE 'LOCALHOST' END
DECLARE @DROPJOB AS VARCHAR(500) = 'sqlcmd -S {0} -E -C -d msdb -Q "EXEC msdb.dbo.sp_delete_job @job_name=N''{1}'', @delete_unused_schedule=1"'

SELECT job_id, j.name, REPLACE(REPLACE(@DROPJOB, '{0}', @SERVERNAME), '{1}', j.name)
FROM dbo.sysjobs j
WHERE j.name LIKE '%ACG%'
OR j.name LIKE '%PHA%'
OR j.name LIKE '%Claims%'
ORDER BY j.name
