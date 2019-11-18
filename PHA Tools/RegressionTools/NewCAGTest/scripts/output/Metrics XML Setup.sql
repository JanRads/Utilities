
--- Run this phase after phase1 
--- FYI: the relevant patients are inserted in phase1 


use [dbmSemanticAnalyticsSTG]

-- Metric 1 -- patient in the NUM : id - 159
DECLARE @return_status int;  
DECLARE @inXML xml
SET @inXML=
'<Metrics MetricKey="1" Version="1" MetricName="Coronary Artery Disease"  Description="Coronary Artery Disease" Author="Regression_Avishag" 
		 Source="Regression_Avishag" level1="3" level2="1" level3="1" InHierarchy = "1" ImpN="1" Weight="15" TrendColor="1" 
		 MeasurePL="28" TargetScore="0.67">
  
  <NumMetricsConditions>
    <MetricsCondition MetricKey="1" SequenceId="1" OperatorId="103" BBKey="-1" MetricElementType="1030"/> 
	<MetricsCondition MetricKey="1" SequenceId="2" OperatorId="3" BBKey="3" MetricElementType="1030"/> 
	<MetricsCondition MetricKey="1" SequenceId="3" OperatorId="102" BBKey="-1" MetricElementType="1030"/> 
	<MetricsCondition MetricKey="1" SequenceId="4" OperatorId="3" BBKey="4" MetricElementType="1030"/> 
	<MetricsCondition MetricKey="1" SequenceId="5" OperatorId="104" BBKey="-1" MetricElementType="1030"/> 
	<MetricsCondition MetricKey="1" SequenceId="6" OperatorId="101" BBKey="-1" MetricElementType="1030"/> 
	<MetricsCondition MetricKey="1" SequenceId="7" OperatorId="4" BBKey="2" MetricElementType="1030"/> 
  </NumMetricsConditions>
  
  <DenMetricsConditions>
    <MetricsCondition MetricKey="1" SequenceId="1" OperatorId="3" BBKey="3" MetricElementType="1040"/> 
  </DenMetricsConditions>
  
</Metrics>
'

exec @return_status = [dbo].[MetricSQL_Create] @inXML

go 


-- Metric 2 -- patient in the NUM : id - 159, 156
DECLARE @return_status int;  
DECLARE @inXML xml
SET @inXML=
'
<Metrics MetricKey="2" Version="1" MetricName="HBA1C"  Description="HBA1C" Author="Regression_Avishag" 
		 Source="Regression_Avishag" level1="3" level2="2" level3="2" InHierarchy = "1" ImpN="1" Weight="15" TrendColor="1" 
		 MeasurePL="28" TargetScore="1.00">
  
  <NumMetricsConditions>
    <MetricsCondition MetricKey="2" SequenceId="1" OperatorId="103" BBKey="-1" MetricElementType="1030"/> 
	<MetricsCondition MetricKey="2" SequenceId="2" OperatorId="3" BBKey="3" MetricElementType="1030"/> 
	<MetricsCondition MetricKey="2" SequenceId="3" OperatorId="102" BBKey="-1" MetricElementType="1030"/> 
	<MetricsCondition MetricKey="2" SequenceId="4" OperatorId="3" BBKey="1" MetricElementType="1030"/> 
	<MetricsCondition MetricKey="2" SequenceId="5" OperatorId="104" BBKey="-1" MetricElementType="1030"/> 
	<MetricsCondition MetricKey="2" SequenceId="6" OperatorId="105" BBKey="-1" MetricElementType="1030"/> 
	<MetricsCondition MetricKey="2" SequenceId="7" OperatorId="3" BBKey="2" MetricElementType="1030"/> 
  </NumMetricsConditions>
  
  <DenMetricsConditions>
    <MetricsCondition MetricKey="2" SequenceId="1" OperatorId="3" BBKey="3" MetricElementType="1040"/> 
	<MetricsCondition MetricKey="2" SequenceId="2" OperatorId="102" BBKey="-1" MetricElementType="1040"/> 
	<MetricsCondition MetricKey="2" SequenceId="3" OperatorId="3" BBKey="1" MetricElementType="1040"/> 
  </DenMetricsConditions>
  
