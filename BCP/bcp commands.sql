https://www.red-gate.com/simple-talk/sql/database-administration/working-with-the-bcp-command-line-utility/

--export data from table
bcp AdventureWorks2008.HumanResources.Employee out C:\Data\EmployeeData_c.dat -c -t, -S localhost\SqlSrv2008 -T
-h TABLOCK	--with tablock
-b 100		--batch size
-E argument	--override identity insert
-F FIRST row--first row
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter out C:\temp\ClaimsFlatFiles\STGClaimsRevenueCenter.dat -c -t, -S AnalyticsDev2\INST03 -T

--import data into table w/o format file
bcp AdventureWorks2008.dbo.Employees in C:\Data\EmployeeData_c.dat -c -t, -S localhost\SqlSrv2008 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter in C:\temp\ClaimsFlatFiles\STGClaimsRevenueCenter.dat -c -t, -f C:\temp\ClaimsRevenueCenter_c.fmt -S AnalyticsDev2\INST03 -T

--create a format file from a table, chartacter datatypes
bcp AdventureWorks2008.Person.Person format nul -c -t, -f C:\Data\PersonFormat_c.fmt -S localhost\sqlsrv2008 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter format nul -c -t, -f C:\temp\ClaimsRevenueCenter_c.fmt -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter format nul -n -t, -f C:\temp\ClaimsRevenueCenter_n.fmt -S AnalyticsDev2\INST03 -T

--create a format file from a table native data types
bcp AdventureWorks2008.Person.Person format nul -n -f C:\Data\PersonFormat_n.fmt -S localhost\sqlsrv2008 -T

--below works	--character --comma
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter format nul -c -t, -f C:\temp\bcp\ClaimsRevenueCenter_c_t.fmt -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter out C:\temp\bcp\STGClaimsRevenueCenter_c_t.dat -c -t, -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter in C:\temp\bcp\STGClaimsRevenueCenter_c_t.dat -c -t, -f C:\temp\bcp\ClaimsRevenueCenter_c_t.fmt -S AnalyticsDev2\INST03 -T

--below works	--native	--comma
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter format nul -n -t, -f C:\temp\bcp\ClaimsRevenueCenter_n_t.fmt -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter out C:\temp\bcp\STGClaimsRevenueCenter_n_t.dat -n -t, -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter in C:\temp\bcp\STGClaimsRevenueCenter_n_t.dat -n -t, -f C:\temp\bcp\ClaimsRevenueCenter_n_t.fmt -S AnalyticsDev2\INST03 -T

--below works	--character --tab
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter format nul -c -f C:\temp\bcp\ClaimsRevenueCenter_c.fmt -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter out C:\temp\bcp\STGClaimsRevenueCenter_c.dat -c -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter in C:\temp\bcp\STGClaimsRevenueCenter_c.dat -c -f C:\temp\bcp\ClaimsRevenueCenter_c.fmt -S AnalyticsDev2\INST03 -T

--below works	--native	--tab
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter format nul -n -f C:\temp\bcp\ClaimsRevenueCenter_n.fmt -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter out C:\temp\bcp\STGClaimsRevenueCenter_n.dat -n -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter in C:\temp\bcp\STGClaimsRevenueCenter_n.dat -n -f C:\temp\bcp\ClaimsRevenueCenter_n.fmt -S AnalyticsDev2\INST03 -T

--generate format files
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsDemographics format nul -c -f "C:\temp\bcp\ClaimsDemographics_c.fmt" -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsDiagnosis format nul -c -f "C:\temp\bcp\ClaimsDiagnosis_c.fmt" -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsDME format nul -c -f "C:\temp\bcp\ClaimsDME_c.fmt" -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsHeader format nul -c -f "C:\temp\bcp\ClaimsHeader_c.fmt" -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsMedication format nul -c -f "C:\temp\bcp\ClaimsMedication_c.fmt" -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsPhysician format nul -c -f "C:\temp\bcp\ClaimsPhysician_c.fmt" -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsProcedure format nul -c -f "C:\temp\bcp\ClaimsProcedure_c.fmt" -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter format nul -c -f "C:\temp\bcp\ClaimsRevenueCenter_c.fmt" -S AnalyticsDev2\INST03 -T

--generate data dump
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsDemographics out "C:\temp\ClaimsFlatFiles\STGClaimsDemographics_c.dat" -c -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsDiagnosis out "C:\temp\ClaimsFlatFiles\STGClaimsDiagnosis_c.dat" -c -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsDME out "C:\temp\ClaimsFlatFiles\STGClaimsDME_c.dat" -c -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsHeader out "C:\temp\ClaimsFlatFiles\STGClaimsHeader_c.dat" -c -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsMedication out "C:\temp\ClaimsFlatFiles\data\STGClaimsMedication_c.dat" -c -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsPhysician out "C:\temp\ClaimsFlatFiles\STGClaimsPhysician_c.dat" -c -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsProcedure out "C:\temp\ClaimsFlatFiles\STGClaimsProcedure_c.dat" -c -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter out "C:\temp\ClaimsFlatFiles\STGClaimsRevenueCenter_c.dat" -c -S AnalyticsDev2\INST03 -T


--load data
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsDemographics in "C:\temp\ClaimsFlatFiles\data\STGClaimsDemographics_c.dat" -c -f "C:\temp\ClaimsFlatFiles\format\ClaimsDemographics_c.fmt" -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsDiagnosis in "C:\temp\ClaimsFlatFiles\data\STGClaimsDiagnosis_c.dat" -c -f "C:\temp\ClaimsFlatFiles\format\ClaimsDiagnosis_c.fmt" -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsDME in "C:\temp\ClaimsFlatFiles\data\STGClaimsDME_c.dat" -c -f "C:\temp\ClaimsFlatFiles\format\ClaimsDME_c.fmt" -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsHeader in "C:\temp\ClaimsFlatFiles\data\STGClaimsHeader_c.dat" -c -f "C:\temp\ClaimsFlatFiles\format\ClaimsHeader_c.fmt" -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsMedication in "C:\temp\ClaimsFlatFiles\data\STGClaimsMedication_c.dat" -c -f "C:\temp\ClaimsFlatFiles\format\ClaimsMedication_c.fmt" -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsPhysician in "C:\temp\ClaimsFlatFiles\data\STGClaimsPhysician_c.dat" -c -f "C:\temp\ClaimsFlatFiles\format\ClaimsPhysician_c.fmt" -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsProcedure in "C:\temp\ClaimsFlatFiles\data\STGClaimsProcedure_c.dat" -c -f "C:\temp\ClaimsFlatFiles\format\ClaimsProcedure_c.fmt" -S AnalyticsDev2\INST03 -T
bcp dbmSemanticAnalyticsSTG.Claims.STGClaimsRevenueCenter in "C:\temp\ClaimsFlatFiles\data\STGClaimsRevenueCenter_c.dat" -c -f "C:\temp\ClaimsFlatFiles\format\ClaimsRevenueCenter_c.fmt" -S AnalyticsDev2\INST03 -T

