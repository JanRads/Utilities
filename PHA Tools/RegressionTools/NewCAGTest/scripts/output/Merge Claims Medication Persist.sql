USE [dbmSemanticAnalyticsSTG]
GO
EXEC dbo.OpenHHR

select 
 fm2.id_medication as id_MedicationSupply
		,DNR.id_Patient
		,ISNULL(med.id_medication,-1) as id_order
      ,ISNULL([dbo].[Convert_Date](dnr.StartDate), -1)  as [date_Order] --Order of prescription  
		,case when dnr.StartDate = -1 then dnr.StartDate
			  else [dbo].[Convert_Date](dnr.StartDate)
			  end as [date_Supply] --Supply the medication --we have a bug in the actual :)
     -- ,[dbo].[Convert_Date_Time](med.StartDate) date_OrderTime		
	 ,isnull(med.MedicationCode,-1) /*MedicationNDCCodeKey*/ as [attrib_Medication]
	  ,coalesce(forAge.[sys_PartitionDate],'-1') as [sys_PartitionDate]
      ,[Current_ClaimID] as [Original_ClaimID]
      ,dnr.[Flag_Claims]
	  ,null  [EndDate_SupplyEnc]
      ,dnr.Claim_Line_From_DateENC [Startdate_SupplyEnc]
      ,Med.MedicationsStartDateEnc  [Startdate_OrderEnc]
--,[attrib_PatientAge]
--,-1 AS id_Encounter ,-1 [org_Assigned] ,-1 [provider_Supplying],-1 [provider_Related],-1 [date_RequiredStart],-1 [date_RequiredStartTime],-1 [date_RequiredEnd]
--,-1 [date_RequiredEndTime],-1 [date_SupplyTime],-1 [attrib_Status],-1 [attrib_Priority],-1 [attrib_AdministrationType],-1 [attrib_DoseTxt],-1 [attrib_DoseUnit]
--,-1 [attrib_MedicationForm],-1 [attrib_DurationTxt],-1 [attrib_DuartionUnit] ,-1 [attrib_Frequency],-1 [attrib_Route],-1 [attrib_ApproachSite],-1 [attrib_DispenseQuantityTxt]
--,-1 [attrib_DispenseQuantityUnit],-1 [attrib_SourceSystem],-1 [attrib_PatientResidency],-1 [measure_SupplyInd],-1 [measure_SameBrandAsPrescribed],-1 [measure_DifferentIngredientsThanPrescribed]
--,-1 [measure_DoseNum],-1 [measure_DurationNum],-1 [measure_DispenseQuantityNum],-1 [measure_RepeatNumber],-1 [measure_AgeInDays],[ID_Claims]
from 
( --from Diagnosis New Records
	SELECT --ID_Claims = CAST(NEXT VALUE FOR [dbo].[ClaimID_seq] as int) /*also was ID_Claims_New*/,
	   [Current_ClaimID]
      ,[HIC_Number_Bnf]
      ,[NDC Code]
      ,[Claim_Type_Code]
	  ,ISNULL(left([dbo].[Convert_Date]([dbo].[DecryptHR](Claim_Line_From_DateENC)),6)+ '01' ,-1) as [StartDate]
	  ,Convert(VARCHAR(10), DATEADD(month, DATEDIFF(month, 0, cast([dbo].[DecryptHR](Claim_Line_From_DateENC) as date)), 0),112) as Claim_Line_From_Date
      ,[CodeSystem]
      ,[Provider_Service_ID_QLFYR_Code]
      ,[Claim_Service_Provider_GNRC_ID_NUM]
      ,[Claim_Dispensing_Status_Code]
      ,[Claim_DAW_Product_Selection_Code]
      ,[Claim_Line_Service_Unit_Quantity]
      ,[Claim_Line_Days_Supply_Quantity]
      ,[Provider_Prescribing_ID_Qualifier_Code]
      ,[Claim_Prescribing_Provider_Generic_ID_Number]
      ,[Claim_Line_Bnf_Payment_Amount]
      ,[Claim_Adjustment_Type_Code]
      ,[Claim_Effective_Date]
      ,[Claim_IDR_Load_Date]
      ,[Claim_Line_Prescription_Service]
      ,[Claim_Line_Prescription_Fill_Number]
      ,[ID]
      ,[Claim_Line_From_DateENC]
      ,[dbo].[DecryptHR]([Claim_Effective_DateENC]) [Claim_Effective_DateENC]
      ,[dbo].[DecryptHR]([Claim_IDR_Load_DateENC]) [Claim_IDR_Load_DateENC]
      --,[IsProcessed]
	  , 0 FlagNew --diff
	  , [fileName] = CAST('Medication' as nvarchar(20))
	  , Patient_Root
	  ,Mirror.[OriginalFileName] --new col
      ,Mirror.[ClaimsFormatType] --new col
	  ,Patient.PatientKey as id_Patient
	  , 1 as flag_claims
	  FROM  [Persist].[ClaimMedication] Mirror
		Inner JOIN  (						--bringing the [PatientKey] (Id_Patient)
			SELECT distinct [PatientKey], [Id_Extension], [Id_Root]
			FROM [Persist].[MappingPatient]
			union
			SELECT [PatientKey], [Patient_Extension], [PatientRoot]
			FROM [Persist].[PatientPopulatuion]
			where FlagNew=1
			) Patient
		ON Mirror.[HIC_Number_Bnf]=Patient.Id_Extension and Mirror.[Patient_Root] = Patient.Id_Root
) DNR
LEFT JOIN 
( --For convenience, we took only this code and not searching all admin codes
	select *
	FROM [Persist].[DimAdminCodes] 
	where DimName='Medications'
	--where BaselineCode = '208183' --this is RxNORM, It's NDC='00054419119', AdminCodeKey='381879'
) ACNDC
	ON DNR.[NDC Code] = ACNDC.code
