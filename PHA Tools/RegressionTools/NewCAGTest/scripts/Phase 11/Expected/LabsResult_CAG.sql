SELECT [LabRequestRoot]
				,[LabRequestExtension]
				,[LabResultId_Root]
				,[LabResultId_Extension]
				,[ClusterCode]
				,[ClusterCodeSystem]
				,[Patient_Id_Root]
				,[Encounter_Id_Root]
				,[EncounterId_Extension]
				,[Patient_Id_Extension]
				,[CollectionDate]
				,[ResultDate]
 from 
		(select [LabRequestRoot]
				,[LabRequestExtension]
				,[LabResultId_Root]
				,[LabResultId_Extension]
				,[ClusterCode]
				,[ClusterCodeSystem]
				,[Patient_Id_Root]
				,[Encounter_Id_Root]
				,[EncounterId_Extension]
				,[Patient_Id_Extension]
				,cast(convert(char(11),CollectionDate, 113) as datetime) As [CollectionDate]
				,cast(convert(char(11),[ResultDate], 113) as datetime) As [ResultDate]
				,[DeleteKey]
				--,[TimeStamp]
				--,[NewFlag]
				, ROW_NUMBER() OVER (PARTITION  BY LabResultId_Extension  ORDER BY ID DESC

) as rn
from [dbmClinicalAnalyticsGateway].[Fact].[LaboratoryResults]
) a
where a.rn = 1 
and [DeleteKey]=0
and [Encounter_Id_Root] is not null
order by 2, 4;
