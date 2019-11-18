dtutil /DestS LOCALHOST\INST03 /FILE C:\Temp\ACG_GenerateAnalyticReports.dtsx /COPY SQL;Analytics_SSIS\ACG\ACG_GenerateAnalyticReports

REM Upload with encryption -->
REM dtutil /DestS LOCALHOST\INST03 /FILE C:\Temp\%1.dtsx /ENCRYPT SQL;Analytics_SSIS\ACG\%1;5
dtutil /DestS LOCALHOST\INST01 /FILE C:\Temp\ClaimsAPI_OnboardFlatFiles.dtsx /COPY SQL;Analytics_SSIS\Claims\ClaimsAPI_OnboardFlatFiles