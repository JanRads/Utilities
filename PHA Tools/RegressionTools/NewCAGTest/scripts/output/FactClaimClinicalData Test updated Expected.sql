--Expected 

with CTE
AS
(
 
SELECT	Current_ClaimID,
		Claim_From_Date,
		Claim_Thru_Date,
		FileName,
		Claim_From_DateENC, 
		Claim_Thru_DateENC, 
		ID, 
		ConditionCodeKey as ClaimActClinicalCode,
		id_Patient, 
		Claim_Type_Code_int_NULL as Claim_Type_Code, 
		null as DispenseQuantityNum,
		null as medication,
		ID_Claims as id_Claim
		--FlagNew
FROM [dbmSemanticAnalyticsSTG].[Persist].[ClaimDiagnosis_Code] 

UNION

SELECT 
	Current_ClaimID, 
	Claim_From_Date, 
	Claim_Thru_Date,  
	FileName, 
	Claim_From_DateENC, 
	Claim_Thru_DateENC, 
	ID, 
	ProcedureCodeKey_ICD as ClaimActClinicalCode,
	id_Patient,
	Claim_Type_Code, 
	'-1' as DispenseQuantityNum,
	null as Medication,
	ID_Claims as id_Claim
FROM [dbmSemanticAnalyticsSTG].[Persist].[ClaimProcedureCode]

UNION

SELECT 
	Current_ClaimID, 
	Cast (Claim_Line_From_Date as int) Claim_From_Date, 
	null as Claim_Thru_Date,
	FileName, 
	Claim_Line_From_DateENC as Claim_From_DateENC, 
	null as Claim_Thru_DateENC,
	ID, 
	null as ClaimActClinicalCode,
	id_Patient,
	Claim_Type_Code, 
	Claim_Dispensing_Status_Code , 
	null as Medication,
	ID_Claims as id_Claim
--	FlagNew, 
--	AdminCodeKey
FROM [dbmSemanticAnalyticsSTG].[Persist].[ClaimMedication]

)

select 
		
		CTE.id_Patient,
		isnull(PR.org_RelatedProvider,-1) as org_Assigned,
		isnull(PR.provider_related,-1) as provider_Performer,		
		isnull(PR.id_Programs,-1) as payer,
		isnull(CTE.Claim_Type_Code,-1) as attrib_ClaimTypeCode,
		isnull(CTE.ClaimActClinicalCode,-1) as attrib_ClaimActClinicalCode,
		isnull(CTE.Medication,-1) as attrib_Medication,
		isnull(CTE.Claim_From_Date,-1) as date_Claim_From_Date, 
		isnull(CTE.Claim_Thru_Date,-1) as date_Claim_Thru_Date, 
		isnull(CTE.Claim_From_DateENC,-1) as date_Claim_From_DateENC, 
		isnull(CTE.Claim_Thru_DateENC,-1) as date_Claim_Thru_DateENC, 
		isnull(CTE.DispenseQuantityNum,-1) as measure_DispenseQuantityNum,
		isnull(CTE.Current_ClaimID,-1) as Original_ClaimID, 
		CTE.FileName as ClaimSource

from CTE
LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[ClaimsHeader] CH
	ON CH.Current_ClaimID = CTE.Current_ClaimID
	AND CH.id_Patient = CTE.id_Patient
--LEFT join   [dbmSemanticAnalytics].[Factless].[PatientRelationsFromTo] PR
LEFT JOIN [dbmSemanticAnalyticsSTG].[STG].[Pre_ClaimClinicalDataPatientsRelation] as PR
	ON PR.id_Patient = CTE.id_Patient 
	AND CTE.id_Claim=PR.id_Claim
LEFT JOIN [dbmSemanticAnalytics].[Dim].[ClaimsPrimaryPayer] CPP
	ON CASE WHEN (LEN(ltrim(rtrim(CH.Claim_NCH_Primary_Payer_Code)))=0 ) 
	THEN '0' ELSE CH.Claim_NCH_Primary_Payer_Code END = CPP.PrimaryPayerCode
order by [id_Patient], [Original_ClaimID]




