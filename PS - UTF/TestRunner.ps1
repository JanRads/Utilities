#:r "C:\+\git\ral\PHA_Admin_SQL\Patient_Attribution_Spec\MDM.usp_GetAttributionRequest.Procedure.Spec.sql"
Invoke-Sqlcmd -ServerInstance "S781531-W10" -InputFile "C:\+\git\ral\PHA_Admin_SQL\Patient_Attribution_Spec\MDM.usp_GetAttributionRequest.Procedure.Spec.sql"
#$DS = Invoke-Sqlcmd -ServerInstance "S781531-W10" -Query "SELECT * FROM dbmSemanticAnalyticsST.MDM.AttributionType" -As DataSet
#Write-Output $DS

#$DS = Invoke-Sqlcmd -ServerInstance "S781531-W10" -Query "SELECT  ID, Item FROM MyDB.dbo.MyTable" -As DataSet
#$DS.Tables[0].Rows | %{ echo "{ $($_['ID']), $($_['Item']) }" }
