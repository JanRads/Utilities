----Expected
/****** Script for SelectTopNRows command from SSMS  ******/
---Exp---
select 
	  q.[MedId_Root]
      ,q.[MedId_Ext]
      ,q.[PatientId_Root]
      ,q.[PatientId_Extension]
	  ,q.EncounterId_Root
	  ,q.EncounterId_Extension
	  ,q.[CareProviderId_Root]
	  ,q.[CareProviderId_Extension]
      ,q.[MedicationCode]
      ,q.[MedicationCodeSystem]
      ,isnull(q.[TimeStart] ,-1) [TimeStart]
	  ,isnull(q.[TimeEnd],-1) [TimeEnd]
 from
(
SELECT distinct a.[MedId_Root]
      ,a.[MedId_Ext]
      ,a.[PatientId_Root]
      ,a.[PatientId_Extension]
	  ,a.EncounterId_Root
	  ,a.EncounterId_Extension
	  ,[CareProviderId_Root]
	  ,[CareProviderId_Extension]
      ,a.[MedicationCode]
      ,a.[MedicationCodeSystem]
	  ,YEAR([TimeStart]) * 10000 + MONTH([TimeStart]) * 100 + '01'as  [TimeStart]	
	  ,YEAR([TimeEnd]) * 10000 + MONTH([TimeEnd]) * 100 + '01'as  [TimeEnd]	
	  ,a.[TimeStamp]
	  ,b.[TimeStamp] btime
	  ,max(a.[TimeStamp]) over (partition by a.[MedId_Root] ,a.[MedId_Ext]) as ts
	  ,max(b.[TimeStamp]) over (partition by b.[MedId_Root] ,b.MedId_Extension) as ts_b
      ,max(a.deleted) over (partition by a.[MedId_Root] ,a.[MedId_Ext]) as deleted
	  ,max(b.DeleteKey) over (partition by b.[MedId_Root] ,b.MedId_Extension) as deleted_b
	 
  FROM [dbmClinicalAnalyticsGateway].[Fact].[Medication] a
	   left outer join 
	   (select *
	   from
	   (select b.*,
				max(b.[TimeStamp]) over (partition by b.[MedId_Root] ,b.MedId_Extension) as ts_b
	    from
	   [dbmClinicalAnalyticsGateway].[Fact].[MedicationPerformers] b
	   ) b
	   where ts_b = b.[TimeStamp] and b.DeleteKey <> 1
	   ) b
	   on a.MedId_Ext = b.MedId_Extension and a.MedId_Root = b.MedId_Root
	   and b.DeleteKey <> 1 
	   and a.Deleted <> 1

	   left join [dbmClinicalAnalyticsGateway].[MasterData].[PatientIdentifier] MP
	   on a.Patientid_Root = MP.PatientId_Root and 
		  a.PatientId_Extension = MP.PatientId_Extension
	   left join [dbmClinicalAnalyticsGateway].[MasterData].[Relationship] pcp
	   on MP.EnterprisePatientId = PCP.TargetEntityId
 -- where RoleTypeCode = 'GPCP'
  
) as q 
where 
1=1
and (deleted = 0 or deleted is null)
and (deleted_b = 0  or deleted_b is null)
and ts = [TimeStamp]
--and ts_b = btime
order by q.MedId_Ext ; 