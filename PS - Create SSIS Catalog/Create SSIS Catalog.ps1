$SSISServerInstance = "PRTDEV-DATA02\INST01";

# Load the IntegrationServices Assembly  
[Reflection.Assembly]::LoadWithPartialName("Microsoft.SqlServer.Management.IntegrationServices")  

# Store the IntegrationServices Assembly namespace to avoid typing it every time  
$ISNamespace = "Microsoft.SqlServer.Management.IntegrationServices"  

Write-Host "Connecting to server ..."  
# Configure ClrEnabled = 1
$sqlsrv = New-Object Microsoft.SQLServer.Management.SMO.Server $SSISServerInstance;
$sqlconfig = $sqlsrv.Configuration;
$sqlclr = $sqlsrv.Configuration.IsSqlClrEnabled;
$sqlclr.ConfigValue = 1;
$sqlconfig.Alter();
Write-Host "sp configure done!"  

# Create a connection to the server  
$sqlConnectionString = "Data Source=$SSISServerInstance;Initial Catalog=master;Integrated Security=SSPI;"  
$sqlConnection = New-Object System.Data.SqlClient.SqlConnection $sqlConnectionString  

# Create the Integration Services object  
$integrationServices = New-Object $ISNamespace".IntegrationServices" $sqlConnection  

# Provision a new SSIS Catalog  
$catalog = New-Object $ISNamespace".Catalog" ($integrationServices, "SSISDB", "P@assword1")  
$catalog.Create()
