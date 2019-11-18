use [dbmClinicalAnalyticsGateway]
Go
 
with Measurement_cts as(
select * from  (select Fact.Measurement.MeasurementEventId_Root, Fact.Measurement.MeasurmentEventId_Extension , Fact.Measurement.PatientId_Root, Fact.Measurement.PatientId_Extension,  Fact.Measurement.EncounterId_Root, 
Fact.Measurement.EncounterId_Extension , Fact.Measurement.[TimeStamp],
 row_number() over (PARTITION by Fact.Measurement.MeasurmentEventId_Extension order by Fact.Measurement.[TimeStamp] desc) as M_Rn, Fact.Measurement.[DeleteKey] as M_Del

FROM            Fact.Measurement 

) a
where a.M_Rn=1 and a.M_Del<>1
),

MPerformers_cts as (select * from (SELECT       [Fact].[MeasurementPerformers].[TypeCode] ,MeasurementEvent_Root, MeasurementEventID_Extension, CareProviderId_Root, CareProviderId_Extension, DeleteKey as MP_DEl, TimeStamp,  row_number() over (PARTITION by Fact.MeasurementPerformers.MeasurementEventID_Extension order by Fact.MeasurementPerformers.[TimeStamp] desc) as MP_Rn
FROM            Fact.MeasurementPerformers where [TypeCode] = 'AUT') b
where b.MP_Rn=1 and b.MP_DEl<> 1 
--AND [b].[TypeCode] = 'AUT'

)

select Measurement_cts.MeasurementEventId_Root as MeasurementEventId_Root,  Measurement_cts.MeasurmentEventId_Extension AS MeasurmentEventId_Extension,
 Measurement_cts.[PatientId_Root] AS PatientId_Root, Measurement_cts.[PatientId_Extension] AS PatientId_Extension, 
 Measurement_cts.[EncounterId_Root] AS EncounterId_Root, Measurement_cts.[EncounterId_Extension] AS EncounterId_Extension, MPerformers_cts.[CareProviderId_Root], MPerformers_cts.[CareProviderId_Extension]

from Measurement_cts LEFT OUTER JOIN MPerformers_cts
                          ON Measurement_cts.MeasurementEventId_Root = MPerformers_cts.MeasurementEvent_Root AND 
                        Measurement_cts.MeasurmentEventId_Extension = MPerformers_cts.MeasurementEventID_Extension
order by   Measurement_cts.MeasurmentEventId_Extension , Measurement_cts.MeasurementEventId_Root

