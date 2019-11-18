
EXEC dbmSemanticAnalyticsSTG.dbo.OpenHHR
select Id_patient_Root
,Id_patient_Extension
,  Id_Program
, dbmSemanticAnalyticsSTG.dbo.DecryptHR(From_DateEnc) From_DateEnc
, dbmSemanticAnalyticsSTG.dbo.DecryptHR(To_Date_Enc) To_DateEnc
from dbmSemanticAnalyticsSTG.Mirror.Program_patient_services
order by 1,2,3,4,5