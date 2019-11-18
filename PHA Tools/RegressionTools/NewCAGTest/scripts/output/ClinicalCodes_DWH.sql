SELECT [DimName]
      ,[AdminCodeDesc]
      ,[Local_Code]
      ,[Local_CodeSystem]
      ,[Baseline_Code]
      ,[Besline_CodeSystem]FROM   dbmSemanticAnalytics.dim.ADMINCODES 
WHERE  DIMNAME IN ( 'Imaging', 'Procedures' ) 
       AND ADMINCODEKEY != -1 
order by  [Local_Code] ,[Local_CodeSystem]	   