
$SSISPackagesRootFolder = "C:\Temp\Upgrade"       #Packages to be updated resides in this location in a "Download" subfolder.
$DBSERVERS = @{}
$DBSERVERS.Add('Gateway', 'ANALYTICSDEV2\INST01')
$DBSERVERS.Add('STG', 'ANALYTICSDEV2\INST02')
$DBSERVERS.Add('DWH', 'ANALYTICSDEV2\INST03')
#$DBSERVERS.Add('MSTR_Statistics', 'ANALYTICSDEV2\INST04')
$DBSERVERS.Add('Default', 'ANALYTICSDEV2\INST04')

$ConnectionsToUpdate = "Gateway", "DWH", "STG", "dbm8-data112\inst03"

$totalPackageCount = 0;
$updatedPackageCount = 0;
$SSISPackagesDownloadFolder = $SSISPackagesRootFolder + "\Download";
$Packages = Get-ChildItem -Recurse $SSISPackagesDownloadFolder -File
Foreach ($pkg in $Packages)
{
    $totalPackageCount += 1;
    $pkgName = $Pkg.name;
    $packageFolder = (Get-Item $pkg.FullName).Directory.FullName;
    $packageFolder = $packageFolder.Replace("$SSISPackagesDownloadFolder", "");
    $fulldownloadfolderPath = (Get-Item $pkg.FullName).Directory.FullName;
    $fulluploadfolderPath = $fulldownloadfolderPath.Replace("Download\", "Upload\");
    
    #Write-Output $packageFolder;

    if(!(test-path -path $fulluploadfolderPath))
    {
        mkdir $fulluploadfolderPath | Out-Null
    }
    $inFileName = "$fulldownloadfolderPath\$pkgName";
    $outFileName = "$fulluploadfolderPath\$pkgName";
    #Write-Output "";
    #Write-Output "File ($totalPackageCount) - $inFileName";

    #Update Connection string
    [Reflection.Assembly]::LoadWithPartialName("System.Xml.Linq") | Out-Null
    $xDoc = [System.Xml.Linq.XDocument]::Load($inFileName);
    $ns = [System.Xml.Linq.XNamespace]::Get("www.microsoft.com/SqlServer/Dts");
    $connectionManagers = $xDoc.Descendants($ns + "ConnectionManager");
    $ConnectionUpdated = $false;

    foreach ($connection in $connectionManagers)
    {
        <#
        if($connection.Attribute($ns + "ObjectName") -ne $null -and $connection.Attribute($ns + "ObjectName").Value -eq "Gateway")
        {
            Write-Host $outFileName;
            break;
        }
        #>
        if($connection.Attribute($ns + "CreationName").Value -eq "OLEDB" -and $connection.Attribute($ns + "ObjectName") -ne $null -and $ConnectionsToUpdate -Contains $connection.Attribute($ns + "ObjectName").Value)
        {
            Write-Host "["$connection.Attribute($ns + "ObjectName").Value"]";
            #Write-Output "$Pkg.FullName ($connection.Attribute($ns + "ObjectName") -ne $null) -and ($connection.Attribute($ns + "ObjectName").Value -eq "STG")";
            $replaceServerName = "";
            switch( $connection.Attribute($ns + "ObjectName").Value )
            {
                Gateway
                {
                    $replaceServerName = $DBSERVERS.Gateway;
                }
                STG
                {
                    $replaceServerName = $DBSERVERS.STG;
                }
                DWH
                {
                    $replaceServerName = $DBSERVERS.DWH;
                }
                MSTR_Statistcs
                {
                    $replaceServerName = $DBSERVERS.MSTR_Statistics;
                }
                default
                {
                    $replaceServerName = $DBSERVERS.Default;
                }
            }
            $oldConnString = $connection.Element($ns + "ObjectData").Element($ns + "ConnectionManager").Attribute($ns + "ConnectionString").Value;
            $newConnString = $oldConnString -replace "Data Source=[A-Za-z0-9\\. -_]+?;", "Data Source=$replaceServerName;";
            Write-Host "Original Connection string " $oldConnString;
            Write-Host "     New Connection string " $newConnString;
            $connection.Element($ns + "ObjectData").Element($ns + "ConnectionManager").Attribute($ns + "ConnectionString").Value = $newConnString;
            $ConnectionUpdated = $true;
        }
    }   #end connections FOR loop

    if ($ConnectionUpdated -eq $true)
    {
        try{
            $xDoc.Save($outFileName);
            Write-Output "UPDATE DONE! Update complete. $outFileName";
            $updatedPackageCount += 1;
        }
        catch
        {
            Write-Host "Exception occured in " $outFileName
        }
    }
    else
    {
        if($connection.Attribute($ns + "ObjectName") -ne $null)
        {
            Write-Host $connection.Attribute($ns + "ObjectName").Value " - SKIPPED"
        }
    }
}
Write-Output "$updatedPackageCount of $totalPackageCount packages updated."

###/*reference - http://sqlblog.com/blogs/jamie_thomson/archive/2011/02/02/export-all-ssis-packages-from-msdb-using-powershell.aspx*/
