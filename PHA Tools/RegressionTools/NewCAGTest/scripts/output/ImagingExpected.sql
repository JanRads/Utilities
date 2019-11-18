SELECT TOP (1000) [id_Imaging]
      ,[id_Patient]
      ,[id_Encounter]
      ,[org_Assigned]
      ,[org_PerformingUnit]
      ,[provider_Performer]
      ,[date_EffectiveDate]
      ,[date_RequestedEffectiveDate]
      ,[attrib_Status]
      ,[attrib_Priority]
      ,[attrib_ImagingCode]
      ,[attrib_ImagingType]
      ,[attrib_Uncertainty]
      ,[attrib_Mood]
      ,[attrib_Method]
      ,[attrib_Interpretation]
      ,[attrib_TargetSite]
      ,[attrib_RequestedImagingCode]
      ,[attrib_RequestedMood]
      ,[attrib_RequestedStatus]
      ,[attrib_RequestedPriority]
      ,[attrib_RequestedImagingType]
      ,[attrib_RequestedTargetSite]
      ,[attrib_SourceSystem]
      ,[measure_ImagingInd]
      ,[measure_AgeInDays]
      ,[measure_IsNegated]
      ,[sys_IsNew]
      ,[sys_IsRemoved]
      ,[sys_PartitionDate]
      ,[Bookmark]
      ,[ImagingRequest_EffectiveDateEnc]
      ,[ImagingStudy_EffectiveDateEnc]
      ,[ImagingClaimCodeKey]
      ,[Original_ClaimID]
      ,[Flag_Claims]
  FROM [dbmSemanticAnalytics_DB2].[Fact].[Imaging]