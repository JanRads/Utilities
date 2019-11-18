
use dbmSemanticAnalyticsSTG

EXEC dbmSemanticAnalyticsSTG.dbo.OpenHHR 
 


--drop table STG.BBCreationTerminationReg
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'STG.BBCreationTerminationReg') AND type in (N'U'))
BEGIN
CREATE TABLE STG.BBCreationTerminationReg(BBID bigint NULL,PatientId_Root nvarchar(128) NULL,PatientId_Extension nvarchar(255) NULL,Value nvarchar(255) NULL,EffectiveTimeStart datetime NULL,EffectiveTimeEnd datetime NULL,IsTerminate int NULL)
END


go 


insert into STG.BBCreationTerminationReg 

select buildingBlockKey,Patient_Root,Patient_Extension,Value,EffectiveTimeStart, case when (EffectiveTimeEnd>isnull(EffectiveTimeEndDec,EffectiveTimeStart)) then EffectiveTimeEnd else EffectiveTimeEndDec end EffectiveTimeEnd , 0 IsTerminate
from (select cast(1 as bigint) buildingBlockKey,  PatientId_Root Patient_Root,PatientId_Extension Patient_Extension,IsActive  Value,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc) EffectiveTimeStart,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeEndEnc) EffectiveTimeEndDec, dateadd(mm,6 - 1,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc)) EffectiveTimeEnd 
         from dbmSemanticAnalyticsSTG.persist.PopulationClassifications BB 
         where  IsActive = CAST(1 AS DECIMAL(18, 2))  and ID_Clasification = N'1'
       )BB


union

select buildingBlockKey,Patient_Root,Patient_Extension,Value,EffectiveTimeStart, 
       case when (EffectiveTimeEnd<=isnull(EffectiveTimeEndDec, EffectiveTimeEnd)) then EffectiveTimeEnd else EffectiveTimeEndDec end EffectiveTimeEnd , 0 IsTerminate
       from 
              (select cast(2 as bigint) buildingBlockKey,  BB.Patient_Root,BB.Patient_Extension,Value Value ,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc) EffectiveTimeStart,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeEndEnc) EffectiveTimeEndDec, case 
                                         when (month(dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc)) +((  2  % 4)-1)*3) >= 1 and (month(dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc)) +((2 % 4)-1)*3) <=3  then cast( cast(year(dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc))+ (2 / 4) as varchar) + '-03-31' AS datetime)
                                         when (month(dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc)) +((  2  % 4)-1)*3) >= 4 and (month(dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc)) +((2 % 4)-1)*3) <=6  then cast( cast(year(dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc))+ (2 / 4) as varchar) + '-06-30' AS datetime)
                                         when (month(dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc)) +((  2  % 4)-1)*3) >= 7 and (month(dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc)) +((2 % 4)-1)*3) <=9  then cast( cast(year(dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc))+ (2 / 4) as varchar) + '-09-30' AS datetime)
                                         when (month(dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc)) +((  2  % 4)-1)*3) >= 10 and (month(dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc)) +((2 % 4)-1)*3) <=12  then cast( cast(year(dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc))+ (2 / 4)  as varchar) + '-12-31' AS datetime)
                                         end EffectiveTimeEnd from dbmSemanticAnalyticsSTG.persist.MetricResults BB with (nolock) where  Value  = CAST(50 AS DECIMAL(18, 2))  and DeleteKey <> 1 and  Concept_MetricTypeExtension  = N'2')BB



union


select buildingBlockKey,Patient_Root,Patient_Extension,Value,EffectiveTimeStart, case when (EffectiveTimeEnd>isnull(EffectiveTimeEndDec,EffectiveTimeStart)) then EffectiveTimeEnd else EffectiveTimeEndDec end EffectiveTimeEnd , 0 IsTerminate
from (select cast(3 as bigint) buildingBlockKey,  BB.Patient_Root,BB.Patient_Extension,Value Value ,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc) EffectiveTimeStart,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeEndEnc) EffectiveTimeEndDec,case when month(dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc))>3 then cast( cast(year(dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc))+1 as varchar) + '-03-31' AS datetime)      else cast( cast(year(dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc)) as varchar) + '-03-31' AS datetime) end  EffectiveTimeEnd 
         from dbmSemanticAnalyticsSTG.persist.MetricResults BB -- join dbmSemanticAnalyticsSTG.stg.NewBB NBB with (nolock) on NBB.BBID=3 and  BB.Patient_Root=NBB.Patient_Root and BB.Patient_Extension=NBB.Patient_Extension 
         where  Value = CAST(50 AS DECIMAL(18, 2))  and  Concept_MetricTypeExtension  = N'3' AND EffectiveTimeEndEnc is NULL
       )BB

