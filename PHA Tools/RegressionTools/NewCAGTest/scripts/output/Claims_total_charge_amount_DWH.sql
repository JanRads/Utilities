/****** Script for SelectTopNRows command from SSMS  ******/
USE [dbmSemanticAnalytics]
SELECT 
      [Original_ClaimID]
      --,[Claim_Line_Number]
      --,[id_Patient]
      --,[org_Assigned]
      --,[provider_Performer]
      --,[Id_Program]
      --,[Line_From_Date]
      --,[Line_Thru_Date]
      --,[Claim_From_Date]
      --,[Claim_Thru_Date]
      --,[Line_From_DateENC]
      --,[Line_Thru_DateENC]
      --,[Claim_From_DateENC]
      --,[Claim_Thru_DateENC]
      --,[attrib_Claim_Type_Code]
      --,[attrib_Claim]
      --,[attrib_PatientAge]
      --,[attrib_ClaimPrimaryPayerCode]
      --,[measure_ClaimLinePayerPaidAmount]
      --,[Timestamp]
      --,[Attrib_BillingProviderName]
      --,[Attrib_BillingProviderTaxonomy]
      --,[Attrib_PatientRelationshipToPersonInsured]
      --,[Attrib_AttendingProviderName]
      --,[Attrib_AttendingProviderTaxonomy]
      --,[Attrib_RenderingProviderName]
      --,[Attrib_RenderingProviderTaxonomy]
      --,[Attrib_SupervisingProviderName]
      --,[Attrib_FacilityProvider]
      --,[measure_ClaimChargeAmount]
      --,[attrib_TypeOfFacility]
      --,[attrib_PlaceOfService]
      --,[attrib_ClaimFrequencyType]
      --,[date_AdmissionDate]
      --,[attrib_AdmissionType]
      --,[date_DischargeDate]
      --,[attrib_RevenueCodeDescription]
     , sum (case when attrib_ClaimsFormatType like '%837%' then measure_ClaimLineChargeAmount else measure_ClaimLinePayerPaidAmount end) TotalCargeAmount
      --,[measure_ClaimPayerPaidAmount]
      --,[Claim_Admission_DateENC]
      --,[Claim_Discharge_DateENC]
      --,[attrib_PatientStatus]
      --,[Line_Service_Unit_Quantity]
      --,[MeasurementUnit]
      --,[attrib_ClaimsFormatType]
  FROM [dbmSemanticAnalytics].[Fact].[ClaimsLines]
 where case when attrib_ClaimsFormatType like '%837%' then measure_ClaimChargeAmount else  [measure_ClaimPayerPaidAmount]  end is not null
  group by [Original_ClaimID]
  order by 1

