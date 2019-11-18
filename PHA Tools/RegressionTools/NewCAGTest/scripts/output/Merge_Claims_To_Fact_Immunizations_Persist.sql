--expected

USE [dbmSemanticAnalyticsSTG]
GO

EXEC dbo.OpenHHR
;

with CTE
as
(
select	Id_Immunization, ImmunizationId_Root, ImmunizationId_Extension, SourceSystemId_Root, SourceSystemid_Extension, PatientId_Root, PatientId_Extension, 
                         EncounterId_Root, EncounterId_Extension, MedicationClassIndicator, AssignedOrgId_Root, AssignedOrgId_Extension, MoodCode, MoodCodeSystem, 
                         ImmunizationName, ImmunizationDescription, ManufactureName, Quantity_value, Quantity_unitCode, Quantity_unitCodeSystem, Quantity_conversion, 
                         ImmunizationCode, ImmunizationCodeSystem, NegationInd, ImmunizationText, StatusCode, StatusCodeSystem, ActivityTime, StartDate, EndDate, RouteCode, 
                         RouteCodeSystem, ApproachSiteCode, ApproachSiteCodeSystem, DoseConversion, DoseValue, DoseUnitCode, DoseUnitCodeSystem, FormCode, FormCodeSystem, 
                         ReasonText, ReasonCode, ReasonCodeSystem, Material_lotNumberText, Material_expirationTime, PFI.dbmAvailabilityTime, DeleteKey, LastUpdated, 
                         AuthorCodeProvider_Extension, AuthorCodeProvider_Root, PerformerCodeProvider_Extension, PerformerCodeProvider_Root, ReferringCodeProvider_Extension, 
                         ReferringCodeProvider_Root, PerformerTypeIndicator, TypeCode, TypeCodeSystem, PFI.FlagDelete, PFI.FlagNew, ImmunizationStartDateEnc, ImmunizationEndDateEnc, 
                         Immunization_CodeKey, ID_Claims, ImmunizationsClaimCodeKey, id_Patient, Original_ClaimID, FileName, Flag_Claims,
		PADMINCODE.BaselineCode,
		PADMINCODE.BaselineCodeSystem
from Persist.FactImmunizations PFI
left JOIN  Persist.DimAdminCodes PADMINCODE
		  on PFI.ImmunizationsClaimCodeKey = PADMINCODE.AdminCodeKey 
)


  SELECT	C.Id_Immunization Id_Immunization
	        ,PFI.id_Patient 
			,PFI.ImmunizationsClaimCodeKey
			,PFI.Immunization_CodeKey [attrib_ImmunizationCode]
			,PFI.ImmunizationStartDateEnc ImmunizationStartDateEnc
			,PFI.ImmunizationEndDateEnc ImmunizationEndDateEnc
			,PFI.Original_ClaimID [Original_ClaimID]
			,C.[Flag_Claims]
  FROM [Persist].FactImmunizations PFI
		left JOIN  Persist.DimAdminCodes PADMINCODE
			  on PFI.Immunization_CodeKey = PADMINCODE.AdminCodeKey 
		INNER JOIN  CTE C
				ON PFI.id_Patient = C.id_Patient
			 AND
			   PADMINCODE.BaselineCode = C.BaselineCode AND PADMINCODE.BaselineCodeSystem = C.BaselineCodeSystem
  where  PFI.[Original_ClaimID] <> -1 
		 AND                            
		 C.Flag_Claims = 0                     
  order by 1
  
  