USE [dbmSemanticAnalytics]
GO


delete  fact.admissions where id_patient >1000
GO

SET IDENTITY_INSERT [Fact].[Admissions] ON
GO

  declare @StartDate int 
  declare @EndDate int 
  declare @CM int --current month 

  SET @StartDate = 
  (select dbmsemanticanalyticsstg.dbo.convert_date(Dateadd(month, Datediff(month, -1, Getdate()) - 4, -1)))

  SET @EndDate = 
  (select dbmsemanticanalyticsstg.dbo.convert_date(Dateadd(month, Datediff(month, -1, Getdate()) - 3, -1))) 

  SET @CM = 
  (select dbmsemanticanalyticsstg.dbo.convert_date(cast(getdate() as date)))

INSERT [Fact].[Admissions] (
	[id_Admission]
	,[id_Patient]
	,[org_Assigned]
	,[org_DischargingUnit]
	,[org_Referring]
	,[org_RelatedProvider]
	,[provider_Referring]
	,[provider_Admitting]
	,[provider_Discharging]
	,[provider_Related]
	,[provider_Attending]
	,[date_Admission]
	,[date_AdmissionTime]
	,[date_Discharge]
	,[date_DischargeTime]
	,[attrib_Status]
	,[attrib_Priority]
	,[attrib_EncounterType]
	,[attrib_DischargingServiceLine]
	,[attrib_DischargeDisposition]
	,[attrib_AdmissionReferralSource]
	,[attrib_AdmissionDiagnosisPrimary]
	,[attrib_DischargeDiagnosisPrimary]
	,[attrib_SourceSystem]
	,[attrib_PatientResidency]
	,[attrib_PatientAge]
	,[range_LOS]
	,[measure_AdmissionInd]
	,[measure_DischargeInd]
	,[measure_OpenAdmissionInd]
	,[mesure_UrgentAdmissionInd]
	,[measure_DeathInd]
	,[measure_LengthOfStay]
	,[measure_AgeInDays]
	,[sys_PartitionDate]
	,[Bookmark]
	,[TimeStamp]
	)
VALUES (
	1001
	,1001
	,5
	,- 1
	,7
	,2
	,11
	,11
	,- 1
	,11
	,11
	,@StartDate
	,15000
	,@EndDate
	,0
	,- 1
	,463537
	,- 1
	,- 1
	,617592
	,- 1
	,- 1
	,- 1
	,- 1
	,91770
	,18736
	,50
	,1
	,0
	,1
	,NULL
	,0
	,1191
	,10680
	,201502
	,119
	,CAST(0x0000A49F0110D14C AS DATETIME)
	)


INSERT [Fact].[Admissions] (
	[id_Admission]
	,[id_Patient]
	,[org_Assigned]
	,[org_DischargingUnit]
	,[org_Referring]
	,[org_RelatedProvider]
	,[provider_Referring]
	,[provider_Admitting]
	,[provider_Discharging]
	,[provider_Related]
	,[provider_Attending]
	,[date_Admission]
	,[date_AdmissionTime]
	,[date_Discharge]
	,[date_DischargeTime]
	,[attrib_Status]
	,[attrib_Priority]
	,[attrib_EncounterType]
	,[attrib_DischargingServiceLine]
	,[attrib_DischargeDisposition]
	,[attrib_AdmissionReferralSource]
	,[attrib_AdmissionDiagnosisPrimary]
	,[attrib_DischargeDiagnosisPrimary]
	,[attrib_SourceSystem]
	,[attrib_PatientResidency]
	,[attrib_PatientAge]
	,[range_LOS]
	,[measure_AdmissionInd]
	,[measure_DischargeInd]
	,[measure_OpenAdmissionInd]
	,[mesure_UrgentAdmissionInd]
	,[measure_DeathInd]
	,[measure_LengthOfStay]
	,[measure_AgeInDays]
	,[sys_PartitionDate]
	,[Bookmark]
	,[TimeStamp]
	)
VALUES (
	1002
	,1002
	,11
	,- 1
	,7
	,2
	,11
	,11
	,- 1
	,11
	,11
	,@StartDate
	,15000
	,@EndDate
	,0
	,- 1
	,463537
	,- 1
	,- 1
	,617592
	,- 1
	,- 1
	,- 1
	,- 1
	,91770
	,18736
	,50
	,1
	,0
	,1
	,NULL
	,0
	,1191
	,12816
	,201502
	,120
	,CAST(0x0000A49F0110D14C AS DATETIME)
	)


