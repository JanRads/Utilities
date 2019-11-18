 
 SELECT [LabRequestRoot]
				,[LabRequestExtension]
				,[LabResultId_Root]
				,[LabResultId_Extension]
				,[ClusterCode]
				,[ClusterCodeSystem]
				,[Patient_Id_Root]
				,[Patient_Id_Extension]
				,[CollectionDate]
				,[ResultDate]
 FROM
 (SELECT [LabRequestRoot]
				,[LabRequestExtension]
				,[LabResultId_Root]
				,[LabResultId_Extension]
				,[ClusterCode]
				,[ClusterCodeSystem]
				,[Patient_Id_Root]
				,[Patient_Id_Extension]
				,cast(convert(char(11),CollectionDate, 113) as datetime) As [CollectionDate]
				,cast(convert(char(11),[ResultDate], 113) as datetime) As [ResultDate]
				, ROW_NUMBER() OVER (PARTITION  BY LabResultId_Extension  ORDER BY ID DESC) as R
FROM [dbmClinicalAnalyticsGateway].[Fact].[LaboratoryResults]) A
WHERE R=1
ORDER BY 4