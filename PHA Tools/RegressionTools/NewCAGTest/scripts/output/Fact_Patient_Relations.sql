--ACTUAL CAG
use dbmSemanticAnalytics
select  id_Patient,provider_Related,org_RelatedProvider,  min(date_relationship)--date 20131124
from [Fact].[PatientRelations]
where
 id_patient in(36) and 
measure_patientcount=1
group by  id_Patient,provider_Related,org_RelatedProvider