union

select buildingBlockKey,Patient_Root,Patient_Extension,Value,EffectiveTimeStart, case when (EffectiveTimeEnd>isnull(EffectiveTimeEndDec,EffectiveTimeStart)) then EffectiveTimeEnd else EffectiveTimeEndDec end EffectiveTimeEnd , 0 IsTerminate
from (select cast(4 as bigint) buildingBlockKey,  PatientId_Root Patient_Root,PatientId_Extension Patient_Extension,IsActive  Value,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc) EffectiveTimeStart,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeEndEnc) EffectiveTimeEndDec,(SELECT MAX(AlternateDateDesc)D FROM dbmSemanticAnalytics.Dim.Dates) EffectiveTimeEnd 
         from dbmSemanticAnalyticsSTG.persist.PopulationClassifications BB 
         where  IsActive = CAST(1 AS DECIMAL(18, 2))  and ID_Clasification = N'4' AND EffectiveTimeEndEnc is NULL
      
       )BB


union
-------------------------------------------------



select buildingBlockKey,Patient_Root,Patient_Extension,Value,EffectiveTimeStart, case when (EffectiveTimeEnd>isnull(EffectiveTimeEndDec,EffectiveTimeStart)) then EffectiveTimeEnd else EffectiveTimeEndDec end EffectiveTimeEnd  , 1 IsTerminate
from (select cast(1 as bigint) buildingBlockKey,  PatientId_Root Patient_Root,PatientId_Extension Patient_Extension,IsActive  Value,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc) EffectiveTimeStart,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeEndEnc) EffectiveTimeEndDec,NULL EffectiveTimeEnd 
         from dbmSemanticAnalyticsSTG.persist.PopulationClassifications BB 
         where  IsActive <> CAST(1 AS DECIMAL(18, 2))  and ID_Clasification = N'1' 
       )BB

union


select buildingBlockKey,Patient_Root,Patient_Extension,Value,EffectiveTimeStart, case when (EffectiveTimeEnd>isnull(EffectiveTimeEndDec,EffectiveTimeStart)) then EffectiveTimeEnd else EffectiveTimeEndDec end EffectiveTimeEnd , 1 IsTerminate
from (select cast(2 as bigint) buildingBlockKey,  BB.Patient_Root,BB.Patient_Extension,Value Value ,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc) EffectiveTimeStart,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeEndEnc) EffectiveTimeEndDec,NULL EffectiveTimeEnd 
         from dbmSemanticAnalyticsSTG.persist.MetricResults BB -- join dbmSemanticAnalyticsSTG.stg.NewBB NBB with (nolock) on NBB.BBID=2 and  BB.Patient_Root=NBB.Patient_Root and BB.Patient_Extension=NBB.Patient_Extension 
         where    Concept_MetricTypeExtension  = N'2' --Value <> CAST(50 AS DECIMAL(18, 2))  and
       )BB

union


select buildingBlockKey,Patient_Root,Patient_Extension,Value,EffectiveTimeStart, case when (EffectiveTimeEnd>isnull(EffectiveTimeEndDec,EffectiveTimeStart)) then EffectiveTimeEnd else EffectiveTimeEndDec end EffectiveTimeEnd  , 1 IsTerminate
from (select cast(3 as bigint) buildingBlockKey,  BB.Patient_Root,BB.Patient_Extension,Value Value ,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc) EffectiveTimeStart,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeEndEnc) EffectiveTimeEndDec,NULL EffectiveTimeEnd 
         from dbmSemanticAnalyticsSTG.persist.MetricResults BB -- join dbmSemanticAnalyticsSTG.stg.NewBB NBB with (nolock) on NBB.BBID=3 and  BB.Patient_Root=NBB.Patient_Root and BB.Patient_Extension=NBB.Patient_Extension \
		 where   Concept_MetricTypeExtension  = N'3' -- Value <> CAST(50 AS DECIMAL(18, 2))  and
       )BB

union