INSERT [Fact].[Admissions] (
	[id_Admission]
	,[id_Patient]
	,[org_Assigned]
	,[org_DischargingUnit]
	,[org_Referring]
	,[org_RelatedProvider]
	,[provider_Referring]
	,[provider_Admitting]
	,[provider_Discharging]
	,[provider_Related]
	,[provider_Attending]
	,[date_Admission]
	,[date_AdmissionTime]
	,[date_Discharge]
	,[date_DischargeTime]
	,[attrib_Status]
	,[attrib_Priority]
	,[attrib_EncounterType]
	,[attrib_DischargingServiceLine]
	,[attrib_DischargeDisposition]
	,[attrib_AdmissionReferralSource]
	,[attrib_AdmissionDiagnosisPrimary]
	,[attrib_DischargeDiagnosisPrimary]
	,[attrib_SourceSystem]
	,[attrib_PatientResidency]
	,[attrib_PatientAge]
	,[range_LOS]
	,[measure_AdmissionInd]
	,[measure_DischargeInd]
	,[measure_OpenAdmissionInd]
	,[mesure_UrgentAdmissionInd]
	,[measure_DeathInd]
	,[measure_LengthOfStay]
	,[measure_AgeInDays]
	,[sys_PartitionDate]
	,[Bookmark]
	,[TimeStamp]
	)
VALUES (
	1004
	,1004
	,11
	,- 1
	,7
	,2
	,11
	,11
	,- 1
	,11
	,11
	,@StartDate
	,15000
	,@EndDate
	,0
	,- 1
	,463537
	,- 1
	,- 1
	,617592
	,- 1
	,- 1
	,- 1
	,- 1
	,91770
	,18736
	,50
	,1
	,0
	,1
	,NULL
	,0
	,1191
	,8030
	,201502
	,121
	,CAST(0x0000A49F0110D14C AS DATETIME)
	)


INSERT [Fact].[Admissions] (
	[id_Admission]
	,[id_Patient]
	,[org_Assigned]
	,[org_DischargingUnit]
	,[org_Referring]
	,[org_RelatedProvider]
	,[provider_Referring]
	,[provider_Admitting]
	,[provider_Discharging]
	,[provider_Related]
	,[provider_Attending]
	,[date_Admission]
	,[date_AdmissionTime]
	,[date_Discharge]
	,[date_DischargeTime]
	,[attrib_Status]
	,[attrib_Priority]
	,[attrib_EncounterType]
	,[attrib_DischargingServiceLine]
	,[attrib_DischargeDisposition]
	,[attrib_AdmissionReferralSource]
	,[attrib_AdmissionDiagnosisPrimary]
	,[attrib_DischargeDiagnosisPrimary]
	,[attrib_SourceSystem]
	,[attrib_PatientResidency]
	,[attrib_PatientAge]
	,[range_LOS]
	,[measure_AdmissionInd]
	,[measure_DischargeInd]
	,[measure_OpenAdmissionInd]
	,[mesure_UrgentAdmissionInd]
	,[measure_DeathInd]
	,[measure_LengthOfStay]
	,[measure_AgeInDays]
	,[sys_PartitionDate]
	,[Bookmark]
	,[TimeStamp]
	)
VALUES (
	1005
	,1005
	,14
	,- 1
	,7
	,2
	,11
	,11
	,- 1
	,11
	,11
	,@CM
	,0
	,@CM
	,15000
	,- 1
	,463537
	,- 1
	,- 1
	,617592
	,- 1
	,- 1
	,- 1
	,- 1
	,91770
	,18736
	,50
	,1
	,0
	,1
	,NULL
	,0
	,1191
	,7300
	,201502
	,122
	,CAST(0x0000A49F0110D14C AS DATETIME)
	)


INSERT [Fact].[Admissions] (
	[id_Admission]
	,[id_Patient]
	,[org_Assigned]
	,[org_DischargingUnit]
	,[org_Referring]
	,[org_RelatedProvider]
	,[provider_Referring]
	,[provider_Admitting]
	,[provider_Discharging]
	,[provider_Related]
	,[provider_Attending]
	,[date_Admission]
	,[date_AdmissionTime]
	,[date_Discharge]
	,[date_DischargeTime]
	,[attrib_Status]
	,[attrib_Priority]
	,[attrib_EncounterType]
	,[attrib_DischargingServiceLine]
	,[attrib_DischargeDisposition]
	,[attrib_AdmissionReferralSource]
	,[attrib_AdmissionDiagnosisPrimary]
	,[attrib_DischargeDiagnosisPrimary]
	,[attrib_SourceSystem]
	,[attrib_PatientResidency]
	,[attrib_PatientAge]
	,[range_LOS]
	,[measure_AdmissionInd]
	,[measure_DischargeInd]
	,[measure_OpenAdmissionInd]
	,[mesure_UrgentAdmissionInd]
	,[measure_DeathInd]
	,[measure_LengthOfStay]
	,[measure_AgeInDays]
	,[sys_PartitionDate]
	,[Bookmark]
	,[TimeStamp]
	)
VALUES (
	1006
	,1006
	,14
	,- 1
	,7
	,2
	,11
	,11
	,- 1
	,11
	,11
	,@StartDate
	,15000
	,@EndDate
	,0
	,- 1
	,463537
	,- 1
	,- 1
	,617592
	,- 1
	,- 1
	,- 1
	,- 1
	,91770
	,18736
	,50
	,1
	,0
	,1
	,NULL
	,0
	,1191
	,9125
	,201502
	,123
	,CAST(0x0000A49F0110D14C AS DATETIME)
	)


SET IDENTITY_INSERT [Fact].[Admissions] OFF
GO


