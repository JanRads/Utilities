/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [id_LabResult]
      ,[id_LabOrder]
      ,[org_Performing]
      ,[org_Interpreting]
      ,[provider_Performing]
      ,[provider_Interpreting]
      ,[date_Result]
      ,[date_ResultTime]
      ,[attrib_Status]
      ,[attrib_LabClass]
      ,[attrib_Test]
      ,[attrib_SpecimenMaterial]
      ,[attrib_Interpretation]
      ,[attrib_ReferenceRangeLow]
      ,[attrib_ReferenceRangeHigh]
      ,[attrib_ReferenceRangeTxt]
      ,[attrib_ValueTxt]
      ,[attrib_ValueUnit]
      ,[attrib_Method]
      ,[measure_Value]
      ,[measure_ResultInd]
      ,[measure_CollectToResultTime]
      ,[measure_OutOfRange]
      ,[sys_PartitionDate]
      ,[sys_PartQtrCollectionDate]
      ,[id_Patient]
      ,[CollectionDate]
      ,[Bookmark]
      ,[ResultDateEnc]
      ,[CollectionDateEnc]
      ,[BatteryKey]
      ,[ClusterKey]
      ,[date_Collection]
      ,[measure_OrderToResultTime]
      ,[LabsClaimBaseLineCodeKey]
      ,[Original_ClaimID]
      ,[Flag_Claims]
  FROM [dbmSemanticAnalytics_DB2].[Fact].[LaboratoriesResult]