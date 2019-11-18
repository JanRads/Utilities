 USE [dbmSemanticAnalyticsSTG]


MERGE [dbmSemanticAnalyticsSTG].[Persist].[DimAdminCodes] AS target  
  USING 
      (select distinct Code,BaselineCode,BaselineCodesystem,BaselineKey
	   from [dbmSemanticAnalyticsSTG].[Persist].[DimAdminCodes] a
	   where a.DimName='Procedures'
	      AND a.BaselineCode <> '-1'
             and a.BaselineCodeSystem<>'-1'
			 and code = '88.55'
	   )AS source  
ON (target.Code = source.Code)  
WHEN MATCHED AND target.DimName='Claims'
Then update set
          target.BaselineCode=source.BaselineCode
          ,target.BaselineCodeSystem = source.BaselineCodesystem
          ,target.BaselineKey=source.BaselineKey
			 ;



MERGE [dbmSemanticAnalyticsSTG].[Persist].[DimAdminCodes] AS target  
  USING 
      (select distinct Code,BaselineCode,BaselineCodesystem,BaselineKey
	   from [dbmSemanticAnalyticsSTG].[Persist].[DimAdminCodes] a
	   where a.DimName='Procedures'
	      AND a.BaselineCode <> '-1'
             and a.BaselineCodeSystem<>'-1'
			 and code = 'Z94.4'
	   )AS source  
ON (target.Code = source.Code)  
WHEN MATCHED AND target.DimName='Claims'
Then update set
          target.BaselineCode=source.BaselineCode
          ,target.BaselineCodeSystem = source.BaselineCodesystem
          ,target.BaselineKey=source.BaselineKey
			 ;