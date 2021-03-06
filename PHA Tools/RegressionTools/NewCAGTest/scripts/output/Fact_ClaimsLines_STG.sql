
USE [dbmSemanticAnalyticsSTG]
GO
IF NOT EXISTS(SELECT TOP(1) 1 FROM [dbmSemanticAnalytics].[Factless].[PatientRelationsFromTo] where id_Patient in(161,163) )
BEGIN
Insert into [dbmSemanticAnalytics].[Factless].[PatientRelationsFromTo] ([id_Patient],[provider_Related],[org_RelatedProvider],[date__from_Relationship],[date_To_Relationship],[attrib_PatientAge],[Severity_Score],[comb_prog])
     VALUES (161,51,22,20121203,20301231,4,1,-1),(163,48,43,20140205,20301231,6,1,-1)
END
GO



with CTE    -- this table can be used as the pre claim line table 
AS
(
select 
	  C.ID 
	 ,C.ID_Claims
     ,CH.Current_ClaimID,
	 CH.id_Patient,
	case 
	    when C.[ClaimsFormatType] = 'CCLFp'  Then Cast(Ltrim(Rtrim(C.ClaimBillFacilityTypeCode))+Ltrim(Rtrim(C.ClaimBillClassificationCode)) as int)
	   ELSE
	         Cast(Ltrim(Rtrim(ISNULL(C.ClaimBillFacilityTypeCode,CH.Claim_Bill_Facility_Type_Code)))+Ltrim(Rtrim(ISNULL(C.ClaimBillClassificationCode,CH.Claim_Bill_Class_Code))) as int)
	   END      [TypeOfFacilityCode]                  
	  ,C.PlaceOfServiceCode     [PlaceOfServiceCode]            
	  ,ClaimFrequencyCode                           
	  ,CH.Principal_Diagnosis_Code Principal_Diagnosis_Code                     
	  ,cast(C.ClaimLinePayerPaidAmount as decimal(20,2)) [ClaimLinePayerPaidAmount]    
	  	,cast(C.ClaimLineChargeAmount as decimal(20,2)) [ClaimLineChargeAmount]
	,cast(CH.ClaimChargeAmount as decimal(20,2)) [ClaimChargeAmount]  
	,cast(CH.ClaimPayerPaidAmount as decimal(20,2)) [ClaimPayerPaidAmount] 
	  ,MeasurementUnit                         
	  ,Line_Service_Unit_Quantity              
	  ,FacilityProvider                       
	  ,Claim_Admission_Date                    
	  ,Claim_Admission_DateENC                 
	  ,Claim_Admission_Type_Code               
	  ,Claim_Discharge_Date                    
	  ,Claim_Discharge_DateENC                 
	,CH.Bnf_Patient_Status_Code Patient_Status_Code
	,C.Product_Revenue_Center_Code as  Product_Revenue_Center_Code
	,c.[ClaimsFormatType]
  FROM [Persist].[ClaimRevenueCenter] C
    LEFT JOIN [Persist].[ClaimsHeader] CH
       ON C.Current_ClaimID = CH.Current_ClaimID and C.id_Patient = CH.id_Patient


)

