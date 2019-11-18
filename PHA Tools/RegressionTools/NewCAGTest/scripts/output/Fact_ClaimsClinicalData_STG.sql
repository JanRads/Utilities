--Expected 

USE [dbmSemanticAnalyticsSTG]
GO

EXEC dbo.OpenHHR
GO

with CTE
AS
(
SELECT
'Undefined' as Medication_Claim_Line_Service_Unit_Quantity,  
 null as Procedure_Performed_DateEnc , 
 null as ProcedureCodeKey_HCPCS,
	cdc.ClaimsFormatType 
		,CDC.Current_ClaimID,

		year([dbo].[DecryptHR](CDC.Claim_From_DateENC))*10000+Month([dbo].[DecryptHR](CDC.Claim_From_DateENC))*100+01 	AS Claim_From_Date, 
		year([dbo].[DecryptHR](CDC.Claim_Thru_DateENC))*10000+Month([dbo].[DecryptHR](CDC.Claim_Thru_DateENC))*100+01 	AS Claim_Thru_Date, 
	case  when cdc.Diagnosis_Code =ch.Principal_Diagnosis_Code then 'Principal Diagnosis'
	else 'other Diagnosis'
	end  as FileName,
		CDC.Claim_From_DateENC, 
		CDC.Claim_Thru_DateENC, 
		CDC.ID,
		CDC.[ConditionCodeKey] /*ConditionCodeKey*/ as ClaimActClinicalCode,
		Patient.PatientKey [id_Patient],
		CDC.Claim_Type_Code_int_NULL as Claim_Type_Code,
		'-1' as DispenseQuantityNum,
		null as Medication,
		cdc.ID_Claims 
		
FROM  [dbmSemanticAnalyticsSTG].Persist.[ClaimDiagnosis_Code]  CDC

LEFT JOIN [Persist].[MappingPatient] Patient
       ON CDC.Bnf_HIC_Number=Patient.Id_Extension and CDC.Patient_Root = Patient.Id_Root
lEFT join (
	    SELECT *
		FROM [dbmSemanticAnalyticsSTG].[Persist].[DimAdminCodes] 
		where CodeSystemName like 'icd%' 
		and DimName like 'Conditions' 
		) as DAC
		ON DAC.Code=CDC.Diagnosis_Code
			left join [Persist].[ClaimsHeader] CH
on CDC.[Current_ClaimID]=CH.[Current_ClaimID] and  CDC.Diagnosis_Code=CH.Principal_Diagnosis_Code
		
--where FlagNew=1



UNION all
SELECT 
'Undefined' as Medication_Claim_Line_Service_Unit_Quantity, 
cpc.Procedure_Performed_DateEnc ,
cpc.ProcedureCodeKey_HCPCS as ProcedureCodeKey_HCPCS
,cpc.ClaimsFormatType  
	,CPC.Current_ClaimID,
	year([dbo].[DecryptHR](CPC.Claim_From_DateENC))*10000+Month([dbo].[DecryptHR](CPC.Claim_From_DateENC))*100+01 	AS Claim_From_Date, 
	year([dbo].[DecryptHR](CPC.Claim_Thru_DateENC))*10000+Month([dbo].[DecryptHR](CPC.Claim_Thru_DateENC))*100+01 	AS Claim_Thru_Date, 
	'Procedure' as FileName, 
	CPC.Claim_From_DateENC,
	CPC.Claim_Thru_DateENC, 
	CPC.ID, 
	DAC.AdminCodeKey /*AdminCodeKeyICD*/ AS ProcedureCodeKey_ICD,
	Patient.PatientKey /*PatientKey*/ as id_Patient,
	CPC.Claim_Type_Code, 
	'-1' as DispenseQuantityNum,
	null as Medication,
CPC.ID_Claims
FROM [dbmSemanticAnalyticsSTG].Persist.[ClaimProcedureCode] CPC

left join (
	    SELECT *
		FROM [dbmSemanticAnalyticsSTG].[Persist].[DimAdminCodes] 
		where CodeSystemName like 'icd%' 
		and DimName like 'Procedures' 
		) AS DAC
		ON CPC.Procedure_Code=DAC.Code

JOIN [Persist].[MappingPatient] Patient
       ON CPC.[Bnf_HIC_Number]=Patient.Id_Extension and CPC.Patient_Root = Patient.Id_Root	
--WHERE [FlagNew] = 1




UNION all
SELECT distinct
cm.Claim_Line_Service_Unit_Quantity as Medication_Claim_Line_Service_Unit_Quantity, 
null as [Procedure_Performed_DateEnc],
 null as ProcedureCodeKey_HCPCS,
CM.ClaimsFormatType 
	,CM.Current_ClaimID,
	isnull(year([dbo].[DecryptHR](cm.Claim_Line_From_DateENC ))*10000+Month([dbo].[DecryptHR](cm.Claim_line_From_DateENC))*100+01,19900101) AS Claim_From_Date,
	cm.Claim_Effective_DateENC  as Claim_Thru_Date,
	'Medication' as FileName,
	case when ch.ClaimsFormatType like '%837%' then date_Claim_From_DateENC else cm.Claim_Line_From_DateENC end  as Claim_From_DateENC,
		CASE
	    When CM.ClaimsFormatType = 'CCLFmed'
		Then (select [ValueEnc] from Config.DefaultValues where ID=2) --Max Date
		ELSE CH.Claim_Thru_DateENC
		END as Claim_thru_DateENC,
	CM.ID,
	null,
	Patient.PatientKey /*PatientKey*/ as id_Patient,
	CM.Claim_Type_Code, 
	CM.Claim_Dispensing_Status_Code, 
	---1 as ClaimDate,
	Dac.AdminCodeKey Medication,
   Cm.ID_Claims
FROM [dbmSemanticAnalyticsSTG].Persist.[ClaimMedication] CM
LEFT JOIN [dbmSemanticAnalytics].[Fact].[ClaimsClinicalData] AS CCD
		ON CM.Current_ClaimID = CCD.Original_ClaimID AND CM.AdminCodeKey = CCD.attrib_Medication 
left   join (
	    SELECT *
		FROM [Persist].[DimAdminCodes] 
		where CodeSystemName like '%NDC%'  
		AND DimName = 'Medications'
		) AS DAC
		ON CM.[NDC Code]=DAC.Code
JOIN [Persist].[MappingPatient] Patient
    ON CM.[HIC_Number_Bnf]=Patient.Id_Extension and Patient.Id_Root = Patient.Id_Root
	left join [Persist].[ClaimsHeader] CH
on CM.[Current_ClaimID]=CH.[Current_ClaimID] and CM.id_Patient = CH.id_Patient	


----WHERE [FlagNew] = 1
)




