SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

EXEC sp_addlinkedserver
     @server='FDX_3',   /* local SQL name given to the 
                                 linked server */
     @srvproduct='',          /* not used */
     @provider='MSOLAP',      /* OLE DB provider */
     @datasrc='DBM8-DATA111\INST03',      /* analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
select * from openquery(FDX_3, 'SELECT NON EMPTY { [Measures].[Denominator] } ON COLUMNS FROM ( SELECT ( { [Date].[Month Year].&[2013_11] } ) ON COLUMNS FROM [CPM]) WHERE ( [Date].[Month Year].&[2013_11] ) CELL PROPERTIES VALUE, BACK_COLOR, FORE_COLOR, FORMATTED_VALUE, FORMAT_STRING, FONT_NAME, FONT_SIZE, FONT_FLAGS')
 EXEC sp_dropserver 'FDX_3', 'droplogins'