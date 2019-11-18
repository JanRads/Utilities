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
     --@datasrc='dbm8-data111\inst03',   /* analysis server name (machine name) $(OlapServer)*/
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

declare @ThisYear nvarchar(4) = year(getdate())

declare @Myquery varchar (max) = 
'select  
cast("[Measures].[MonthYear]" as varchar(20)) as MonthYear,
cast("[Measures].[patients counted in community of the org]" as INT) as PopDistinctPatients
 from openquery(FDX_3,'' with 
member MonthYear as [Date].[Month Year].currentmember.properties("key") 
SELECT NON EMPTY 
{ MonthYear, [Measures].[patients counted in community of the org] } ON COLUMNS, 
NON EMPTY { ([Date].[Month Year].[all].children ) }  ON ROWS 
FROM [CPM] 
where ({[Date].[Year].&['+@Thisyear+']})'')'
--select @Myquery
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

EXEC sp_dropserver 'FDX_3', 'droplogins'

