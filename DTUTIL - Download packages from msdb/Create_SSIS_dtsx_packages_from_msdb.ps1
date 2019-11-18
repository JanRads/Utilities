Param(
    $SQLInstance ##= "dbm8-data112\inst02"
    , $OutputPath ##= "."
)

if(-not($SQLInstance)) { 
    Write-Output "Usage - scriptname.ps1 <DBServer\Instance> <FolderPath>"## -foreground Magenta
    Throw "Parameters were not supplied” 
}

#####Add all the SQL goodies (including Invoke-Sqlcmd)#####
$regexA = "[\.\\~]" ##all of these means current directory .\ . ~
$SSISFolder = ""

If ($OutputPath -replace $regexA, "" -eq "") {
    $OutputPath = $PSScriptRoot
}
$SSISFolder = "$OutputPath\$(Get-Date -format yyyyMMddHHmmss)"
add-pssnapin sqlserverprovidersnapin100 -ErrorAction SilentlyContinue
add-pssnapin sqlservercmdletsnapin100 -ErrorAction SilentlyContinue
##cls 

$Packages =  Invoke-Sqlcmd -MaxCharLength 10000000 -ServerInstance $SQLInstance -Query "WITH cte AS (
                                                                        SELECT    TOP 5 cast(foldername as varchar(max)) as folderpath, folderid
                                                                        FROM    msdb..sysssispackagefolders
                                                                        WHERE    parentfolderid = '00000000-0000-0000-0000-000000000000'
                                                                        UNION    ALL
                                                                        SELECT    cast(c.folderpath + '\' + f.foldername  as varchar(max)), f.folderid
                                                                        FROM    msdb..sysssispackagefolders f
                                                                        INNER    JOIN cte c        ON    c.folderid = f.parentfolderid
                                                                    )
                                                                    SELECT    c.folderpath,p.name,CAST(CAST(packagedata AS VARBINARY(MAX)) AS VARCHAR(MAX)) as pkg
                                                                    FROM    cte c
                                                                    INNER    JOIN msdb..sysssispackages p    ON    c.folderid = p.folderid
                                                                    WHERE    c.folderpath NOT LIKE 'Data Collector%'"

Foreach ($pkg in $Packages)
{
    $pkgName = $Pkg.name
    $folderPath = $Pkg.folderpath
    $fullfolderPath = "$SSISFolder\$folderPath\"
    if(!(test-path -path $fullfolderPath))
    {
        mkdir $fullfolderPath | Out-Null
        Write-Output "Created folder... "$fullfolderPath
    }
    $pkg.pkg | Out-File -Force -encoding ascii -FilePath "$fullfolderPath\$pkgName.dtsx"
    Write-Output "Writing package - "$folderPath\$pkgName.dtsx
}


###/*reference - http://sqlblog.com/blogs/jamie_thomson/archive/2011/02/02/export-all-ssis-packages-from-msdb-using-powershell.aspx*/
