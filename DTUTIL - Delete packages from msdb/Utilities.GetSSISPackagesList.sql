USE msdb

DECLARE @SERVERNAME AS VARCHAR(500) = @@SERVERNAME
SELECT @SERVERNAME = CASE WHEN CHARINDEX('\', @SERVERNAME) > 0 THEN 'LOCALHOST\' + RIGHT(@SERVERNAME, LEN(@SERVERNAME) - CHARINDEX('\', @SERVERNAME)) ELSE 'LOCALHOST' END
DECLARE @SSISFOLDERDELETE AS VARCHAR(500) = 'dtutil /SourceS {0} /FDelete SQL;Analytics_SSIS;{1}'
DECLARE @SSISPACKAGEDELETE AS VARCHAR(500) = 'dtutil /SourceS {0} /SQL Analytics_SSIS\{1}\{2} /DELETE'

SELECT f.foldername, p.name
	, REPLACE(REPLACE(REPLACE(@SSISPACKAGEDELETE, '{0}', @SERVERNAME), '{1}', f.foldername), '{2}', name) AS PackageDelete
FROM dbo.sysssispackages p
INNER JOIN dbo.sysssispackagefolders f
ON p.folderid = f.folderid
WHERE f.parentfolderid <> '00000000-0000-0000-0000-000000000000'
ORDER BY f.foldername, p.name

SELECT DISTINCT f.foldername
	, REPLACE(REPLACE(@SSISFOLDERDELETE, '{0}', @SERVERNAME), '{1}', f.foldername) AS FolderDelete
FROM dbo.sysssispackages p
INNER JOIN dbo.sysssispackagefolders f
ON p.folderid = f.folderid
WHERE f.parentfolderid <> '00000000-0000-0000-0000-000000000000'
ORDER BY f.foldername