</Metrics>

'

exec @return_status = [dbo].[MetricSQL_Create] @inXML

go 

-- Metric 1 -- patient in the NUM : id - 157
DECLARE @return_status int;  
DECLARE @inXML xml
SET @inXML=
'
<Metrics MetricKey="3" Version="1" MetricName="BMI"  Description="BMI" Author="Regression_Avishag" 
		 Source="Regression_Avishag" level1="3" level2="3" level3="3" InHierarchy = "1" ImpN="1" Weight="15" TrendColor="1" 
		 MeasurePL="28" TargetScore="1.00">
  
  <NumMetricsConditions>
    <MetricsCondition MetricKey="3" SequenceId="1" OperatorId="3" BBKey="1" MetricElementType="1030"/> 
	<MetricsCondition MetricKey="3" SequenceId="2" OperatorId="101" BBKey="-1" MetricElementType="1030"/> 
	<MetricsCondition MetricKey="3" SequenceId="3" OperatorId="3" BBKey="2" MetricElementType="1030"/> 
  </NumMetricsConditions>
  
  <DenMetricsConditions>
	<MetricsCondition MetricKey="3" SequenceId="1" OperatorId="3" BBKey="4" MetricElementType="1040"/> 
	<MetricsCondition MetricKey="3" SequenceId="2" OperatorId="102" BBKey="-1" MetricElementType="1040"/> 
	<MetricsCondition MetricKey="3" SequenceId="3" OperatorId="3" BBKey="2" MetricElementType="1040"/> 
	<MetricsCondition MetricKey="3" SequenceId="4" OperatorId="102" BBKey="-1" MetricElementType="1040"/> 
	<MetricsCondition MetricKey="3" SequenceId="5" OperatorId="3" BBKey="3" MetricElementType="1040"/> 
	<MetricsCondition MetricKey="3" SequenceId="6" OperatorId="102" BBKey="-1" MetricElementType="1040"/> 
	<MetricsCondition MetricKey="3" SequenceId="7" OperatorId="3" BBKey="1" MetricElementType="1040"/> 
  </DenMetricsConditions>
  
</Metrics>


'

exec @return_status = [dbo].[MetricSQL_Create] @inXML

go 

-- Metric 4 -- patient in the NUM : id - 160
DECLARE @return_status int;  
DECLARE @inXML xml
SET @inXML=
'
<Metrics MetricKey="4" Version="1" MetricName="Pnemovax"  Description="Pnemovax" Author="Regression_Avishag" 
		 Source="Regression_Avishag" level1="3" level2="4" level3="4" InHierarchy = "1" ImpN="1" Weight="15" TrendColor="1" 
		 MeasurePL="28" TargetScore="1.00">
  
  <NumMetricsConditions>
    <MetricsCondition MetricKey="4" SequenceId="1" OperatorId="3" BBKey="4" MetricElementType="1030"/> 
  </NumMetricsConditions>
  
  <DenMetricsConditions>
    <MetricsCondition MetricKey="4" SequenceId="1" OperatorId="3" BBKey="4" MetricElementType="1040"/> 
	<MetricsCondition MetricKey="4" SequenceId="2" OperatorId="102" BBKey="-1" MetricElementType="1040"/> 
	<MetricsCondition MetricKey="4" SequenceId="3" OperatorId="3" BBKey="2" MetricElementType="1040"/> 
	<MetricsCondition MetricKey="4" SequenceId="4" OperatorId="102" BBKey="-1" MetricElementType="1040"/> 
	<MetricsCondition MetricKey="4" SequenceId="5" OperatorId="3" BBKey="3" MetricElementType="1040"/> 
	<MetricsCondition MetricKey="4" SequenceId="6" OperatorId="102" BBKey="-1" MetricElementType="1040"/> 
	<MetricsCondition MetricKey="4" SequenceId="7" OperatorId="3" BBKey="1" MetricElementType="1040"/> 
  </DenMetricsConditions>
  
</Metrics>

'

exec @return_status = [dbo].[MetricSQL_Create] @inXML

go 