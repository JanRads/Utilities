
	USE [dbmSemanticAnalyticsSTG]
GO
EXEC dbo.OpenHHR
	SELECT Id_LabOrder,
			FLO.id_patient,
			CollectionDateEnc,
			PC.Current_ClaimID Original_ClaimID,
			Flag_Claims,
			ISNULL([LabsClaimBaseLineCodeKey], -1) as LabsClaimBaseLineCodeKey
	FROM [Persist].[ClaimRevenueCenter] PC
		INNER JOIN [Persist].[FactLabsOrders] FLO
		 ON PC.id_Patient = FLO.id_Patient  
		 AND  FLO.[LabsClaimBaseLineCodeKey] = PC.HCPCSCodekey
		 AND CONVERT(date,[dbo].[DecryptHR]([Institutional_Revenue_Center_DateENC]))
		  = CONVERT(date,([CollectionDateEnc]))
		AND PC.Current_ClaimID = FLO.Original_ClaimID
	order by 1