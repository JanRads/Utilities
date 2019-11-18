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
	--@datasrc = 'dbm8-data112\inst02'
	,/* analysis server name (machine name) */
	@catalog = 'Analytics Cube' /* default catalog/database */
GO

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname = N'FDX_3'
	,@useself = N'False'

--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
SELECT cast("[Date].[Month Year].[Month Year].[MEMBER_CAPTION]" AS VARCHAR(6)) AS MonthYearDesc
	  ,cast(convert(FLOAT, "[Measures].[AttributedPatientsScore]") AS DECIMAL(5, 2)) AS AttributedPatientsScore
--select * 
FROM openquery(FDX_3, '  SELECT NON EMPTY { [Measures].[AttributedPatientsScore] } ON COLUMNS,
 NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) }  
 ON ROWS 
 FROM [MSSP] ')

EXEC sp_dropserver 'FDX_3'
	,'droplogins'
