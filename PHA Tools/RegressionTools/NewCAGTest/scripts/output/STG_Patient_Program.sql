--ACTUAL
EXEC dbmSemanticAnalyticsSTG.dbo.OpenHHR
select PatientKey, [Program_name], min(fromDate) fromDate, toDate
from 
(select q.PatientKey ,
				q.[Program_name],
				([dbmSemanticAnalyticsSTG].[dbo].[Convert_Date](q.fromDate)/100)*100+1 fromDate,
				case when q.toDate is null then 20301231 
					else ([dbmSemanticAnalyticsSTG].[dbo].[Convert_Date](Dateadd(month, 1, q.toDate))/100)*100+1 end as  toDate
				
from 
(SELECT 
      [Program_name]
	  ,dbmSemanticAnalyticsSTG.[dbo].[DecryptHR](b.From_DateEnc) fromDate
	  ,dbmSemanticAnalyticsSTG.[dbo].[DecryptHR](b.To_Date_Enc) toDate
      ,max(b.[LastUpdated]) over (partition by a.[Id_Program], p.PatientKey) max_d
	  ,b.[LastUpdated]
	  ,p.PatientKey
	  
 FROM [dbmSemanticAnalyticsSTG].[Mirror].[Program_services] A
	inner join [dbmSemanticAnalyticsSTG].[Mirror].[Program_patient_services] b
	on a.Id_Program = b.Id_Program
	inner join [dbmSemanticAnalyticsSTG].[Persist].[MappingPatient] p
	on p.Id_Extension = b.Id_patient_Extension and b.Id_patient_Root = p.Id_Root
		
		) q
where q.max_d = q.[LastUpdated]

) qq

group by PatientKey, [Program_name], toDate
order by 1, 2