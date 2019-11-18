-- expected


Select date_YearMonth, attrib_Measure [attrib_Measure], attrib_PatientAge [attrib_PatientAge],count(*) [measure_population]
from (
         select   cast( datepart(yyyy,getdate())as varchar)+'_01' [date_YearMonth], attrib_Measure,attrib_PatientAge
         from (
                select M.[id_PopulationMember]
               ,[id_Patient]
               ,[date_YearMonth]
               ,[attrib_Measure]
               ,[attrib_PatientAge]
               ,[measure_MemberInd]
                from dbmSemanticAnalytics.Fact.MeasureMembersMonthly M
                join dbmSemanticAnalytics.Factless.PopulationPCPOrg F
                 on M.id_PopulationMember = F.id_PopulationMember
                where date_YearMonth =  cast( datepart(yyyy,getdate())as varchar)+'_01'  --and org_RelatedProvider >0
                )T
	  )T2
group by date_YearMonth, attrib_Measure, attrib_PatientAge
order by attrib_PatientAge, attrib_Measure
