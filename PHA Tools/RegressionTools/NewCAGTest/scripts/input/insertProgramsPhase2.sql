--phase 2
	USE [dbmSemanticAnalyticsSTG]
GO

create table #T1
(      
  [Id_Program][int] not null,
	[Program_name] [nvarchar](128) not NULL,
) 

---------------------------------------------------------------------------------------------
--Insert Values into the temp Table Patient Root and Patient Extension
---------------------------------------------------------------------------------------------
INSERT INTO #T1(Id_Program,[Program_name])
values
 (1,'Clalit')
,(2,'Maccabi')
,(3,'Meuhedet')
,(4,'Leumit')
,(5,'Arael')
,(6,'Clal')
,(-1,'UNKNOWN')




---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
declare @P Program
insert into @P 
select  [Id_Program],
	[Program_name]
from #T1

EXEC  Mirror.Program_ins @p
drop table #T1



USE [dbmSemanticAnalyticsSTG]
GO

create table #T1
(   	[Id_patient_Extension] [nvarchar](255)not NULL,
	[Id_patient_Root] [nvarchar](128) not NULL,
	[Id_Program][int] not null,
	[From_Date] [datetime]not NULL,
	[To_Date] [datetime] NULL,
	[DeleteKey] [int] NULL
) 

---------------------------------------------------------------------------------------------
--Insert Values into the temp Table Patient Root and Patient Extension
---------------------------------------------------------------------------------------------
INSERT INTO #T1(
[Id_patient_Extension],
	[Id_patient_Root] ,
	[Id_Program],
	[From_Date] ,
	[To_Date],
	[DeleteKey] 
)
values

-- NEW
('PHA2.5_Alz_DX2','2.16.840.1.113883.3.57.1.3.5.52.1.8.6',2,'2010-01-01','2010-11-01',null),
('PHA2.5_Alz_DX3','2.16.840.1.113883.3.57.1.3.5.52.1.8.6',4,'2012-01-01','2013-01-01',null),
('PHA2.5_Alz_DX4','2.16.840.1.113883.3.57.1.3.5.52.1.8.6',1,'2014-01-01','2014-11-30',null),
('PHA2.5_Alz_DX5','2.16.840.1.113883.3.57.1.3.5.52.1.8.6',2,'2015-01-01','2015-12-31',null),
('PHA2.5_Alz_DX6','2.16.840.1.113883.3.57.1.3.5.52.1.8.6',3,'2014-01-01','2014-12-31',null),
('PHA2.5_Alz_DX6','2.16.840.1.113883.3.57.1.3.5.52.1.8.6',3,'2014-03-01','2014-08-31',null), --overlap- should not enterd
('PHA2.5_Alz_DX6','2.16.840.1.113883.3.57.1.3.5.52.1.8.6',3,'2016-01-01','2016-12-31',null),
--DELETE
('PHA25_MCC_P3_2d','2.16.840.1.113883.3.57.1.3.5.52.1.8.6',4,'2016-03-01','2016-10-31',1),
('PHA_EncAT_P3','2.16.840.1.113883.3.57.1.3.5.52.1.8.6',1,'2015-01-01','2015-12-31',1),
--CHANGES
('PHA_EncAT_P1','2.16.840.1.113883.3.57.1.3.5.52.1.8.6',1,'2014-01-01','2014-11-30',1),
('PHA_EncAT_P1','2.16.840.1.113883.3.57.1.3.5.52.1.8.6',5,'2014-01-01','2014-11-30',null), --change program from 1 to 5

('PHA_EncAT_P1','2.16.840.1.113883.3.57.1.3.5.52.1.8.6',2,'2015-01-01','2015-12-31',null),--change [From_Date] date
('PHA_Relat_EncAT_P2','2.16.840.1.113883.3.57.1.3.5.52.1.8.6',2,'2015-03-03','2017-12-31',null),--change bouth dates
('PHA_EncAT_P22','2.16.840.1.113883.3.57.1.3.5.52.1.8.6',4,'2011-03-03','2014-04-01',null) --change dates - create overlap with 2 rows in presist



---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
declare @P Program_Services
insert into @P 
select  [Id_patient_Extension],
	[Id_patient_Root] ,
	[Id_Program],
	[From_Date] ,
	[To_Date],
	[DeleteKey]
from #T1

EXEC  Mirror.Program_Services_ins @p
drop table #T1


