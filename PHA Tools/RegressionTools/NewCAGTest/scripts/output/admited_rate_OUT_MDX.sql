SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET NOCOUNT ON

IF EXISTS (
		SELECT *
		FROM sys.servers
		WHERE NAME = N'FDX_3'
		)
	EXEC sp_dropserver 'FDX_3'
		,'droplogins'

EXEC sp_addlinkedserver @server = 'FDX_3'
	,/* local SQL name given to the 
                                 linked server */
	@srvproduct = ''
	,/* not used */
	@provider = 'MSOLAP'
	,/* OLE DB provider */
	@datasrc = @@servername
	,/* analysis server name (machine name) */
	@catalog = 'Analytics Cube' /* default catalog/database */
GO

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname = N'FDX_3'
	,@useself = N'False'

--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
SELECT cast("[Date Discharge Index Adm].[Month Year].[Month Year].[MEMBER_CAPTION]" AS VARCHAR(6)) AS Year_Month
--	,cast("[Measures].[Numerator]" AS INT) AS admitted_rate_out_numerator
--	,cast("[Measures].[Denominator]" AS INT) AS admitted_rate_out_denuminator
	,cast(convert(FLOAT, "[Measures].[score]") AS DECIMAL(5, 2)) AS admitted_rate_out_score
--select * 
FROM openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[Numerator], [Measures].[Score], [Measures].[Denominator] } ON COLUMNS, NON EMPTY { ([Date Discharge Index Adm].[Month Year].[Month Year].ALLMEMBERS ) } ON ROWS FROM ( SELECT ( { [Generic Measures].[CalcName].&[13] } ) ON COLUMNS FROM [Readmissions]) WHERE ( [Generic Measures].[CalcName].&[13] ) ')
WHERE cast("[Measures].[Numerator]" AS INT) > 0

EXEC sp_dropserver 'FDX_3'
	,'droplogins'
