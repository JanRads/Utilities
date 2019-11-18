
use [dbmClinicalAnalyticsGateway]
Go
 
with Immunizations_cts as(
select * from  
(select ImmunizationId_Root,ImmunizationId_Extension,PatientId_Root,
 PatientId_Extension
,EncounterId_Root,EncounterId_Extension,ImmunizationCode,ImmunizationCodeSystem,fact.Immunizations.[TimeStamp],
--CASE  
--   when  [StartDate] IS NULL
--        THEN - 1
--		ELSE  YEAR([StartDate]) * 10000 + MONTH([StartDate]) * 100 + 1 
--		end  as [StartDate],
--CASE  
--   when  [EndDate] IS NULL
--        THEN - 1
--		ELSE  YEAR([EndDate]) * 10000 + MONTH([EndDate]) * 100 + 1 
--		end as [EndDate],
 row_number() over (PARTITION by ImmunizationId_Extension order by fact.Immunizations.[TimeStamp] desc) as I_rn,
[DeleteKey] as I_Del

                from Fact.Immunizations

) a
where a.I_rn=1 and a.I_Del<>1
),

IMU_Performers_cts as (
						select * from 
						(select b.* , min(IMP_Rn) over (partition by ImmunizationId_Extension,ImmunizationId_Root) m
                       from (SELECT    ImmunizationId_Extension,ImmunizationId_Root, CareProviderId_Root, CareProviderId_Extension, DeleteKey as IP_DEl, TimeStamp,
					                   row_number() over (PARTITION by ImmunizationId_Extension order by Fact.ImmunizationPerformers.[TimeStamp] desc) as IMP_Rn,
									   max(TimeStamp) over (partition by ImmunizationId_Extension,ImmunizationId_Root) max_time
                             FROM            Fact.ImmunizationPerformers
							 ) b
                       where b.IP_DEl <> 1) b
					   where b.IMP_Rn = m
					   and max_time = TimeStamp

)

select Immunizations_cts.ImmunizationId_Root as ImmunizationId_Root,  Immunizations_cts.ImmunizationId_Extension AS ImmunizationId_Extension,
Immunizations_cts.PatientId_Root  AS PatientId_Root,
 PatientId_Extension, 
 Immunizations_cts.EncounterId_Root AS EncounterId_Root, Immunizations_cts.EncounterId_Extension AS EncounterId_Extension,
 Immunizations_cts.ImmunizationCode as ImmunizationCode, Immunizations_cts.ImmunizationCodeSystem as ImmunizationCodeSystem,
  IMU_Performers_cts.CareProviderId_Root, IMU_Performers_cts.CareProviderId_Extension 
  --,Immunizations_cts.StartDate as StartDate,Immunizations_cts.EndDate as EndDate

from Immunizations_cts LEFT OUTER JOIN IMU_Performers_cts
                          ON Immunizations_cts.ImmunizationId_Root = IMU_Performers_cts.ImmunizationId_Root AND 
                       Immunizations_cts.ImmunizationId_Extension  = IMU_Performers_cts.ImmunizationId_Extension
order by  Immunizations_cts.ImmunizationId_Extension,Immunizations_cts.ImmunizationId_Root 

