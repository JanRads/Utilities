-- --Actual Readmissions Payor

 SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
if  exists(select * from sys.servers where name = N'FDX_3')
 EXEC sp_dropserver 'FDX_3', 'droplogins'
 
EXEC sp_addlinkedserver
     @server='FDX_3',   /* local SQL name given to the 
                                 linked server */
     @srvproduct='',          /* not used */
     @provider='MSOLAP',      /* OLE DB provider */
	 @datasrc='$(OlapServer)',   /* analysis server name (machine name) $(OlapServer)  */
    -- @datasrc='dbm8-data111\inst03',   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'
declare @Myquery varchar (max) =  '

select cast("[Patients].[Patient Key].[Patient Key].[MEMBER_CAPTION]" as varchar(100)) as Patient,
cast("[Programs].[Id Programs].[Id Programs].[MEMBER_CAPTION]" as varchar(30)) as Payer,
cast("[Measures].[Count Readmissions]" as int) as [Count Readmissions],
cast("[Measures].[LOS Readmission]" as int) as [LOS Readmission]

 from openquery(FDX_3,''

 
 select non empty{ [Measures].[Count Readmissions], [Measures].[LOS Readmission] } ON COLUMNS, 
 NON EMPTY { ([Patients].[Patient Key].[Patient Key].ALLMEMBERS * 
 [Programs].[Id Programs].[Id Programs].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION, 
 MEMBER_UNIQUE_NAME ON ROWS 
 FROM [Readmissions] ''
 )
'
--select @Myquery
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

 EXEC sp_dropserver 'FDX_3', 'droplogins'