LEFT JOIN 
( --We whipe out the data from claims that updated into clinical
	SELECT [id_Medication], [Medication_Root], [Medication_Ext], [Patient_Root], [Patient_Ext], [Medication_Class], [AssignedOrg_Root], [AssignedOrg_Ext], [Admission_Root], [Admission_Ext], [Order_Root], [Order_Ext], [StatusCode], [StatusCodeSystem], [PriorityCode], [PriorityCodeSystem], [StartDate], [EndDate], [FrequencyCode], [FrequencyCodeSystem], [Duration], [DuartionUnitOfMeasureCode], [DuartionUnitOfMeasueCodeSystem], [RepeatNumber], [RouteCode], [RouteCodeSystem], [ApproachSiteCode], [ApproachSiteCodeSystem], [DoseQuantity], [DoseUnitOfMeasureCode], [DoseUnitOfMeasureCodeSystem], [DispenseQuantity], [DispenseQuantityUnitOfMeasureCode], [DispenseQuantityUnitOfMeasureCodeSystem], [MedicationCode], [MedicationCodeSystem], [Date], [AdministrationTypeCode], [AdministrationTypeCodeSystem], [LastUpdated], [SourceSystemId_Root], [SourceSystemId_Extension], [MoodCode], [MoodCodeCodeSystem], [ActivityTime], [dbmAvailabilityTime], [NodeID], [DurationNum], [DoseQuantityNum], [FormCode], [FormCodeSystem], [DispenseQuantityNum], [FlagNew], [sys_PartitionDate], [BatchId_Extension], [BatchId_Root], [ManufactureName], [MaterialId_Extension], [MaterialId_Root], [MedicationbrandCode], [MedicationbrandCodeSystem], [MedicationDescription], [MedicationGenericCode], [MedicationGenericCodeSystem], [MedicationName], [Medicationtext], [ObservationStatusCode], [ObservationStatusCodeSystem], [Quantity_Conversion], [Quantity_UnitCode], [Quantity_UnitCodeSystem], [Quantity_Value], [SubstanceAdministrationCode], [SubstanceAdministrationCodeSystem], [DeleteKey], [CareProviderId_Root], [CareProviderId_Extension], [PerformerTypeIndicator], [TypeCode], [TypeCodeSystem], [AuthorCodeProvider_Root], [AuthorCodeProvider_Extension], [PerformerCodeProvider_Root], [PerformerCodeProvider_Extension], [ReferringCodeProvider_Root], [ReferringCodeProvider_Extension], [MedicationsActivityTimeEnc], [MedicationsStartDateEnc], [MedicationsEndDateEnc], [Original_ClaimID], [MedicationNDCCodeKey], [Flag_Claims], Null as [ID_Claims], [id_Patient]
	FROM [dbmSemanticAnalyticsSTG].[Persist].[FactMedications] 
	where Flag_Claims=0
)  Med
	ON Med.MedicationNDCCodeKey = ACNDC.BaselineKey 	--merge part
	AND MED.id_Patient=DNR.id_Patient
	AND CONVERT(datetime,[dbo].[DecryptHR](DNR.Claim_Line_From_DateEnc), 120) between CONVERT(datetime,[dbo].[DecryptHR](Med.[MedicationsStartDateEnc]), 120) 
	AND isnull(CONVERT(datetime,[dbo].[DecryptHR](Med.MedicationsEndDateEnc), 120), CONVERT(datetime,[dbo].[DecryptHR](DNR.Claim_Line_From_DateEnc), 120))
