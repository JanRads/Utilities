/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [Id_Patient]
      ,[MSSPKey]
      ,[date_YearMonth]
      ,[Measure_PopulationInd]
      ,[Measure_MemberInd]
  FROM [dbmSemanticAnalytics].[Fact].[MSSP]
  where msspkey=1
  order by 1,3