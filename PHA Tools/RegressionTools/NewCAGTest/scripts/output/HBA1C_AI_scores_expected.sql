use [dbmSemanticAnalytics]
--expected patients MSSP pnemovax fact-->> fact.activeInd
EXEC [dbmSemanticAnalyticsSTG].dbo.OpenHHR;

select distinct(FAV.id_Patient),62 indicator,
	case when  FAV.date_Visit> PDM.date_Visit then FAV.date_Visit else PDM.date_Visit end  date_visit, FAV.date_Visit/10000 *10000 +1231 end_date
	FROM   fact.AmbulatoryVisits FAV
	inner join [TMP].[PopDiabetesMellitus] PDM
		   ON FAV.id_Patient = PDM.Id_patient and FAV.date_Visit/10000 >= PDM.date_Visit/10000
union
-- should be recheck when claims table created
-- the select as in ActiveIndicatorsTypes HBA1C deunmerator calculation

 select  final.id_Patient, final.Indicator,
	case when min(effectiveYear) > min(date_Visit) then min(effectiveYear) else min(date_Visit) end date_visit ,min(PDM.date_Visit)/10000*10000 +1231 end_date
				  from ( select CN.id_Patient, Indicator, effectiveYear
			 from (SELECT CN.id_patient, 
							11                 AS tableid, 
							Case when [Cn].date_Action = -1 then NULL else [Cn].date_Action end AS effectiveYear, 
							60                AS Indicator 
					   FROM   [dbmSemanticAnalytics].[Fact].Claims AS Cn 
							INNER JOIN (SELECT Va.AdminCodeKey
         FROM [dbmSemanticAnalytics].Factless.ValueSetMapIndicator Va
              INNER JOIN [dbmSemanticAnalytics].[Dim].[ActiveIndicators] ACT ON Va.indicatorId = Act.indicatorId
                                                                            AND [ACT].[IndicatorId] = 60
															 ) AS Va 
								   ON CN.attrib_Claim = Va.admincodekey 
								   )Cn
								   INNER JOIN dbmSemanticAnalyticsSTG.[STG].[tmpfactspatients] tfp
		   ON CN.id_Patient = tfp.PatientKey
		   and tfp.TableID in (3,4,11) 
		   INNER JOIN(  
		   SELECT 	[p].[PatientKey],                                        
					[dbmSemanticAnalyticsSTG].[dbo].[DecryptHR]( p.[BirthDate]) BirthYear                                 
		   FROM [dbmSemanticAnalytics].[Dim].[Patients] AS p ) AS DP 	
		   ON CN.id_Patient = DP.PatientKey   
--		  AND (YEAR(GETDATE()) > 
--		   year([DP].[BirthYear])+ 18 ) 
--		   AND (YEAR(GETDATE()) < 
--		  year([DP].[BirthYear]) + 75)
		  ) final 
		  INNER JOIN dbmSemanticAnalytics.[TMP].[PopDiabetesMellitus] PDM
		   ON final.id_Patient = PDM.Id_patient and YEAR([dbmSemanticAnalyticsSTG].[dbo].[unConvert_Date]( final.[effectiveYear] )) >= YEAR(PDM.date_Visit)
		   group by final.id_Patient, final.Indicator