SELECT
--CR.CodeSystem,
       CR.[Current_ClaimID]  [Original_ClaimID]
      ,[Claim_Line_Number] 
	  ,Patient.PatientKey [id_Patient]
	  --,ISNULL(PR.org_RelatedProvider,-1) [org_Assigned]
	  --,ISNULL(PR.provider_Related,-1)  [provider_Performer]
	  ,ISNULL(PR.comb_prog,-1) [Id_Program]
	  ,[Line_From_DateENC]
      ,[Line_Thru_DateENC]
	  ,CR.[Claim_From_DateENC]
      ,CR.[Claim_Thru_DateENC]
	  ,isnull((  case 
                   when ((CR.Claim_Type_Code /100>0 and CR.Claim_Type_Code /100<7)  or CR.Claim_Type_Code /100=9 )
                                         then  (case 
                                         when  (CR.Claim_Type_Code /10%10=1 or CR.Claim_Type_Code /10%10=2) then 60
                                         when (CR.Claim_Type_Code /10%10=3) then 40 
                                         else CR.Claim_Type_Code 
                                         end )  
                                         when CR.Claim_Type_Code /100=0 
                                         then(  
                                     case
                                         when ( (CR.Claim_Type_Code /10>0 and  CR.Claim_Type_Code /10<7) or  CR.Claim_Type_Code /10=9  )
                                         then  (case 
                                         when CR.Claim_Type_Code %10=1 or CR.Claim_Type_Code %10=2 then 60
                                         when CR.Claim_Type_Code %10=3 then 40 
                                         else CR.Claim_Type_Code   end)
                                         else CR.Claim_Type_Code 
                                         end )
                                        else CR.Claim_Type_Code 
                                           end),-1)
                                         as  [attrib_Claim_Type_Code]

	  ,ISNULL(DAC.AdminCodeKey,-1) [attrib_Claim]   
	  --,ISNULL(PR.attrib_PatientAge,-1) [attrib_PatientAge]
	 --,ISNULL(CPP.[PayerKey],-1) [attrib_ClaimPrimaryPayerCode]
	  ,cast(ISNULL(CR.ClaimLineChargeAmount,CR.ClaimLinePayerPaidAmount) as decimal(15,2)) [measure_Claim_Line_Amount]

      ,isnull( CH.BillingProviderName,'Undefined' ) [Attrib_BillingProviderName]

      , isnull( bstp.ClaimsProviderTaxonomyDesc,'Undefined' )  [Attrib_BillingProviderTaxonomy]
      , coalesce (bsr.ClaimRelationCode  ,'Undefined' ) [Attrib_PrimaryPayerRelationshipToPersonInsured]
      ,isnull((case when ch.ClaimsFormatType like '%837%' then  ch.AttendingProviderName else CH.AttendingProviderIdentificationCode end) ,'Undefined' )  [Attrib_AttendingProviderName]
      ,isnull(bstp2.ClaimsProviderTaxonomyDesc,'Undefined' ) [Attrib_AttendingProviderTaxonomy]
      ,isnull(CR.RenderingProviderName,'Undefined' ) [Attrib_RenderingProviderName]
	 ,   isnull(bcpt.ClaimsProviderTaxonomyDesc,'Undefined' ) [Attrib_RenderingProviderTaxonomy]
      ,isnull(CR.SupervisingProviderName ,'Undefined' )[Attrib_SupervisingProviderName]
	   ,coalesce(cte.FacilityProvider,'Undefined') [Attrib_FacilityProvider]
      ,cte.ClaimChargeAmount   [measure_ClaimChargeAmount]
    , coalesce(cft.ClaimsFacilityTypeDesc,'Undefined')  [attrib_TypeOfFacility]
      ,coalesce(cpos.ClaimsPlaceOfServiceName,'Undefined')  [attrib_PlaceOfService]
     , coalesce(cft1.ClaimsFrequencyTypeDesc,'Undefined') [attrib_ClaimFrequencyType]
      ,CTE.Claim_Admission_Date  [date_AdmissionDate]
     -- ,CAT.ClaimsAdmissionsTypeName   [attrib_AdmissionType]
      ,CTE.Claim_Discharge_Date  [date_DischargeDate]
      --,coalesce(LEFT(CRC.ClaimFieldDesc, LEN(CRC.ClaimFieldDesc)-1),'Undefined')  [attrib_RevenueCodeDescription]---------
      ,CTE.ClaimLineChargeAmount [measure_ClaimLineChargeAmount]
      , cte.ClaimPayerPaidAmount [measure_ClaimPayerPaidAmount]

      ,coalesce(CPS.ClaimsPatientStatusDesc,'Undefined')  [attrib_PatientStatus]
     ,cr.Line_Service_Unit_Quantity [Line_Service_Unit_Quantity]
      ,coalesce(cmu.[MeasurementUnitDesc] ,'Undefined') [MeasurementUnitDesc]
      ,cr.ClaimsFormatType  [attrib_ClaimsFormatType]
	 
	 
  FROM [dbmSemanticAnalyticsSTG].Persist.[ClaimRevenueCenter] CR
 
	LEFT JOIN [Persist].[MappingPatient] Patient
       ON CR.[HIC_Number_Bnf]=Patient.Id_Extension and CR.[Patient_Root] = Patient.Id_Root
	LEFT JOIN [Persist].[ClaimsHeader] CH
       ON CR.Current_ClaimID = CH.Current_ClaimID and Patient.PatientKey = CH.id_Patient
