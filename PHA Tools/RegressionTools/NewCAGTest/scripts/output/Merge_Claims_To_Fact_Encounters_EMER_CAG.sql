  USE [dbmSemanticAnalyticsSTG]
GO
EXEC dbo.OpenHHR



  select distinct PF.id_Encounter [id_Admission],
          PF.id_Patient,
		  PF.AdmissionDateEnc,
		  PC.Current_ClaimID [Original_ClaimID],
		  PF.Flag_Claims,
		  PC.EncounterCodeKey [attrib_Claim_Code_Key]
  from [Persist].[ClaimRevenueCenter] PC
       JOIN [Persist].[ClaimsHeader] PH
	     ON PC.HIC_Number_Bnf = PH.Bnf_HIC_Number and PC.Current_ClaimID = PH.Current_ClaimID
  LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[FactEncounters] PF
    ON PC.id_Patient = PF.id_Patient  
	AND CONVERT(date,[dbo].[DecryptHR](PC.Claim_From_DateENC)) = CONVERT(date,[dbo].[DecryptHR](PF.AdmissionDateEnc)) 
	where  PC.Claim_Type_Code = 60 and ISNUMERIC(PH.Claim_Admission_Type_Code) = 1 and PF.Flag_Claims = 0
	order by 1
