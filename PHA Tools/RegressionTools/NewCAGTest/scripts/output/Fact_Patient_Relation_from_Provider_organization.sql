--EXP
use [dbmSemanticAnalytics]

select id_Patient,provider_Related, org_RelatedProvider,date_relationship
 from dbmSemanticAnalytics.fact.patientRelations
 where measure_patientcount =-1 
 and id_patient in (173,174,175)
 order by 1,2,3,4