left 	  join cte on CTE.Current_ClaimID=CH.Current_ClaimID and CTE.id_Patient = CH.id_Patient and cte.Current_ClaimID=ch.Current_ClaimID and CTE.id_Patient = CR.id_Patient AND Cr.ID=CTE.ID AND cr.ID_Claims =cte.ID_Claims
	Left JOIN [dbmSemanticAnalytics].[Factless].[PatientRelationsFromTo] PR
	   ON Patient.PatientKey = PR.id_Patient  AND CR.Line_From_DateENC = CR.Line_From_DateENC
	LEFT 
	JOIN [dbmSemanticAnalyticsSTG].[Persist].[DimAdminCodes] DAC ON CR.HCPCS_Code = DAC.code and DAC.DimName like '%Claims%'
	   and DAC.CodeSystem = cr.CodeSystem
    LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[DimClaimPayer] CPP
	   ON CPP.PayerClaims_Root  = CR.[Patient_Root]   and cpp.PayerClaims_Ext=ch.PayerIdentificationCode --attribclaimpayercode
	   LEFT JOIN  [BI_Sources].[ClaimsProviderTaxonomy]bstp ON bstp.ClaimsProviderTaxonomyCode=CH.BillingProviderTaxonomyCode
	   LEFT JOIN  [BI_Sources].[ClaimsRelations]bsr ON bsr.ClaimRelationCode=CH.PatientRelationshipToPersonInsured
		 LEFT JOIN  [BI_Sources].[ClaimsProviderTaxonomy]bstp2 ON bstp2.ClaimsProviderTaxonomyCode=CH.AttendingProviderTaxonomyCode
		  LEFT JOIN  [BI_Sources].[ClaimsProviderTaxonomy]bcpt ON bcpt.ClaimsProviderTaxonomyCode=CR.RenderingProviderTaxonomyCode
        LEFT JOIN [BI_Sources].[ClaimsFacilityType] cft on cft.ClaimsFacilityTypeID= cte.TypeOfFacilityCode 
	   LEFT JOIN [BI_Sources].[ClaimsPlaceOfService] cpos on cpos.ClaimsPlaceOfServiceCode=cte.PlaceOfServiceCode
	   LEFT JOIN [BI_Sources].[ClaimsFrequencyType] cft1 on cft1.ClaimsFrequencyTypeCode=cte.ClaimFrequencyCode 
	   LEFT JOIN [BI_Sources].[ClaimsAdmissionsType] CAT ON CAT.ClaimsAdmissionsTypeCode =CTE.Claim_Admission_Type_Code 
	   LEFT JOIN [Mirror].[ClaimsRevenueCodes] CRC ON CRC.ClaimFieldID  =CTE.Product_Revenue_Center_Code 
	   LEFT JOIN [BI_Sources].[ClaimsPatientStatus] CPS ON CPS.ClaimsPatientStatusCode= CTE.Patient_Status_Code
	   LEFT JOIN [BI_Sources].[ClaimsMeasurementUnits] cmu on cmu.MeasurementUnitCode =cte.MeasurementUnit


		
	-- where DAC.AdminCodeKey not in (1834124)    ------------------------------------------------------------------------------------
--                                -- need to remove this condition after fixing Persist dim admincodes duplicate rows , until fixing the duplicate rows we need this condition for CCLF 
		                        ------------------------------------------------------------------------------------ 
ORDER BY 1,2,12,10,3

