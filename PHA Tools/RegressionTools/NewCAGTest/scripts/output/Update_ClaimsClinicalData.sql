
BEGIN TRANSACTION;

UPDATE [dbmSemanticAnalyticsSTG].[Persist].[ClaimDiagnosis_Code]
SET FlagNew=0

UPDATE [dbmSemanticAnalyticsSTG].[Persist].[ClaimMedication]
SET FlagNew=0

UPDATE [dbmSemanticAnalyticsSTG].[Persist].[ClaimProcedureCode]
SET FlagNew=0

UPDATE [dbmSemanticAnalyticsSTG].[Persist].[ClaimDiagnosis_Code] 
SET Claim_Type_Code_int_NULL=99, FlagNew=1
WHERE Claim_Type_Code_int_NULL=40

UPDATE [dbmSemanticAnalyticsSTG].[Persist].[ClaimMedication]
SET Claim_Dispensing_Status_Code='Q', FlagNew=1
where Claim_Dispensing_Status_Code='C'

UPDATE [dbmSemanticAnalyticsSTG].[Persist].[ClaimProcedureCode]
SET ProcedureCodeKey_ICD=99, FlagNew=1
WHERE ProcedureCodeKey_HCPCS is null

COMMIT;

--SELECT	Current_ClaimID, 
--		--Bnf_HIC_Number, 
--		ID_Claims, 
--		--Diagnosis_Code, 
--		--CodeSystem, 
--		FileName,
--		Claim_Type_Code_int_NULL as Claim_Type_Code, 
--		--Claim_Product_Type_Code, 
--		--Claim_Value_Sequence_Number, 
--		--Bnf_Equitable_BIC_HICN_Number, 
--		--Provider_OSCAR_Number, 
--		Claim_From_Date, 
--		Claim_Thru_Date, 
--		--Claim_Present_on_Admission_Indicator, 
--		ID, 
--		Claim_From_DateENC, 
--		Claim_Thru_DateENC, 
--		ConditionCodeKey, 
--		id_Patient, 
--		FlagNew
--FROM [Persist].[ClaimDiagnosis_Code] 
----where FlagNew=1

--SELECT 
--	Current_ClaimID, 
--	--HIC_Number_Bnf, 
--	ID_Claims, 
--	--[NDC Code], 
--	Claim_Type_Code, 
--	Cast (Claim_Line_From_Date as int) Claim_From_Date, 
--	--CodeSystem, 
--	--Provider_Service_ID_QLFYR_Code, 
--	--Claim_Service_Provider_GNRC_ID_NUM, 
--	Claim_Dispensing_Status_Code , 
--	--Claim_DAW_Product_Selection_Code, 
--	--Claim_Line_Service_Unit_Quantity, 
--	--Claim_Line_Days_Supply_Quantity, 
--	--Provider_Prescribing_ID_Qualifier_Code, 
--	--Claim_Prescribing_Provider_Generic_ID_Number, 
--	--Claim_Line_Bnf_Payment_Amount, 
--	--Claim_Adjustment_Type_Code, 
--	Claim_Effective_Date, 
--	--Claim_IDR_Load_Date, 
--	--Claim_Line_Prescription_Service, 
--	--Claim_Line_Prescription_Fill_Number, 
--	ID, 
--	Claim_Line_From_DateENC, 
--	Claim_Effective_DateENC, 
--	--Claim_IDR_Load_DateENC, 
--	FileName, 
--	FlagNew, 
--	AdminCodeKey, 
--	id_Patient
--	--Patient_Root
--FROM [Persist].[ClaimMedication]
----WHERE [FlagNew] = 1

--SELECT 
--	Current_ClaimID, 
--	--Bnf_HIC_Number, 
--	ID_Claims, 
--	--Procedure_Code, 
--	--CodeSystem, 
--	FileName, 
--	--Procedure_Performed_Date, 
--	ID, 
--	FlagNew, 
--	Claim_Type_Code, 
--	--Claim_Value_Sequence_Number, 
--	--Bnf_Equitable_BIC_HICN_Number, 
--	--Provider_OSCAR_Number, 
--	Claim_From_Date, 
--	Claim_Thru_Date, 
--	--Procedure_Performed_DateEnc, 
--	Claim_From_DateENC, 
--	Claim_Thru_DateENC, 
--	ProcedureCodeKey_ICD, 
--	ProcedureCodeKey_HCPCS, 
--	id_Patient 
--	--Patient_Root	
--FROM [Persist].[ClaimProcedureCode]
----WHERE [FlagNew] = 1

--SELECT *
--FROM INFORMATION_SCHEMA.COLUMNS
--WHERE  TABLE_SCHEMA = 'Persist'
--AND TABLE_NAME = 'ClaimMedication'
--AND COLUMN_NAME = 'Claim_Dispensing_Status_Code'
