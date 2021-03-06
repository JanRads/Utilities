USE [dbmSemanticAnalyticsSTG]
GO
EXEC dbo.OpenHHR



  select distinct 

   PF.id_Encounter [id_Admission],
   ch.id_Patient,
   PF.AdmissionDateEnc,
   PC.Current_ClaimID [Original_ClaimID],
   isnull (PF.Flag_Claims,0)  Flag_Claims,
	 PC.EncounterCodeKey [attrib_Claim_Code_Key]
  from [Persist].[ClaimRevenueCenter] PC
  Left join [Persist].ClaimsHeader CH
   ON PC.Current_ClaimID = CH.Current_ClaimID and PC.HIC_Number_Bnf = CH.Bnf_HIC_Number
  LEFT JOIN [dbmSemanticAnalyticsSTG].[Persist].[FactEncounters] PF
    ON PC.id_Patient = PF.id_Patient  
	AND CONVERT(date,[dbo].[DecryptHR](PC.Line_From_DateENC)) = CONVERT(date,[dbo].[DecryptHR](PF.AdmissionDateEnc)) 
	where  PC.ClaimsDomainType = 'EncounterInpatients' and  CH.[Claim_Admission_Type_Code] <> '1' and isnull(Flag_Claims,0)=0
	and encountercode=  'imp' 
	--and encountercode= case when ch.ClaimsFormatType like '%837%' then 'imp' end 
	order by 1

