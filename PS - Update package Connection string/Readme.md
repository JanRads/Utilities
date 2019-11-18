
**Powershell, SQL Utility helps you migrate the PHA_DATA components across SSIS environments deployed to msdb.**

**Use case**

You need to reproduce or copy a PHA Environment 1 (say prod) to Environment 2 (say test). The SSIS packages have connection string that
need to be updated in the new environment so that no references to the old environment exists.
This utility can be used as a migration tool for this use case.

It performs the below functions
- Downloads the PHA SSIS packages from a source SQL server (parameter driven) to the File system (parameter driven). (Download packages.ps1)
- Updates the Connection string to user provided values pointing to the new environment. (Update Package Connection String.ps1)
- Upload the updated SSIS packages to the destination SQL server (New environment). (Upload packages.ps1)

**Typical workflow**

- Using [Download packages.ps1]
	- Copy script to source server
	- Update the User parameters -> Execute the powershell -> You will see packages downloded to the "Download" subfolder.
	- Copy the Local Root folder to the Destination Server

- Using [Update Package Connection String.ps1]
	- Update the User parameters -> Execute the powershell -> You will see packages updated and in an "Upload" subfolder.
	
- Using [Upload packages.ps1]
	- Update the User parameters -> Execute the powershell -> The packages will be uploaded to the destination server msdb.
	
- Using [Update SSIS Configurations.sql]
	- Update the Old and New values -> Execute in ssms
	
- Using [Update Master Key.sql]
	- Update the Master key password -> Execute in ssms
	- Master Key password found in Git: PHA 18.1_Maintenance\Databases\PHA_Data\dbmSemanticAnalyticsSTG\DB\dbmSemanticAnalyticsSTG.DB.sql (line 147)
	

**User Parameters**
- $SSISSourceServer				(Source SQL server instance from where the packages will be copied)
- $SSISPackagesRootFolder		(Local folder where the packages will be downloaded to. Subfolders "Download" & "Upload" will be created here to store the packages.)
- $SSISDestinationServer		(Destination SQL server instance where the packages will be uploaded to)

Update the below section with appropriate sql server instance in "Update Package Connection String.ps1"
$DBSERVERS.Add('Gateway', '<SQL SERVER INSTANCE>')
$DBSERVERS.Add('STG'	, '<SQL SERVER INSTANCE>')
$DBSERVERS.Add('DWH'	, '<SQL SERVER INSTANCE>')
$DBSERVERS.Add('Default', '<SQL SERVER INSTANCE>')


