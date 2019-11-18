with cte1 
as
(
SELECT A.Id_Patient
	,Severity_Score = CASE 
		WHEN Sum(A.measure_IndicatorInd) BETWEEN 0
				AND 1
			THEN 1
		WHEN Sum(A.measure_IndicatorInd) BETWEEN 2
				AND 3
			THEN 2
		WHEN Sum(A.measure_IndicatorInd) BETWEEN 4
				AND 5
			THEN 3
		WHEN Sum(A.measure_IndicatorInd) BETWEEN 6
				AND 17
			THEN 4
		END
	,SUM(Ai.[IndicatorClass]) comb_id
	,'MCC Score' ScoreType
	,1 ScoreTypeId
	,A.MonthYear
	,NULL date_Score
	,1 measure_IndicatorInd
	,A.Year
	,1 FlagNew
	,Null id_indexadmission 
FROM (
	SELECT DISTINCT AIN.Id_Patient
		,AIN.IndicatorId
		,AIN.measure_IndicatorInd
		,D.MonthYear
		,D.Year
	FROM Fact.ActiveIndicator AS AIN
	
	INNER JOIN dbmSemanticAnalytics.Dim.Months_v AS D ON AIN.FromDate <= D.EndMonth
		AND AIN.To_Date >= D.EndMonth
		AND AIN.FlagNew = 1
		AND ain.IndicatorId BETWEEN 1 AND 17
	) A
INNER JOIN [Dim].[ActiveIndicators] AI ON A.IndicatorId = AI.IndicatorId
GROUP BY A.Id_Patient,A.MonthYear,A.Year
)

--, cte2 
--as
--(
 --select  T1.id_Patient, T1.scoretypeid,T1.id_indexadmission,from_date
 --                     FROM   dbmsemanticanalyticsstg.stg.points T1 
 --                          INNER JOIN dbmsemanticanalytics.fact.severityscores T2 
 --                          ON T1.scoretypeid = 3 
 --                             AND T1.scoretypeid = T2.scoretypeid 
 --                            AND T1.id_indexadmission = T2.id_indexadmission 
 --                             AND T1.from_date = T2.date_score 

--)
,cte3 
as
(
select id_Patient, 3 as ScoreTypeId, sum(IndicatorPoints) Severity_Score, From_Date,  
id_IndexAdmission, 'Charlson Score' as ScoreType, 1 as FlagNew, 19 as IndicatorId, 1 Measure_IndicatorId
from dbmSemanticAnalyticsSTG.STG.Points
where ScoreTypeId = 3
group by id_Patient, id_IndexAdmission, From_Date
)

, cte4 
as
(
select   id_Patient,
          Severity_Score,
		  Null comb_id,
		  ScoreType,
		  ScoreTypeId,
		 -- D.MonthYear MonthYear,
		 NULL MonthYear,
		  From_Date as date_Score,
		  Measure_IndicatorId,
		-- D.Year [Year],
		NULL [Year],
		  FlagNew,
		  id_IndexAdmission
from cte3 c3  
 join [dbmSemanticAnalytics].Dim.Dates D
   on c3.From_Date = D.DateKey
) 
,cte5 
as 
(
Select T1.id_Patient,
       T1.Points as Severity_Score,
	   Null comb_id,
	   T2.ScoreType,
	   T1.ScoreTypeId,
	   NULL MonthYear,
       T1.From_Date as date_Score,
	    1 Measure_IndicatorId,
		D.Year [Year],
		T1.FlagNew,
	   T1.id_IndexAdmission
      -- left(From_Date,4) sys_PartitionDate ,     
from (
select id_Patient, sum(IndicatorPoints) Points, max(From_Date) From_Date,  ScoreTypeId,
id_IndexAdmission, 1 as FlagNew
from dbmSemanticAnalyticsSTG.STG.Points
where ScoreTypeId != 3
group by id_Patient, id_IndexAdmission, ScoreTypeId
)T1
inner join (
select distinct ScoreType, ScoreTypeId
from dim.Scores) T2
on T1.ScoreTypeId = T2.ScoreTypeId
 join [dbmSemanticAnalytics].Dim.Dates D
   on T1.From_Date = D.DateKey
)
,cte6 
as 
(
select * from cte1
union
select * from cte4
union 
select * from cte5
)

select distinct id_Patient,
       Severity_Score,
	   comb_id,
	   ScoreType,
	   MonthYear [date_YearMonth],
	   measure_IndicatorInd,
	   [Year] [sys_PartitionDate],
	   FlagNew,
	   ScoreTypeId,
       date_Score,
	   id_IndexAdmission
	   from cte6
	   where Year=cast( datepart(yyyy,getdate())as varchar)  or (MonthYear is null and date_Score/10000 = cast( datepart(yyyy,getdate())as varchar))
order by id_patient, MonthYear