select 
		
		CTE.id_Patient,
		isnull(PR.org_RelatedProvider,-1) as org_Assigned,
		isnull(PR.provider_related,-1) as provider_Performer,		
		isnull((DCP.PayerKey),-1) as attrib_ClaimPrimaryPayerCode,
		isnull(CTE.Claim_Type_Code,-1) as attrib_ClaimTypeCode,
		isnull(CTE.ClaimActClinicalCode,-1) as attrib_ClaimActClinicalCode,
		isnull ([CTE].ProcedureCodeKey_HCPCS,-1)  as [attrib_HCPCS_Code],
		isnull(CTE.Medication,-1) as attrib_Medication,
	------	isnull(CTE.Claim_From_Date,-1) as date_Claim_From_Date, ------- problem with some of the digagnosis 
		--------isnull(CTE.Claim_Thru_Date,-1) as date_Claim_Thru_Date, --------problem with some of the digagnosis
		isnull(CTE.Claim_From_DateENC,-1) as date_Claim_From_DateENC, 
		isnull(CTE.Claim_Thru_DateENC,-1) as date_Claim_Thru_DateENC, 
		isnull(CTE.DispenseQuantityNum,-1) as measure_DispenseQuantityNum,
		isnull(CTE.Current_ClaimID,-1) as Original_ClaimID, 
		 CTE.FileName ClaimSource
	  --,[Bookmark]
      --,[Timestamp]
		, isnull(CH.BillingProviderName,'Undefined') [Attrib_BillingProviderName]
        , isnull( bstp1.ClaimsProviderTaxonomyDesc ,'Undefined')[Attrib_BillingProviderTaxonomy]
        , bsr.ClaimRelationCode [Attrib_PrimaryPayerRelationshipToPersonInsured]
        ,isnull(CH.AttendingProviderName,'Undefined') [Attrib_AttendingProviderName]
        , isnull(bstp2 .ClaimsProviderTaxonomyDesc,'Undefined') [Attrib_AttendingProviderTaxonomy]
		 , cte.[Procedure_Performed_DateEnc]
     ,cte.[Medication_Claim_Line_Service_Unit_Quantity]


 
from CTE left join  [dbo].[Config_Claims_Sources] ccs on ccs.[Claims Source] =CTE.ClaimsFormatType
LEFT JOIN (Select 	
[Current_ClaimID] ,[id_Patient]
	,[BillingProviderTaxonomyCode]
	,[BillingProviderName]
	,[PayerResponsibility]
	,[PatientRelationshipToPersonInsured]
	,[AttendingProviderName]
	,[AttendingProviderTaxonomyCode]
	,Principal_Diagnosis_Code
,[attrib_Claim_Payer_Code]=case when ClaimsFormatType like '%CCLF%' 
then coalesce(Claim_NCH_Primary_Payer_Code,'Undefined')
else [PayerIdentificationCode]
end 
From [Persist].[ClaimsHeader]) CH
	ON CH.Current_ClaimID = CTE.Current_ClaimID
	AND CH.id_Patient = CTE.id_Patient
	left join  [Persist].[DimClaimPayer] DCP on ccs.Root =dcp.PayerClaims_Root  and ch.attrib_Claim_Payer_Code = dcp.PayerClaims_Ext 
	  	   LEFT JOIN  [BI_Sources].[ClaimsProviderTaxonomy]bstp1 ON bstp1.ClaimsProviderTaxonomyCode=CH.BillingProviderTaxonomyCode
	    LEFT JOIN  [BI_Sources].[ClaimsRelations]bsr ON bsr.ClaimRelationCode=CH.PatientRelationshipToPersonInsured
		 LEFT JOIN  [BI_Sources].[ClaimsProviderTaxonomy]bstp2 ON bstp2.ClaimsProviderTaxonomyCode=CH.AttendingProviderTaxonomyCode
--LEFT join   [dbmSemanticAnalytics].[Factless].[PatientRelationsFromTo] PR
LEFT JOIN [STG].[Pre_ClaimClinicalDataPatientsRelation] as PR
	ON PR.id_Patient = CTE.id_Patient 
	AND CTE.ID_Claims=PR.id_Claim


	where CTE.id_Patient not like 173 ---------need to remove this condition 
order by 1,12,5,6,8,9,3,4


