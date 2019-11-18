
use dbmSemanticAnalyticsSTG

exec dbmSemanticAnalyticsSTG.dbo.OpenHHR


select BuildingBlockId, id_Patient, cast(Value as decimal(8,6)) Value, MeasureInd, date_YearMonth
from dbmSemanticAnalytics.Fact.BuildingBlocks BB join dbmSemanticAnalyticsSTG.Persist.MappingPatient MP
												 on BB.id_Patient = MP.PatientKey 
where dbo.DecryptHR(Enc_Extension) like 'PHA_3.5_BB%' and BuildingBlockId<5


order by BuildingBlockId, id_Patient, value, date_YearMonth