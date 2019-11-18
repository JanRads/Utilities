
--- Run this phase after phase1 
--- FYI: the relevant patients are inserted in phase1 


use dbmSemanticAnalytics
--RuleMetricCode="4000"-1
-- BB 1 -- PopulationClassifications - 6 month 
DECLARE @return_status int;  
DECLARE @inXML xml
SET @inXML=
'<BuildingBlocks BuildingBlockKey="1" Version="1" BuildingBlockName="BB1" BuildingBlockDesc="BB1" BuildingBlockType="1010" 
 KmId="43" Name="women_cervical_cytology" TableName="PopulationClassifications" FieldName="IsActive" FieldType="1" ComplianceType="30" CompliancePeriodCode="10" 
 CompliancePeriodValue="6">
  <BuildingBlocksConditions>
    <BuildingBlocksCondition SequenceId="1" OperatorId="3" Value1="1"/>
  </BuildingBlocksConditions>
</BuildingBlocks>
'

exec @return_status = dbo.BBSql_Create @inXML
--SELECT 'Return Status' = @return_status; 

--rollback

go



--3000 --
-- BB 2 -- metric results - 2Q
DECLARE @return_status int;  
DECLARE @inXML xml
SET @inXML=
'<BuildingBlocks BuildingBlockKey="2" Version="1" BuildingBlockName="BB2" BuildingBlockDesc="BB2" BuildingBlockType="1010" 
KmId="76" Name="Lead Test" TableName="MetricResults" FieldName="Value" FieldType="1" ComplianceType="30" CompliancePeriodCode="20" 
 CompliancePeriodValue="2">
  <BuildingBlocksConditions>
    <BuildingBlocksCondition SequenceId="1" OperatorId="3" Value1="50"/>
  </BuildingBlocksConditions>
</BuildingBlocks>
'

exec @return_status = dbo.BBSql_Create @inXML


 go
 --3001--3
-- BB 3 -- metric Results - Winter
DECLARE @return_status int;  
DECLARE @inXML xml
SET @inXML=
'<BuildingBlocks BuildingBlockKey="3" Version="1" BuildingBlockName="BB3" BuildingBlockDesc="BB3" BuildingBlockType="1010" 
KmId="10165" Name="Unilateral mastectomy And a bilateral modifier" TableName="MetricResults" FieldName="Value" FieldType="1" ComplianceType="30" CompliancePeriodCode="40" 
 CompliancePeriodValue="3">
  <BuildingBlocksConditions>
    <BuildingBlocksCondition SequenceId="1" OperatorId="3" Value1="50"/>
  </BuildingBlocksConditions>
</BuildingBlocks>
'

exec @return_status = dbo.BBSql_Create @inXML

go 
--5000--4
-- BB 4 -- PopulationClassifications - Forever  
DECLARE @return_status int;  
DECLARE @inXML xml
SET @inXML=
'<BuildingBlocks BuildingBlockKey="4" Version="1" BuildingBlockName="BB4" BuildingBlockDesc="BB4" BuildingBlockType="1010" 
KmId="10175" Name="Right unilateral mastectomy" TableName="PopulationClassifications" FieldName="IsActive" FieldType="1" ComplianceType="10" CompliancePeriodCode="10" 
 CompliancePeriodValue="6">
  <BuildingBlocksConditions>
    <BuildingBlocksCondition SequenceId="1" OperatorId="3" Value1="1"/>
  </BuildingBlocksConditions>
</BuildingBlocks>
'

exec @return_status = dbo.BBSql_Create @inXML

go
--3000--2
-- BB 2 -- metric results - 2Q
DECLARE @return_status int;  
DECLARE @inXML xml
SET @inXML=
'<BuildingBlocks BuildingBlockKey="55" Version="1" BuildingBlockName="BB2" BuildingBlockDesc="BB2" BuildingBlockType="1010" 
KmId="76" Name="Lead Test" TableName="MetricResults" FieldName="Value" FieldType="1" ComplianceType="40" 
 ComplianceStartMonth="6" ComplianceEndMonth="6" ComplianceYears="3" ComplianceStartYear="0">
  <BuildingBlocksConditions>
    <BuildingBlocksCondition SequenceId="1" OperatorId="3" Value1="50"/>
  </BuildingBlocksConditions>
</BuildingBlocks>
'

exec @return_status = dbo.BBSql_Create @inXML


 go
 --3001
-- BB 3 -- metric Results - Winter
DECLARE @return_status int;  
DECLARE @inXML xml
SET @inXML=
'<BuildingBlocks BuildingBlockKey="77" Version="1" BuildingBlockName="BB3" BuildingBlockDesc="BB3" BuildingBlockType="1010" 
KmId="10165" Name="Unilateral mastectomy And a bilateral modifier" TableName="MetricResults" FieldName="Value" FieldType="1" ComplianceType="40" ComplianceStartMonth="6" ComplianceEndMonth="12" ComplianceYears="0" ComplianceStartYear="1">
  <BuildingBlocksConditions>
    <BuildingBlocksCondition SequenceId="1" OperatorId="3" Value1="50"/>
  </BuildingBlocksConditions>
</BuildingBlocks>
'

exec @return_status = dbo.BBSql_Create @inXML

go 