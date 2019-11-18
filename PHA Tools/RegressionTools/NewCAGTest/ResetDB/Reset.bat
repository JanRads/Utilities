call Inst.bat
set mypath=%cd%
sqlcmd -S %inst% -i EmptyDB.sql
cd ..\..\..\..\databases\PHA_Data\dbmSemanticAnalytics\StaticData
for %%c in (*.*) DO sqlcmd -S %inst% -i  %%c
cd ..\..\dbmSemanticAnalyticsSTG\StaticData
for %%c in (*.*) DO sqlcmd -S %inst% -i  "%%c"
cd %mypath%