DECLARE @SSISXML AS XML
;WITH cte AS 
	(
		SELECT    TOP 5 cast(foldername as varchar(max)) as folderpath, folderid
		FROM    msdb..sysssispackagefolders
		WHERE    parentfolderid = '00000000-0000-0000-0000-000000000000'
    
		UNION    ALL
		SELECT    cast(c.folderpath + '\' + f.foldername  as varchar(max)), f.folderid
		FROM    msdb..sysssispackagefolders f
		INNER    JOIN cte c        
		ON    c.folderid = f.parentfolderid
	)
, PackageText AS
	(
		SELECT c.folderpath
			, p.name
			, CAST(CAST(packagedata AS VARBINARY(MAX)) AS VARCHAR(MAX)) as pkg
			, CAST(CAST(CAST(packagedata AS VARBINARY(MAX)) AS VARCHAR(MAX)) AS XML)as SSISXML
		FROM    cte c
		INNER    JOIN msdb..sysssispackages p    ON    c.folderid = p.folderid
		WHERE    c.folderpath NOT LIKE 'Data Collector%'
		--AND p.name LIKE 'Claims_DWH'
	)
, PackagesCallingOtherPackages AS
	(
	SELECT folderpath AS PackagePath, Name AS ParentPackage, C.value('(PackageName)[1]', 'VARCHAR(8000)') AS ChildPackage
	FROM PackageText t1
	CROSS APPLY SSISXML.nodes('declare namespace DTS="www.microsoft.com/SqlServer/Dts"; //ExecutePackageTask') AS T(C)
	)
SELECT PackagesCallingOtherPackages.PackagePath
     , PackagesCallingOtherPackages.ParentPackage
     , PackagesCallingOtherPackages.ChildPackage
FROM PackagesCallingOtherPackages

UNION
SELECT pt.folderpath
     , pt.name AS ParentPackage
     , '--None--' AS ChildPackage
FROM PackageText pt
WHERE NOT EXISTS
	(
	SELECT 1
	FROM PackagesCallingOtherPackages t0
	WHERE pt.folderpath = t0.PackagePath
	AND pt.name = t0.ParentPackage
	)
ORDER BY 1, 2, 3
