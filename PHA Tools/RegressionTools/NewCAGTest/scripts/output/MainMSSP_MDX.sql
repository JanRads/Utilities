
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
    -- @datasrc='dbm8-data112\inst01',   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

declare @Month varchar(7) = (select MonthYear
                            from [Dim].[Dates]
		                    where DateKey =  cast( datepart(yyyy,getdate())as varchar)+'0101')
declare @Myquery varchar (max) = '
select 
cast("[Date].[Month Year].[Month Year].[MEMBER_CAPTION]" as varchar(6)) as MonthYearDesc,
cast("[MSSP  Dim].[MSSP Key].[MSSP Key].[MEMBER_CAPTION]" as varchar(80)) as MeasureName,
 CAST(cast("[MSSP  Dim].[Imp N].[Imp N].[MEMBER_CAPTION]" as varchar(10)) as varchar(3)) as ImpN,
cast("[MSSP  Dim].[Group Name].[Group Name].[MEMBER_CAPTION]" as varchar(30)) as GroupName , 
cast("[Organization].[Level3].[Level3].[MEMBER_CAPTION]" as varchar(3)) as Org,
cast("[Care Providers].[Care Provider].[Care Provider].[MEMBER_CAPTION]" as varchar(3)) as CareProvider,
cast("[Measures].[MeasureScore]" as float ) as MeasureScore , 
cast("[Measures].[PrevMeasureScore]" as float ) as PrevMeasureScore,
cast("[Measures].[Measure Member Ind]" as float ) as [Measure Member Ind] , 
cast("[Measures].[ImpN]" as int ) as ImpN,
cast("[Measures].[AttributedPatientsScore]" as float ) as AttributedPatientsScore , 
cast("[Measures].[mssp_precentile]" as float ) as mssp_precentile,

cast("[Measures].[mssp_points]" as float ) as mssp_points,
cast("[Measures].[mssp_target]" as float ) as mssp_target , 
cast("[Measures].[gap]" as float ) as gap,
cast("[Measures].[Den]" as float ) as Den,
cast("[Measures].[PrevDenominator]" as float ) as PrevDenominator  



 from openquery(FDX_3,'' 

with set [dim1_select_members] as {[MSSP  Dim].[MSSP Key].[MSSP Key].AllMembers}
set [dim2_select_members] as {[MSSP  Dim].[Imp N].[Imp N].AllMembers}
set [dim3_select_members] as {[MSSP  Dim].[Group Name].[Group Name].AllMembers}
select {[Measures].[MeasureScore], [Measures].[PrevMeasureScore], [Measures].[Measure Member Ind], [Measures].[ImpN],
        [Measures].[AttributedPatientsScore], [Measures].[mssp_precentile], [Measures].[mssp_points], [Measures].[mssp_target],
	    [Measures].[gap], [Measures].[Den], [Measures].[PrevDenominator]}
		 on columns,
		 filter(
 CROSSJOIN(CROSSJOIN(CROSSJOIN(CROSSJOIN(CROSSJOIN(
          {[Date].[Month Year].&['+ @Month +']}, [dim1_select_members]), [dim2_select_members]), [dim3_select_members]),
		   {[Organization].[Level3].&[-3]}), {[Care Providers].[Care Provider].&[-2]}),[Measures].[MeasureScore]<> 0.0) on rows
from [MSSP]

'') '



--select @Myquery
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

 EXEC sp_dropserver 'FDX_3', 'droplogins'