SELECT [LabRequestRoot],[LabRequestExtension],[LabRequest_PriorityCode],[LabRequest_PriorityCodeSystem],
[Patient_Id_Root],[Patient_Id_Extension],[Encounter_Id_Root],[EncounterId_Extension],[CollectionDate]
,[OrderDate]
 from 
		(select [LabRequestRoot]
				,[LabRequestExtension]
				,[LabRequest_PriorityCode]
				,[LabRequest_PriorityCodeSystem]
				,[Patient_Id_Root]
				,[Patient_Id_Extension]
				,[Encounter_Id_Root]
				,[EncounterId_Extension]
				,cast(convert(char(11),CollectionDate, 113) as datetime) As [CollectionDate]
				,cast(convert(char(11),[OrderDate], 113) as datetime) As [OrderDate]
				--,[DeleteKey]
				--,[TimeStamp]
				--,[NewFlag]
				, row_number() over (PARTITION by [LabRequestExtension] order by [LabRequestExtension],CollectionDate 

) as rn
from [dbmClinicalAnalyticsGateway].[Fact].[LaboratoryResults]
) a
where a.rn = 1 
order by 2
