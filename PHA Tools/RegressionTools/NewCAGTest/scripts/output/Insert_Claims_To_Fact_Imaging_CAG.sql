USE [dbmSemanticAnalyticsSTG]
GO
EXEC dbo.OpenHHR



	SELECT [id_Imaging],
			FI.[id_Patient],
			[ImagingStudy_EffectiveDateEnc],
			PC.Current_ClaimID [Original_ClaimID],
			[Flag_Claims],
			ISNULL([ImagingClaimCodeKey], -1) as [ImagingClaimCodeKey]
	FROM [Persist].[ClaimRevenueCenter] PC
		INNER JOIN [Persist].[FactImaging] FI
		 ON PC.id_Patient = FI.id_Patient  
		 AND  FI.ImagingStudy_Code = PC.HCPCS_Code
		 AND CONVERT(date,[dbo].[DecryptHR]([Institutional_Revenue_Center_DateENC]))
		  = CONVERT(date,[dbo].[DecryptHR]([ImagingStudy_EffectiveDateEnc]))
		AND PC.Current_ClaimID = FI.Original_ClaimID and Flag_Claims = 1
	order by 1

