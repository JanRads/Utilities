use [dbmClinicalAnalyticsGateway]
Go
with Enc1 as (
SELECT ImmunizationId_Root, ImmunizationId_Extension , PatientId_Root,
     [PatientId_Extension] as PatientId_Extension
	  ,  EncounterId_Root,EncounterId_Extension,ImmunizationCode, ImmunizationCodeSystem,
 CareProviderId_Root, CareProviderId_Extension

 from 
 (select      IM.ImmunizationId_Root,
			  IM.ImmunizationId_Extension ,
			  IM.PatientId_Root,
			  IM.PatientId_Extension,
			  IM.EncounterId_Root,
			  IM.EncounterId_Extension,
			  IM.ImmunizationCode,
			  IM.ImmunizationCodeSystem ,
			  IMP.CareProviderId_Root, 
			  IMP.CareProviderId_Extension,
			  IM.DeleteKey,
			  row_number() over (PARTITION by IM.ImmunizationId_Extension order by IM.ID desc) as rn
   FROM   [dbmClinicalAnalyticsGateway].Fact.Immunizations as IM LEFT OUTER JOIN
          [dbmClinicalAnalyticsGateway].Fact.ImmunizationPerformers as IMP 
		  ON  IM.[ImmunizationId_Extension] = IMP.[ImmunizationId_Extension] AND  IM.[ImmunizationId_Root] = IMP.[ImmunizationId_Root]
 
  ) a
where a.rn = 1 and a.DeleteKey <>1

)

SELECT ImmunizationId_Root, ImmunizationId_Extension , PatientId_Root,
       PatientId_Extension
	  ,  EncounterId_Root,EncounterId_Extension,ImmunizationCode, ImmunizationCodeSystem,
 CareProviderId_Root, CareProviderId_Extension  --,[StartDate],[EndDate]
 from Enc1
 
 order by 2,3,4,5,6,7,8,9,10

SELECT*  FROM   [dbmClinicalAnalyticsGateway].Fact.Immunizations  WHERE  ImmunizationID=1000001000
SELECT*  FROM [dbmClinicalAnalyticsGateway].Fact.ImmunizationPerformers
WHERE  ImmunizationID=1000001000


  --insert Into [Fact].[ImmunizationPerformers](ImmunizationID,ImmunizationId_Root,ImmunizationId_Extension,CareProviderId_Root,CareProviderId_Extension,PerformerTypeIndicator,TypeCode,TypeCodeSystem,NodeID,DeleteKey,TimeStamp,NewFlag) Values (1000001002,'2.16.840.1.113883.3.57.1.3.5.52.1.42.1','PHA-2.5-Immunizations03','2.16.840.1.113883.3.57.1.3.5.52.1.26','DOCTOR-pha2.5-03','AUT','AUT','2.16.840.1.113883.5.90',1,1,GETDATE(),1),(1000001002,'2.16.840.1.113883.3.57.1.3.5.52.1.42.1','PHA-2.5-Immunizations03','2.16.840.1.113883.3.57.1.3.5.52.1.26','DOCTOR-pha2.5-04','AUT','AUT','2.16.840.1.113883.5.90',1,0,GETDATE(),1)
 --,(1000001003,'2.16.840.1.113883.3.57.1.3.5.52.1.42.1','PHA-2.5-Immunizations04','2.16.840.1.113883.3.57.1.3.5.52.1.26','DOCTOR-pha2.5-04','AUT','AUT','2.16.840.1.113883.5.90',1,1,GETDATE(),1)  
