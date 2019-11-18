/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id_Document]
      ,[id_Encounter]
      ,[id_Patient]
      ,[MainDocumentId]
      ,[attrib_TypeMainDoc]
      ,[attrib_Status]
      ,[date_EffectiveDate]
      ,[attrib_Type]
      ,[attrib_Completion]
      ,[attrib_Language]
      ,[attrib_MediaType]
      ,[attrib_Schema]
      ,[TranscriptionTime]
      ,[LastUpdatedTime]
      ,[DocumentEffectiveTimeEnc]
      ,[measure_DocumentInd]
      ,[provider_Performing]
      ,[org_Assigned]
      ,[sys_PartitionDate]
      ,[Bookmark]
  FROM [dbmSemanticAnalytics_DB2].[Fact].[ClinicalDocument]