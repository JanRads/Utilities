--Test 199  SQL
--SeverityScoreInPatientList_DWH.sql

SELECT distinct Patient as PatientsKey
     , CM.Severity_id 	  
  FROM [dbmSemanticAnalytics].[Fact].[SumTotalRank] a
  inner JOIN [Dim].[Comb_Inds] CM ON A.[Comb_id] = CM.[Comb_id]  
  where [date_YearMonth]=  cast( datepart(yyyy,getdate())as varchar)+'_01'
  --group by Patient
  order by 1



  	