select buildingBlockKey,Patient_Root,Patient_Extension,Value,EffectiveTimeStart, case when (EffectiveTimeEnd>isnull(EffectiveTimeEndDec,EffectiveTimeStart)) then EffectiveTimeEnd else EffectiveTimeEndDec end EffectiveTimeEnd  , 1 IsTerminate
from (select cast(4 as bigint) buildingBlockKey,  PatientId_Root Patient_Root,PatientId_Extension Patient_Extension,IsActive  Value,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeStartEnc) EffectiveTimeStart,dbmSemanticAnalyticsSTG.dbo.DecryptHR( EffectiveTimeEndEnc) EffectiveTimeEndDec,NULL EffectiveTimeEnd 
         from dbmSemanticAnalyticsSTG.persist.PopulationClassifications BB -- join dbmSemanticAnalyticsSTG.stg.NewBB NBB with (nolock) on NBB.BBID=4 and BB.PatientId_Root=NBB.Patient_Root and BB.PatientId_Extension=NBB.Patient_Extension  
		 where   ID_Clasification = N'4' --IsActive <> CAST(1 AS DECIMAL(18, 2))  and
       )BB



-------------------------------------------------

declare @date datetime = (SELECT max(alternatedatedesc) FROM dbmSemanticAnalytics.dim.Dates)

select distinct 
S.BuildingBlockId, 
S.id_Patient, 
S.Value, 
1 Measure_Ind, 
((D.DateKey)/100)  MonthId
from (
select [BBID] BuildingBlockId
                       ,PatientKey id_Patient
                       ,[Value]
                       ,[EffectiveTimeStart] StartEffectiveDate
                       ,case 
                                         when nextdate is null and [EffectiveTimeEnd] is null
                                         then @date -- default date value
                                         when nextdate is null and [EffectiveTimeEnd] is not null
                                         then [EffectiveTimeEnd] -- for one row of BB+Patient
                                         when nextdate > [EffectiveTimeEnd] -- for the option of two differnt rows
                                         then [EffectiveTimeEnd]
                                         else DATEADD(MONTH,-1,nextdate) -- the leading BB+Patient, oner month earlier
                        end EndEffectiveDate
                       ,[isTerminate]
from
              (select [BBID]
                       ,PatientKey
                       ,[Value]
                       ,[EffectiveTimeStart]
                       ,maxdate
                       --get the lead startDate to determine the real endDate of the Building Block
                       ,lead([EffectiveTimeStart]) over (partition by [BBID],PatientKey order by [EffectiveTimeStart] asc) nextdate
                       ,[EffectiveTimeEnd]
                       ,[isTerminate]
              from

              (
              select [BBID]
                       ,mp.patientKey
                       ,[Value]
                       ,EffectiveTimeStart
                       ,EffectiveTimeEnd
                       ,isTerminate 
                       --get the max date of the month to check what is the latest data of the month for each patient
                       ,max([EffectiveTimeStart]) over (partition by
                        year([EffectiveTimeStart])*100 + month([EffectiveTimeStart]),
                                  BBID,
                                  mp.patientKey) as maxdate
                       from 
              STG.BBCreationTerminationReg a           
              join Persist.MappingPatient mp --get patient key
              on mp.Id_Extension = a.PatientId_Extension and mp.Id_Root = a.PatientId_Root             
              
              where dbo.DecryptHR(Enc_Extension) like 'PHA_3.5_BB%'
              ----------------------------------------------------------------------------------------------       
              ) q
              where maxdate = EffectiveTimeStart
              
) qq

) S


left join dbmSemanticAnalyticsSTG.[Config].[CommonBuildingBlocks] cbb
       on s.BuildingBlockId = cbb.BuildingBlockKey

       join (select distinct DateDesc, DateKey,DayInMonth
                from dbmSemanticAnalytics.Dim.Dates) D
       on  
              (D.DateDesc between S.StartEffectiveDate and S.EndEffectiveDate
              and d.DateKey >= year(getdate())- 3 * 100 + 12
              and cbb.ComplianceType <> 10
              )

              or 
              (
              S.StartEffectiveDate = S.EndEffectiveDate and 
              year(s.StartEffectiveDate)*10000+month(s.StartEffectiveDate)*100+day(s.StartEffectiveDate) = D.DateKey
              and cbb.ComplianceType <> 10
              and d.DateKey >= (year(getdate())- 3) * 10000 + 1 * 100 + 1
              )
              
              or
              (
              cbb.ComplianceType = 10
              --and atpb.id_Patient is null
              and 
              (D.DateDesc between S.StartEffectiveDate and S.EndEffectiveDate
              and d.DateKey >= (year(getdate())- 3) * 10000 + 1 * 100 + 1
              and d.DateKey <= (year(getdate())+ 1) * 10000 + 12 * 100 + 31
              )
              )


--where S.IsTerminate = 0 

order by BuildingBlockId, id_Patient, value, MonthId

