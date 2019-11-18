-- Avishag 
/*calculation weight for Diseases and measures*/

with MDW as
(
							SELECT distinct
							MeasureLevel2Key,
							MeasureLevel2Desc,
							MeasureKey,
							[Weight],
							ImprovementNotation, InverseInd,
							SUM(weight) over (partition by MeasureLevel2Key,MeasureLevel2Desc) AS DiseaseWeight
							FROM [dbmSemanticAnalytics].[Dim].[MeasureDefinition]
)

/*dnums and nums*/
, dnum_num as
(
		select 
		  mdw.MeasureLevel2Key,
		  mdw.MeasureLevel2Desc, -- disease
		  MDW.ImprovementNotation, -- if 1 measure up means good, 2 measue up means bad
		  MDW.InverseInd, -- if 1: x, 2: 1-x
		  mdw.MeasureKey, -- measure
		  SumNum,
		  CAST(SumDnum AS money) AS SumDnum,
		  Weight,
		  isnull(sum(case when SumDnum is null then Weight end) over (partition by mdw.MeasureLevel2Key),0.0000000000000) null_weight_sums
		  ,DiseaseWeight total
		from MDW left join 
		
		
		(
				/*calculation denominator */
				  SELECT 
				  p.attrib_Measure,
				  SUM(measure_MemberInd) AS SumDnum
				  FROM  [dbmSemanticAnalytics].fact.PopulationMembersMonthly P
				  where  date_yearMonth = CAST(DATEPART(yyyy, GETDATE()) AS varchar) + '_01'
				  group by p.attrib_Measure
		) Num
		
		on num.attrib_Measure = mdw.MeasureKey			
		left JOIN 

		(
				/*calculation numerator */
				SELECT  
				  p.attrib_Measure,
				  SUM(measure_MemberInd) AS SumNum
				  FROM  [dbmSemanticAnalytics].fact.MeasureMembersMonthly p
				  where date_yearMonth = CAST(DATEPART(yyyy, GETDATE()) AS varchar) + '_01'
				  group by p.attrib_Measure
		  ) DNum
		   ON DNum.attrib_Measure = mdw.MeasureKey
  


)


, w as
(
	
		select dnum_num.*,
			case when SumDnum is not null then 
			Weight + ((Weight/(total-dnum_num.null_weight_sums))*dnum_num.null_weight_sums)
			end / dnum_num.total
			weight_new 
		from dnum_num
)

--select * from w

, final as
(
  SELECT
  MeasureLevel2Key,
  MeasureLevel2Desc,
  MeasureKey,
  weight_new,
  (CASE
    WHEN InverseInd + ImprovementNotation = 2 THEN isnull(SumNum / SumDnum, 0.000000000)
    ELSE 1 - isnull((SumNum / SumDnum), 0.00000000)
  END)  AS CHECKING,
  (CASE
    WHEN InverseInd + ImprovementNotation = 2 THEN isnull(SumNum / SumDnum, 0.000000000)
    ELSE 1 - isnull((SumNum / SumDnum), 0.00000000)
  END) * weight_new AS KPIScore,
  ImprovementNotation,
  InverseInd,
  CAST(SumNum AS int) AS Numerator,
  CAST(SumDnum AS int) AS Denominator

  from w 
)


  , combined_cte as
( 
 SELECT
  [dbmSemanticAnalytics].Dim.MeasureDefinition.MeasureLevel2Desc,
  COUNT(DISTINCT [dbmSemanticAnalytics].Fact.populationMembersMonthly.id_Patient) AS combined
		FROM [dbmSemanticAnalytics].Fact.populationMembersMonthly
		INNER JOIN [dbmSemanticAnalytics].Dim.MeasureDefinition
		ON [dbmSemanticAnalytics].Fact.populationMembersMonthly.attrib_Measure = [dbmSemanticAnalytics].Dim.MeasureDefinition.MeasureKey
WHERE date_yearMonth = CAST(DATEPART(yyyy, GETDATE()) AS varchar) + '_01'
GROUP BY [dbmSemanticAnalytics].Dim.MeasureDefinition.MeasureLevel2Desc
)

, calc as

  (SELECT
  MeasureLevel2Key,
  MeasureLevel2Desc,
  floor(sum(KPIScore) * 100) AS KPIScore,
  NULL AS Numerator
  from final 
  GROUP BY MeasureLevel2Key,
           MeasureLevel2Desc
  )

SELECT
  calc.*,
  combined_cte.combined AS Denominator
FROM calc,
     combined_cte
WHERE combined_cte.MeasureLevel2Desc = calc.MeasureLevel2Desc

ORDER BY MeasureLevel2Key asc
  
