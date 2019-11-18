USE [dbmClinicalAnalyticsGateway]
go
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON 
GO

  -----------------------------------------------------------------------CQM Regressions---------------------------------------------------------------------------------
-----------------------------------------------------------------Colorectal Cancer-----------------------------------------------------------------------
declare @ThisYearJan datetime set @ThisYearJan = cast(cast( datepart(yyyy,getdate())as varchar)+'-01-01 11:27:50.000' as datetime)

INSERT INTO Fact.PopulationClassification(
 PopulationClassificationId, PatientId_Root, PatientId_Extension, ClasificationCode, ClasificationCodeSystem, EffectiveTime_Start, EffectiveTime_End, IsActive, 
                      LastUpdatedTime, DeleteKey, NodeID, TimeStamp, NewFlag)
VALUES         
(31,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1','0007-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(32,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2','0007-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(33,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3','0007-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(34,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4','0007-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(35,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5','0007-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(36,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P11','0007-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(26,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3','0006-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(27,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4','0006-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(28,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5','0006-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(29,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P11','0006-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(30,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P22','0006-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1)


INSERT INTO [Fact].[MetricsResults] (
	 MetricId_Root, MetricId_Extension, PatientId_Root, PatientId_Extension,[EffectiveTime_Start],[EffectiveTime_End], LastUpdatedTime, MetricTypeCode, MetricTypeCodeSystem, Compliance, 
                         InterpretationCodeSystem, InterpretationCode, Clinical_ConceptCodeSystem, Clinical_ConceptCode, Text, Value, 
                         DeleteKey, NodeID, TimeStamp, NewFlag
	)
VALUES
('2.16.840.1.113883.3.57.1.2.17.88','133','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1',@ThisYearJan,@ThisYearJan,getdate(),'0086','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','134','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2',@ThisYearJan,@ThisYearJan,getdate(),'0082','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','135','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4',@ThisYearJan,@ThisYearJan,getdate(),'0084','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','136','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4',@ThisYearJan,@ThisYearJan,getdate(),'0088','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','137','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5',@ThisYearJan,@ThisYearJan,getdate(),'0090','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','138','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P22',@ThisYearJan,@ThisYearJan,getdate(),'0090','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','139','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P22',@ThisYearJan,@ThisYearJan,getdate(),'0086','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','118','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3',@ThisYearJan,@ThisYearJan,getdate(),'0076','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','119','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4',@ThisYearJan,@ThisYearJan,getdate(),'0076','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','120','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5',@ThisYearJan,@ThisYearJan,getdate(),'0076','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','121','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P11',@ThisYearJan,@ThisYearJan,getdate(),'0076','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','122','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P22',@ThisYearJan,@ThisYearJan,getdate(),'0076','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),

('2.16.840.1.113883.3.57.1.2.17.88','123','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3',@ThisYearJan,@ThisYearJan,getdate(),'0078','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','124','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4',@ThisYearJan,@ThisYearJan,getdate(),'0078','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','125','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5',@ThisYearJan,@ThisYearJan,getdate(),'0078','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','126','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P11',@ThisYearJan,@ThisYearJan,getdate(),'0078','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','127','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P22',@ThisYearJan,@ThisYearJan,getdate(),'0078','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),

('2.16.840.1.113883.3.57.1.2.17.88','128','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3',@ThisYearJan,@ThisYearJan,getdate(),'0080','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','129','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4',@ThisYearJan,@ThisYearJan,getdate(),'0080','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','130','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5',@ThisYearJan,@ThisYearJan,getdate(),'0080','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','131','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P11',@ThisYearJan,@ThisYearJan,getdate(),'0080','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','132','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P22',@ThisYearJan,@ThisYearJan,getdate(),'0080','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1)


INSERT INTO [Fact].[MetricsResults] (
	 MetricId_Root, MetricId_Extension, PatientId_Root, PatientId_Extension,[EffectiveTime_Start],[EffectiveTime_End], LastUpdatedTime, MetricTypeCode, MetricTypeCodeSystem, Compliance, 
                         InterpretationCodeSystem, InterpretationCode, Clinical_ConceptCodeSystem, Clinical_ConceptCode, Text, Value, 
                         DeleteKey, NodeID, TimeStamp, NewFlag
	)
VALUES
('2.16.840.1.113883.3.57.1.2.17.88','1','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1',@ThisYearJan,@ThisYearJan,getdate(),'0001','2.16.840.1.113883.3.57.1.2.17.89',1,'2.16.840.1.113883.3.57.1.2.19','N',null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','6','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P11',@ThisYearJan,@ThisYearJan,getdate(),'0001','2.16.840.1.113883.3.57.1.2.17.89',0,'2.16.840.1.113883.3.57.1.2.19','VH',null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','7','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P22',@ThisYearJan,@ThisYearJan,getdate(),'0001','2.16.840.1.113883.3.57.1.2.17.89',0,'2.16.840.1.113883.3.57.1.2.19','VH',null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','8','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P33',@ThisYearJan,@ThisYearJan,getdate(),'0001','2.16.840.1.113883.3.57.1.2.17.89',0,'2.16.840.1.113883.3.57.1.2.19','VH',null,null,null,null,0,1,getdate(),1)
-----------------------------------------------------------------------BMI-----------------------------------------------------------------------
--declare @ThisYearJan datetime set @ThisYearJan = cast(cast( datepart(yyyy,getdate())as varchar)+'-01-01 11:27:50.000' as datetime)

INSERT INTO Fact.PopulationClassification(
 PopulationClassificationId, PatientId_Root, PatientId_Extension, ClasificationCode, ClasificationCodeSystem, EffectiveTime_Start, EffectiveTime_End, IsActive, 
                      LastUpdatedTime, DeleteKey, NodeID, TimeStamp, NewFlag)
VALUES         
(37,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1','0009-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(38,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2','0009-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(39,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3','0009-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(40,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4','0009-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(41,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5','0009-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(42,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P22','0009-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(43,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P11','0009-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1)


INSERT INTO [Fact].[MetricsResults] (
	 MetricId_Root, MetricId_Extension, PatientId_Root, PatientId_Extension,[EffectiveTime_Start],[EffectiveTime_End], LastUpdatedTime, MetricTypeCode, MetricTypeCodeSystem, Compliance, 
                         InterpretationCodeSystem, InterpretationCode, Clinical_ConceptCodeSystem, Clinical_ConceptCode, Text, Value, 
                         DeleteKey, NodeID, TimeStamp, NewFlag
	)
VALUES
('2.16.840.1.113883.3.57.1.2.17.88','140','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1',@ThisYearJan,@ThisYearJan,getdate(),'0096','2.16.840.1.113883.3.57.1.2.17.89',1,'2.16.840.1.113883.3.57.1.2.19','N',null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','141','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2',@ThisYearJan,@ThisYearJan,getdate(),'0096','2.16.840.1.113883.3.57.1.2.17.89',1,'2.16.840.1.113883.3.57.1.2.19','H',null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','142','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3',@ThisYearJan,@ThisYearJan,getdate(),'0096','2.16.840.1.113883.3.57.1.2.17.89',1,'2.16.840.1.113883.3.57.1.2.19','N',null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','143','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4',@ThisYearJan,@ThisYearJan,getdate(),'0096','2.16.840.1.113883.3.57.1.2.17.89',1,'2.16.840.1.113883.3.57.1.2.19','H',null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','144','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5',@ThisYearJan,@ThisYearJan,getdate(),'0096','2.16.840.1.113883.3.57.1.2.17.89',1,'2.16.840.1.113883.3.57.1.2.19','L',null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','145','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P22',@ThisYearJan,@ThisYearJan,getdate(),'0096','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','145','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P11',@ThisYearJan,@ThisYearJan,getdate(),'0096','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1)

-----------------------------------------------------------------------End BMI---------------------------------------------------------------------------------

-----------------------------------------------------------------------HTN Pharmacotherapy-----------------------------------------------------------------------
INSERT INTO [Fact].[MetricsResults] (
	 MetricId_Root, MetricId_Extension, PatientId_Root, PatientId_Extension,[EffectiveTime_Start],[EffectiveTime_End], LastUpdatedTime, MetricTypeCode, MetricTypeCodeSystem, Compliance, 
                         InterpretationCodeSystem, InterpretationCode, Clinical_ConceptCodeSystem, Clinical_ConceptCode, Text, Value, 
                         DeleteKey, NodeID, TimeStamp, NewFlag
	)
VALUES
('2.16.840.1.113883.3.57.1.2.17.88','146','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1',@ThisYearJan,@ThisYearJan,getdate(),'0098','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','147','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2',@ThisYearJan,@ThisYearJan,getdate(),'0098','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','148','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3',@ThisYearJan,@ThisYearJan,getdate(),'0098','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','149','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4',@ThisYearJan,@ThisYearJan,getdate(),'0098','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','150','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5',@ThisYearJan,@ThisYearJan,getdate(),'0098','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','158','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P22',@ThisYearJan,@ThisYearJan,getdate(),'0098','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1)



-----------------------------------------------------------------------BP Metric-----------------------------------------------------------------------
INSERT INTO [Fact].[MetricsResults] (
	 MetricId_Root, MetricId_Extension, PatientId_Root, PatientId_Extension,[EffectiveTime_Start],[EffectiveTime_End], LastUpdatedTime, MetricTypeCode, MetricTypeCodeSystem, Compliance, 
                         InterpretationCodeSystem, InterpretationCode, Clinical_ConceptCodeSystem, Clinical_ConceptCode, Text, Value, 
                         DeleteKey, NodeID, TimeStamp, NewFlag
	)
VALUES
('2.16.840.1.113883.3.57.1.2.17.88','159','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1',@ThisYearJan,@ThisYearJan,getdate(),'0106','2.16.840.1.113883.3.57.1.2.17.89',1,'2.16.840.1.113883.3.57.1.2.19','N',null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','160','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2',@ThisYearJan,@ThisYearJan,getdate(),'0106','2.16.840.1.113883.3.57.1.2.17.89',1,'2.16.840.1.113883.3.57.1.2.19','H',null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','161','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3',@ThisYearJan,@ThisYearJan,getdate(),'0106','2.16.840.1.113883.3.57.1.2.17.89',1,'2.16.840.1.113883.3.57.1.2.19','VH',null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','162','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4',@ThisYearJan,@ThisYearJan,getdate(),'0106','2.16.840.1.113883.3.57.1.2.17.89',1,'2.16.840.1.113883.3.57.1.2.19','U',null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','163','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5',@ThisYearJan,@ThisYearJan,getdate(),'0106','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','164','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P22',@ThisYearJan,@ThisYearJan,getdate(),'0106','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','165','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P11',@ThisYearJan,@ThisYearJan,getdate(),'0106','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1)

-----------------------------------------------------------------------out of BP Metric-----------------------------------------------------------------------
INSERT INTO [Fact].[MetricsResults] (
	 MetricId_Root, MetricId_Extension, PatientId_Root, PatientId_Extension,[EffectiveTime_Start],[EffectiveTime_End], LastUpdatedTime, MetricTypeCode, MetricTypeCodeSystem, Compliance, 
                         InterpretationCodeSystem, InterpretationCode, Clinical_ConceptCodeSystem, Clinical_ConceptCode, Text, Value, 
                         DeleteKey, NodeID, TimeStamp, NewFlag
	)
VALUES
('2.16.840.1.113883.3.57.1.2.17.88','166','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1',@ThisYearJan,@ThisYearJan,getdate(),'0102','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1) 


-----------------------------------------------------------------CQM Regressions---------------------------------------------------------------------------------
-----------------------------------------------------------------COPD-----------------------------------------------------------------------
--declare @ThisYearJan datetime set @ThisYearJan = cast(cast( datepart(yyyy,getdate())as varchar)+'-01-01 11:27:50.000' as datetime)

INSERT INTO Fact.PopulationClassification(
 PopulationClassificationId, PatientId_Root, PatientId_Extension, ClasificationCode, ClasificationCodeSystem, EffectiveTime_Start, EffectiveTime_End, IsActive, 
                      LastUpdatedTime, DeleteKey, NodeID, [TimeStamp], NewFlag)
VALUES

(43,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1','0010-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(44,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2','0010-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(45,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3','0010-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(46,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4','0010-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(47,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5','0010-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1),
(48,'2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P11','0010-02','2.16.840.1.113883.3.57.1.2.17.94',@ThisYearJan,'2020-01-01 11:27:50.000',1,GETDATE(),0,1,GETDATE(),1)

-----------------------------------------------------------------------Pharmacoterapy Metric-----------------------------------------------------------------------
INSERT INTO [Fact].[MetricsResults] (
	 MetricId_Root, MetricId_Extension, PatientId_Root, PatientId_Extension,[EffectiveTime_Start],[EffectiveTime_End], LastUpdatedTime, MetricTypeCode, MetricTypeCodeSystem, Compliance, 
                         InterpretationCodeSystem, InterpretationCode, Clinical_ConceptCodeSystem, Clinical_ConceptCode, Text, Value, 
                         DeleteKey, NodeID, TimeStamp, NewFlag
	)
VALUES
('2.16.840.1.113883.3.57.1.2.17.88','167','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1',@ThisYearJan,@ThisYearJan,getdate(),'0118','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','168','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2',@ThisYearJan,@ThisYearJan,getdate(),'0118','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','169','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3',@ThisYearJan,@ThisYearJan,getdate(),'0118','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','170','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4',@ThisYearJan,@ThisYearJan,getdate(),'0118','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','171','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5',@ThisYearJan,@ThisYearJan,getdate(),'0118','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1)


-----------------------------------------------------------------------ED Visit Metric-----------------------------------------------------------------------
INSERT INTO [Fact].[MetricsResults] (
	 MetricId_Root, MetricId_Extension, PatientId_Root, PatientId_Extension,[EffectiveTime_Start],[EffectiveTime_End], LastUpdatedTime, MetricTypeCode, MetricTypeCodeSystem, Compliance, 
                         InterpretationCodeSystem, InterpretationCode, Clinical_ConceptCodeSystem, Clinical_ConceptCode, Text, Value, 
                         DeleteKey, NodeID, TimeStamp, NewFlag
	)
VALUES
('2.16.840.1.113883.3.57.1.2.17.88','172','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1',@ThisYearJan,@ThisYearJan,getdate(),'0116','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','173','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2',@ThisYearJan,@ThisYearJan,getdate(),'0116','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','174','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3',@ThisYearJan,@ThisYearJan,getdate(),'0116','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','175','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4',@ThisYearJan,@ThisYearJan,getdate(),'0116','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','176','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5',@ThisYearJan,@ThisYearJan,getdate(),'0116','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1)


-----------------------------------------------------------------------Admitted Metric-----------------------------------------------------------------------
INSERT INTO [Fact].[MetricsResults] (
	 MetricId_Root, MetricId_Extension, PatientId_Root, PatientId_Extension,[EffectiveTime_Start],[EffectiveTime_End], LastUpdatedTime, MetricTypeCode, MetricTypeCodeSystem, Compliance, 
                         InterpretationCodeSystem, InterpretationCode, Clinical_ConceptCodeSystem, Clinical_ConceptCode, Text, Value, 
                         DeleteKey, NodeID, TimeStamp, NewFlag
	)
VALUES
('2.16.840.1.113883.3.57.1.2.17.88','177','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1',@ThisYearJan,@ThisYearJan,getdate(),'0120','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','178','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2',@ThisYearJan,@ThisYearJan,getdate(),'0120','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','179','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3',@ThisYearJan,@ThisYearJan,getdate(),'0120','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','180','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4',@ThisYearJan,@ThisYearJan,getdate(),'0120','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','181','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5',@ThisYearJan,@ThisYearJan,getdate(),'0120','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1)


-----------------------------------------------------------------------Bronchodilators Metric-----------------------------------------------------------------------
INSERT INTO [Fact].[MetricsResults] (
	 MetricId_Root, MetricId_Extension, PatientId_Root, PatientId_Extension,[EffectiveTime_Start],[EffectiveTime_End], LastUpdatedTime, MetricTypeCode, MetricTypeCodeSystem, Compliance, 
                         InterpretationCodeSystem, InterpretationCode, Clinical_ConceptCodeSystem, Clinical_ConceptCode, Text, Value, 
                         DeleteKey, NodeID, TimeStamp, NewFlag
	)
VALUES

('2.16.840.1.113883.3.57.1.2.17.88','182','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1',@ThisYearJan,@ThisYearJan,getdate(),'0124','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','183','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2',@ThisYearJan,@ThisYearJan,getdate(),'0124','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','184','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3',@ThisYearJan,@ThisYearJan,getdate(),'0124','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','185','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4',@ThisYearJan,@ThisYearJan,getdate(),'0124','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','186','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5',@ThisYearJan,@ThisYearJan,getdate(),'0124','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1)



-----------------------------------------------------------------------Corticosteroids Metric-----------------------------------------------------------------------
INSERT INTO [Fact].[MetricsResults] (
	 MetricId_Root, MetricId_Extension, PatientId_Root, PatientId_Extension,[EffectiveTime_Start],[EffectiveTime_End], LastUpdatedTime, MetricTypeCode, MetricTypeCodeSystem, Compliance, 
                         InterpretationCodeSystem, InterpretationCode, Clinical_ConceptCodeSystem, Clinical_ConceptCode, Text, Value, 
                         DeleteKey, NodeID, TimeStamp, NewFlag
	)
VALUES
('2.16.840.1.113883.3.57.1.2.17.88','187','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P1',@ThisYearJan,@ThisYearJan,getdate(),'0122','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','188','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P2',@ThisYearJan,@ThisYearJan,getdate(),'0122','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','189','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P3',@ThisYearJan,@ThisYearJan,getdate(),'0122','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','190','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P4',@ThisYearJan,@ThisYearJan,getdate(),'0122','2.16.840.1.113883.3.57.1.2.17.89',1,null,null,null,null,null,null,0,1,getdate(),1),
('2.16.840.1.113883.3.57.1.2.17.88','191','2.16.840.1.113883.3.57.1.3.5.52.1.8.6','PHA_EncAT_P5',@ThisYearJan,@ThisYearJan,getdate(),'0122','2.16.840.1.113883.3.57.1.2.17.89',0,null,null,null,null,null,null,0,1,getdate(),1)

