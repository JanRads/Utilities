/****** Script for SelectTopNRows command from SSMS  ******/
USE [dbmSemanticAnalyticsSTG]
SELECT  [Current_ClaimID]
--      ,[Bnf_HIC_Number]
--      ,[FlagNew]
--      ,[ID_Claims]
--      ,[Admitting_Diagnosis_Code]
--      ,[CodeSystem]
--      ,[FileName]
--      ,[Claim_Effective_Date]
--      ,[Provider_OSCAR_Number]
--      ,[Claim_Type_Code]
--      ,[Claim_From_Date]
--      ,[Claim_Thru_Date]
--      ,[Claim_Bill_Facility_Type_Code]
--      ,[Claim_Bill_Class_Code]
--      ,[Principal_Diagnosis_Code]
--      ,[Claim_Medicare_Non_Payment_Code]
--      ,[Claim_NCH_Primary_Payer_Code]
--      ,[Federal_Info_Proc_Standards_Code]
--      ,[Bnf_Patient_Status_Code]
--      ,[Diagnosis_Related_Group_Code]
--      ,[Outpatient_Service_Type_Code]
--      ,[Operating_P_NPI_Number]
--      ,[Attending_P_NPI_Number]
--      ,[Other_P_NPI_Number]
--      ,[Claim_Adjustment_Type_Code]
--      ,[Claim_IDR_Load_Date]
--      ,[Bnf_Equitable_BIC_HICN_Number]
--      ,[Claim_Admission_Type_Code]
--      ,[Claim_Admission_Source_Code]
--      ,[Claim_Query_Code]
--      ,[ID]
--      ,[Claim_Effective_DateENC]
--      ,[Claim_From_DateENC]
--      ,[Claim_Thru_DateENC]
--      ,[id_Patient]
--      ,[Patient_Root]
--      ,[ConditionCodeKey]
--      ,[BillingProviderTaxonomyCode]
--      ,[BillingProviderName]
--      ,[BillingProviderIDCode]
--      ,[PayerResponsibility]
--      ,[PatientRelationshipToPersonInsured]
--      ,[PayerName]
--      ,[PayerIdentificationCode]
--      ,[OriginalFileName]
--      ,[AttendingProviderName]
--      ,[AttendingProviderTaxonomyCode]
--      ,[ClaimsFormatType]
--      ,[AttendingProviderIdentificationCode]
--      ,[ClaimFrequencyCode]
--      ,[Claim_Admission_Date]
--      ,[Claim_Admission_DateENC]
--      ,[DeleteKey]
--      ,[Claim_Discharge_Date]
--      ,[Claim_Discharge_DateENC]
      ,cast(case when ClaimsFormatType like '%837%' then ClaimChargeAmount else ClaimPayerPaidAmount end as decimal(10,2))[TotalClaimChargeAmount]
  --    ,[PlaceOfServiceCode]
  --    ,[ClaimPayerPaidAmount]
  --    ,[FacilityProvider]
  FROM [dbmSemanticAnalyticsSTG].[Persist].[ClaimsHeader]
  order by 1


