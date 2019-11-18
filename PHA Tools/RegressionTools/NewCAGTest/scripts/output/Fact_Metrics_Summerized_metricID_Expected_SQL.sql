DECLARE @startDate INT,
		@endDate INT
SELECT @startDate = cast(Left(cast(DATEADD(yy,-2,getdate())as date),4)+ Left(Right(cast(DATEADD(mm,-1,getdate())as date),5),2)as int)
SELECT @endDate   = cast(Left(cast(DATEADD(mm,-1,getdate())as date),4)+Left(Right(cast(DATEADD(mm,-1,getdate())as date),5),2)as int)


select M.date_YearMonth datekey,
       CMD.Level2Desc,
       m.MetricKey MetricID,
	   CMD.MetricName,
	 cast( ( Sum  (M.measure_NumeratorInd)*1.0/(sum(m.measure_DenominatorInd))*1.0)as decimal(6,2)) score
from    Fact.Metrics_CQM_Full M
   join [dbmSemanticAnalyticsSTG].Config.MetricsDefinitions CMD on M.MetricKey = CMD.MetricKey
   JOIN Factless.PatientRelationsFromTo AS pr ON M.id_Patient = pr.id_Patient  AND M.date_YearMonth * 100 + 1 BETWEEN pr.date__from_Relationship AND pr.date_To_Relationship
 where M.date_YearMonth >= @startDate and  M.date_YearMonth <= @endDate
 group by M.date_YearMonth,CMD.Level2Desc, M.MetricKey, CMD.MetricName
 order by 1,3