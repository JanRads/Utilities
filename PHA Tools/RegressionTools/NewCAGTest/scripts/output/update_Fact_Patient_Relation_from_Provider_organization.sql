--EXP
use [dbmSemanticAnalytics]

select id_Patient,provider_Related, org_RelatedProvider,max(date_relationship)
 from dbmSemanticAnalytics.fact.patientRelations
 --where measure_patientcount =-1 
 where id_patient in(173,174,175)--41
  group by id_Patient,provider_Related, org_RelatedProvider
order by 1,2,3,4