left join 
( 
	select distinct a.id_Patient,
			---a.[attrib_PatientAge]=AgeGroupKey, --AgeInDays--   Does not exist anymore!
			sys_PartitionDate=(select YEAR(a.DateConvert_date_Supply) * 100 + MONTH(a.DateConvert_date_Supply)
					from  [dbmSemanticAnalyticsSTG].[Config].[Def_OLAPPartitions]
					where [PartitionName] = 'FactMedicationsSupply')
			  -- ,[sys_PartitionDate]= YEAR(A.date_Supply) * 100 + MONTH(A.date_Supply) 
			 --  ,date_Supply = DateConvert_date_Supply
			 --  ,date_Order = DateConvert_date_Order	
	from ---dbmSemanticAnalytics.[Fact].[MedicationSupplies] C
	---inner join
	(--From MedicationAge prc
		SELECT FM.id_Medication, fm.id_Patient
				,ISNULL(DATEDIFF(d, [dbo].[DecryptHR](T2.BirthDate), ISNULL([dbo].[DecryptHR](FM.[MedicationsStartDateEnc]), getdate())), - 1) AS AgeInDays
				--,[dbo].[DecryptHR](FM.[MedicationsStartDateEnc]) date_Supply
				--,[dbo].[DecryptHR](FM2.[MedicationsStartDateEnc]) date_Order
				,ISNULL(left([dbo].[Convert_Date]([dbo].[DecryptHR](FM.[MedicationsStartDateEnc])),6)+ '01' ,-1) as  DateConvert_date_Supply
				,ISNULL(left([dbo].[Convert_Date]([dbo].[DecryptHR](FM2.[MedicationsStartDateEnc])),6)+ '01', - 1) AS DateConvert_date_Order
			FROM [Persist].[FactMedications] FM
			LEFT JOIN Persist.MappingPatient T1 ON FM.Patient_Ext = T1.Id_Extension
				AND FM.Patient_Root = T1.Id_Root
			LEFT JOIN dbmSemanticAnalytics.Dim.Patients T2 ON T1.PPOLId = T2.PPOLId
			LEFT JOIN Persist.FactMedications FM2 ON FM.ID_Claims = FM2.ID_Claims
			and fm.id_Medication=FM2.id_Medication
			WHERE FM.FlagNew = 1 --AND FM.Flag_Claims = 1
				--AND ISNULL(FM.DeleteKey,-1) <> 1	
				--and FM2.Flag_Claims = 1 AND FM2.DeleteKey <> 1
	 ) a
	 ---ON C.[id_MedicationSupply] = A.[id_Medication]
	 ---LEFT OUTER JOIN [dbmSemanticAnalytics].Dim.AgeGroups AG ON (AG.HIERARCHYID = '1')
	---	AND a.AgeInDays BETWEEN AG.From_age  AND AG.To_age
) ForAge
ON DNR.id_Patient=ForAge.id_Patient
left join [dbmSemanticAnalyticsSTG].[Persist].[FactMedications] as fm2
on fm2.Original_ClaimID=dnr.Current_ClaimID


--to make merge work:
  --EXEC dbo.OpenHHR
  --update [Persist].[ClaimMedication]
  --set Claim_Line_From_Date = '20160502', Claim_Line_From_DateENC=[dbo].[EncryptHR]('20160502')
  --where OriginalFileName ='C:\Program Files\Common Files\Claims\837\Inbound\INST02\X222-drug-administered_Guy_Merge.edi'