SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

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
	--@datasrc='dbm8-data112\inst02',      /* analysis server name (machine name) */
	@datasrc = @@SERVERNAME 	,/* analysis server name (machine name) */
	@catalog = 'Analytics Cube' /* default catalog/database */
GO

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname = N'FDX_3'
	,@useself = N'False'

DECLARE @TestMonth VARCHAR(7) = cast(datepart(yyyy, getdate()) AS VARCHAR) + '_02'
--select * from openquery(FDX_3, ' SELECT NON EMPTY { [Measures].[PatientProviderCount] } ON COLUMNS, NON EMPTY { ([Date].[Month Year].[Month Year].ALLMEMBERS ) } DIMENSION PROPERTIES MEMBER_CAPTION ON ROWS FROM [CPM]')
DECLARE @Myquery VARCHAR(max) = 'select 
cast("[Patients].[Patient].[Patient].[MEMBER_CAPTION]" as varchar(100)) as Patient,
cast("[Severity Combs].[Severity_type].[Severity_type].[MEMBER_CAPTION]" as varchar(10)) as Severity_type,
 CAST(cast("[Severity Combs].[Indicator_num].[Indicator_num].[MEMBER_CAPTION]" as varchar(10)) as int) as Indicator_num,
cast("[Measures].[TotalPatientRank]" as money) as TotalPatientRank , 
cast("[Measures].[score_lastmonth]" as money) as score_lastmonth

from openquery(FDX_3, ''
with member [Measures].[FreeForm_0] as  [Severity Combs].[Indicator_num].currentmember.name   
member [Measures].[FreeForm_1] as  iif(intersect([top1000set]  ,{[Patients].[Patient].currentmember}).count> 0, 1.0,  0 ) 
set [dim0_filter_comp0] as  Filter([Patients].[Patient].[Patient].AllMembers, [Measures].[FreeForm_1] = 1.0) 
set [dim1_leafset] as  {[Patients].[Gender].[Gender].AllMembers} 
set [dim2_leafset] as  {[Severity Combs].[Severity_type].[Severity_type].AllMembers} 
set [dim3_leafset] as  {[Severity Combs].[Indicator_num].[Indicator_num].AllMembers} 
set [dim4_leafset] as  {[Patients].[Age].[Age].AllMembers}
set [starting_set] as  Filter(CROSSJOIN(CROSSJOIN(CROSSJOIN(CROSSJOIN(nonempty({[dim0_filter_comp0]}, {[Measures].[TotalPatientRank]}), nonempty([dim1_leafset], {[Measures].[TotalPatientRank]})), nonempty([dim2_leafset], {[Measures].[TotalPatientRank]})), nonempty([dim3_leafset], {[Measures].[TotalPatientRank]})), nonempty([dim4_leafset], {[Measures].[TotalPatientRank]})), [Measures].[Community] > 0) 
set [final_set] as {Generate([starting_set], CROSSJOIN(CROSSJOIN(CROSSJOIN(CROSSJOIN(nonempty({[Patients].[Patient].CurrentMember}, {[Measures].[TotalPatientRank]}), nonempty({[Patients].[Gender].CurrentMember}, {[Measures].[TotalPatientRank]})), nonempty({[Severity Combs].[Severity_type].CurrentMember}, {[Measures].[TotalPatientRank]})), nonempty({[Severity Combs].[Indicator_num].CurrentMember}, {[Measures].[TotalPatientRank]})), nonempty({[Patients].[Age].CurrentMember}, {[Measures].[TotalPatientRank]})))}
select {[Measures].[TotalPatientRank], [Measures].[Patient Rank], [Measures].[Score_LastMonth], [Measures].[FreeForm_0]} on columns,
non empty hierarchize({[final_set]}) on rows
from [CPM]
where ([Date].[Month Year].&[' + @TestMonth +']) 
'') order by 1'

EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname = N'FDX_3'
	,@useself = N'False'

EXEC (@Myquery)

EXEC sp_dropserver 'FDX_3'
	,'droplogins'

