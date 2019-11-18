SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET NOCOUNT ON
if  exists(select * from sys.servers where name = N'FDX_3')
EXEC sp_dropserver 'FDX_3', 'droplogins'


EXEC sp_addlinkedserver
     @server='FDX_3',   /* local SQL name given to the 
                                 linked server */
     @srvproduct='',          /* not used */
     @provider='MSOLAP',      /* OLE DB provider */
     @datasrc='$(OlapServer)',   /* analysis server name (machine name) $(OlapServer)*/
     @catalog='Analytics Cube'      /* default catalog/database */
Go 


EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
select    cast("[Days to readmission].[DTR Group].[DTR Group].[MEMBER_CAPTION]"  as varchar(15)) as DTR_Group
,isnull(cast("[Measures].[Numerator]" as int ) , 0) as readmission_rate_in__dtr_numerator,
isnull(cast("[Measures].[Denominator]" as int) , 0)   as readmission_rate_in_dtr_denominator ,


  cast(cast( isnull("[Measures].[score_1]",'0') as numeric)  / 10000000000 as  decimal(5,2))  as  readmission_rate_in_dtr_score

from openquery(FDX_3, '  WITH     MEMBER [Measures].[score_1] AS [Measures].[score] *10000000000  SELECT NON EMPTY {  [Measures].[Numerator],[Measures].[Denominator] , [Measures].[Score_1] } ON COLUMNS  ,  { ([Days to readmission].[DTR Group].[DTR Group].ALLMEMBERS ) }  ON ROWS  FROM ( SELECT ( { [Generic Measures].[CalcName].&[5] } ) ON COLUMNS FROM [Readmissions])  WHERE ( [Generic Measures].[CalcName].&[5] )  ')
--order by  readmission_rate_in__dtr_numerator
EXEC sp_dropserver 'FDX_3', 'droplogins'
