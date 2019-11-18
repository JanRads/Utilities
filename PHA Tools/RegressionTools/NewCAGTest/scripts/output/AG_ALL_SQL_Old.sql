
SET NOCOUNT ON
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR;

DECLARE @StartYear DATETIME
	,@date_yearMonth VARCHAR(10)

SELECT @StartYear = cast(YEAR(getdate()) AS VARCHAR) + '0101'
	,@date_yearMonth = cast(datepart(yyyy, getdate()) AS VARCHAR) + '_01'

SELECT PatientKey
,ISNULL(datediff(DAY, Convert(DATETIME, [dbmSemanticAnalyticsSTG].[dbo].[DecryptHR]([BirthDate]), 101), @StartYear),-1)  AgeinDay
INTO #t	
FROM dbmSemanticAnalytics.Dim.Patients

SELECT PatientKey
,AgeGroupDesc
INTO #t2
FROM 
#t T1
INNER JOIN (
	SELECT AgeFK,AgeGroupDesc
	FROM dbmSemanticAnalytics.Dim.AgeGroups AG
	INNER JOIN dbmSemanticAnalytics.Factless.AgeInGroup FL ON AG.AgeGroupKey = FL.GroupFK
		AND AG.HIERARCHYID = 1
	) T2 ON T1.AgeinDay = T2.AgeFK

SELECT AgeGroupDesc
	,cast(round(sum(KPIScore), 3) AS MONEY) AS KPIScore
FROM (
	------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	SELECT MeasureLevel2Key
		,MeasureLevel2Desc
		,MeasureKey
		,MeasureName
		,AgeGroupDesc
		,CASE 
			WHEN ImprovementNotation = 1
				THEN round(cast(cast(SumNum AS MONEY) / cast(SumDnum AS MONEY) AS MONEY), 3)
			WHEN ImprovementNotation = 2
				THEN round(1 - cast(cast(SumNum AS MONEY) / cast(SumDnum AS MONEY) AS MONEY), 3)
			END * KPICombniedWeight AS KPIScore
		,cast(SumNum AS INT) AS Numerator
		,cast(SumDnum AS INT) AS Denominator
		,KPICombniedWeight
	FROM (
		------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		SELECT Num.MeasureLevel2Key
			,Num.MeasureLevel2Desc
			,Num.ImprovementNotation
			,Num.InverseInd
			,Num.MeasureKey
			,Num.MeasureName
			,cast(CASE 
					WHEN Num.InverseInd = 1
						THEN isnull(SumNum, 0.00000000)
					ELSE SumDnum - isnull(SumNum, 0.00000000)
					END AS MONEY) AS SumNum
			,cast(SumDnum AS MONEY) AS SumDnum
			,KPICombniedWeight
			,Num.AgeGroupDesc
		FROM (
			SELECT MD.ImprovementNotation
				,MD.MeasureKey
				,MeasureName
				,InverseInd
				,date_YearMonth
				,attrib_Measure
				,MeasureLevel2Key
				,MeasureLevel2Desc
				,sum(measure_MemberInd) AS SumDnum
				,AgeGroupDesc
			FROM (
				SELECT T1.*
					,T2.AgeGroupDesc
				FROM dbmSemanticAnalytics.fact.PopulationMembersMonthly T1
				INNER JOIN (
					SELECT PatientKey
						,AgeGroupDesc
					FROM #t2 T1
					
					) T2 ON T1.id_Patient = T2.PatientKey
				) P
			LEFT JOIN [dbmSemanticAnalytics].[Dim].[MeasureDefinition] MD ON P.attrib_Measure = MD.MeasureKey
			WHERE date_yearMonth = @date_yearMonth
			GROUP BY MD.ImprovementNotation
				,MD.MeasureKey
				,MeasureName
				,InverseInd
				,date_YearMonth
				,attrib_Measure
				,MeasureLevel2Key
				,MeasureLevel2Desc
				,AgeGroupDesc
			) Num
		FULL OUTER JOIN (
			SELECT MD.ImprovementNotation
				,MD.MeasureKey
				,MeasureName
				,InverseInd
				,date_YearMonth
				,attrib_Measure
				,MeasureLevel1Key
				,MeasureLevel1Desc
				,sum(measure_MemberInd) AS SumNum
				,AgeGroupDesc
			FROM (
				SELECT T1.*
					,T2.AgeGroupDesc
				FROM [dbmSemanticAnalytics].fact.MeasureMembersMonthly T1
				INNER JOIN (
					SELECT PatientKey
						,AgeGroupDesc
					FROM #T2 T1
					
					) T2 ON T1.id_Patient = T2.PatientKey
				) P
			FULL OUTER JOIN [dbmSemanticAnalytics].[Dim].[MeasureDefinition] MD ON P.attrib_Measure = MD.MeasureKey
			WHERE date_yearMonth = @date_yearMonth
			GROUP BY MD.ImprovementNotation
				,MD.MeasureKey
				,MeasureName
				,InverseInd
				,date_YearMonth
				,attrib_Measure
				,MeasureLevel1Key
				,MeasureLevel1Desc
				,AgeGroupDesc
			) DNum ON Num.attrib_Measure = DNum.attrib_Measure
			AND Num.date_YearMonth = DNum.date_YearMonth
			AND Num.AgeGroupDesc = DNum.AgeGroupDesc
		LEFT JOIN (
			SELECT MeasureKey
				,MeasureName
				,[Weight] / CombniedWeight AS KPICombniedWeight
				,Weight
				,CombniedWeight
				,md.MeasureLevel2Key
				,AgeGroupDesc
			FROM [dbmSemanticAnalytics].[Dim].[MeasureDefinition] MD
			LEFT JOIN (
				SELECT MeasureLevel1Key
					,MeasureLevel1Desc
					,sum(CASE 
							WHEN pat_cnt = 0
								THEN 0
							ELSE weight
							END) AS CombniedWeight
					,AgeGroupDesc
				FROM (
					SELECT *
					FROM [dbmSemanticAnalytics].[Dim].[MeasureDefinition]
					) T1
				LEFT JOIN (
					SELECT sum(measure_MemberInd) pat_cnt
						,attrib_Measure
						,AgeGroupDesc
					FROM (
						SELECT T1.*
							,T2.AgeGroupDesc
						FROM dbmSemanticAnalytics.fact.PopulationMembersMonthly T1
						INNER JOIN (
							SELECT PatientKey
								,AgeGroupDesc
							FROM #T2 T1
							
							) T2 ON T1.id_Patient = T2.PatientKey
						) PMM
					GROUP BY attrib_Measure
						,AgeGroupDesc
					) T2 ON T1.MeasureKey = T2.attrib_Measure
				GROUP BY MeasureLevel1Key
					,MeasureLevel1Desc
					,AgeGroupDesc
				) PM ON md.MeasureLevel1Key = PM.MeasureLevel1Key
			) MDW ON Num.MeasureKey = MDW.MeasureKey
			AND num.AgeGroupDesc = MDW.AgeGroupDesc
			------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		) A
		--order by MeasureKey, AgeGroupDesc
	) B
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
GROUP BY AgeGroupDesc
ORDER BY 1

DROP TABLE #T
	DROP TABLE #T2
