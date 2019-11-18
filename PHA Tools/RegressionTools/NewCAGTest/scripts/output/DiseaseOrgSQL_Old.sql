-- Avishag 
/*pcp for all the measures*/
with pcp as
(SELECT distinct
		MeasureLevel2Key,
		MeasureLevel2Desc,
		MeasureKey,
		pcp.org_RelatedProvider
		FROM [dbmSemanticAnalytics].[Dim].[MeasureDefinition]
		cross join  [dbmSemanticAnalytics].[Factless].[PopulationPCPOrg] pcp
)

/*weight for all the measures*/

, MDW as
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

/*denominator and numerator */
, dnum_num as
(
		select 
		  pcp.MeasureLevel2Key,
		  pcp.MeasureLevel2Desc, -- disease
		  mdw.ImprovementNotation, -- if 1 measure up means good, 2 measue up means bad
		  MDW.InverseInd, -- if 1: x, 2: 1-x
		  pcp.MeasureKey, -- measure
		  pcp.org_RelatedProvider,
		  SumNum, --SumDnum,
		  CAST(SumDnum AS money) AS SumDnum,
		  Weight,
		  isnull(sum(case when SumDnum is null then Weight end) over (partition by pcp.MeasureLevel2Key,pcp.org_RelatedProvider),0.0000000000000) null_weight_sums,
		  DiseaseWeight total
		  from pcp left outer join 
		  MDW on mdw.MeasureKey = pcp.MeasureKey
		  left outer join 
		  (
						select  
								dnum.attrib_Measure,
								dnum.org_RelatedProvider,
								dnum.SumDnum,
								num.SumNum
						from 
						(
								/*calculation denominator */
								  SELECT 
								 
								  p.attrib_Measure,
								  pcp.org_RelatedProvider,
								  SUM(measure_MemberInd) AS SumDnum
								  FROM  [dbmSemanticAnalytics].fact.PopulationMembersMonthly P
								  left join [dbmSemanticAnalytics].[Factless].[PopulationPCPOrg] pcp
								  on p.id_PopulationMember = pcp.id_PopulationMember
								  where  date_yearMonth = CAST(DATEPART(yyyy, GETDATE()) AS varchar) + '_01'
								  
								  group by p.attrib_Measure, pcp.org_RelatedProvider
								  --order by org_RelatedProvider
						) dNum
							
						left JOIN 

						(
								/*calculation numerator */
								SELECT 
								 
								  p.attrib_Measure,
								  pcp.org_RelatedProvider,
								  SUM(measure_MemberInd) AS SumNum
								  FROM  [dbmSemanticAnalytics].fact.MeasureMembersMonthly p
								  left join [dbmSemanticAnalytics].[Factless].[PopulationPCPOrg] pcp
								  on p.id_PopulationMember = pcp.id_PopulationMember
								  where date_yearMonth = CAST(DATEPART(yyyy, GETDATE()) AS varchar) + '_01'
								  
								  group by p.attrib_Measure, pcp.org_RelatedProvider
								  --order by org_RelatedProvider
						  ) Num
						  ON DNum.attrib_Measure = Num.attrib_Measure
						   and dnum.org_RelatedProvider = num.org_RelatedProvider
		  ) q

		  on q.attrib_Measure = pcp.MeasureKey 
		   and pcp.org_RelatedProvider = q.org_RelatedProvider
		   and mdw.MeasureKey = q.attrib_Measure
		   
  )

/*sum new weights with ratio nulls' weight per measurekey + orgProvider*/
, w as
(
	
		select dnum_num.*,
			case when SumDnum is not null then 
			Weight + ((Weight/(total-dnum_num.null_weight_sums))*dnum_num.null_weight_sums)
			end / dnum_num.total
			weight_new 
		from dnum_num
)

/*calculation KPI scorses*/

, final as
(
  SELECT
  MeasureLevel2Key,
  MeasureLevel2Desc,
  org_RelatedProvider,
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

/*sum KPI scores*/

 , calc as

  (SELECT
  MeasureLevel2Key,
  MeasureLevel2Desc,
  org_RelatedProvider,
  round(sum(KPIScore),4) * 100 AS KPIScore,
  NULL AS Numerator
  from final 
  GROUP BY MeasureLevel2Key,
           MeasureLevel2Desc, 
		   org_RelatedProvider
  )

SELECT
  calc.MeasureLevel2Desc,
	calc.org_RelatedProvider,
		format(calc.KPIScore,'N4') KPIScore
FROM calc
where kpiscore is not null
     
ORDER BY MeasureLevel2Desc, org_RelatedProvider asc
  
