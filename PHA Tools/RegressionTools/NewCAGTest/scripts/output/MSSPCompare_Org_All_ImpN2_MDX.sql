
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
    -- @datasrc='dbm8-data112\inst02',   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

--declare @Month varchar(7) = (select MonthYear
--                            from [Dim].[Dates]
--		                    where DateKey =  cast( datepart(yyyy,getdate())as varchar)+'0101')
declare @Myquery varchar (max) = '
select 
cast("[MSSP  Dim].[MSSP Key].[MSSP Key].[MEMBER_CAPTION]" as varchar(80)) as MeasureName,
 CAST(cast("[Organization].[Level3].[Level3].[MEMBER_CAPTION]" as varchar(60)) as varchar(60)) as Organization,
 cast("[Junc Dim].[comb mssp].[comb mssp].[MEMBER_CAPTION]" as varchar(30)) as [vector_L3],
cast("[Junc Dim MAN].[Care Provider Key].[Care Provider Key].[MEMBER_CAPTION]" as varchar(5)) as [Care Provider Key] , 
--cast("[Junc Dim MAN].[Organization Key].[Organization Key].[MEMBER_CAPTION]" as varchar(5)) as [Organization Key],


cast("[Measures].[MeasureScore]" as float ) as MeasureScore , 
cast("[Measures].[PrevMeasureScore]" as float ) as PrevMeasureScore,
cast("[Measures].[Measure Member Ind]" as float ) as [Measure Member Ind] , 
cast("[Measures].[Measure Population Ind]" as float ) as [Measure Population Ind] , 
cast("[Measures].[ImpN]" as int ) as ImpN,
cast("[Measures].[AttributedPatientsScore]" as float ) as AttributedPatientsScore , 
cast("[Measures].[mssp_precentile]" as float ) as mssp_precentile,

cast("[Measures].[mssp_points]" as float ) as mssp_points,
cast("[Measures].[mssp_target]" as float ) as mssp_target , 
cast("[Measures].[gap]" as float ) as gap,
cast("[Measures].[PrevDenominator]" as float ) as PrevDenominator  
--,cast("[Measures].[org_filt]" as int ) as org_filt





 from openquery(FDX_3,'' 
 ------------------------------------------------------------------------------------------------------
 with set [dim1_leafset] as {[Organization].[Level3].[Level3].AllMembers}
set [dim2_leafset] as {[Junc Dim].[comb mssp].[comb mssp].AllMembers}
set [dim3_leafset] as {[Junc Dim MAN].[Care Provider Key].[Care Provider Key].AllMembers}
set [dim4_leafset] as {[Junc Dim MAN].[Organization Key].[Organization Key].AllMembers}
set [starting_set] as Filter(CROSSJOIN(CROSSJOIN(CROSSJOIN(CROSSJOIN({[MSSP  Dim].[MSSP Key].&[5]}, [dim1_leafset]), [dim2_leafset]), [dim3_leafset]), [dim4_leafset]),
 [Measures].[Measure Population Ind] <> 0.0)

set [final_set] as {Generate([starting_set], CROSSJOIN(CROSSJOIN(CROSSJOIN(CROSSJOIN({[MSSP  Dim].[MSSP Key].CurrentMember},
 {[Organization].[Level3].CurrentMember}), {[Junc Dim].[comb mssp].CurrentMember}), {[Junc Dim MAN].[Care Provider Key].CurrentMember}),
  {[Junc Dim MAN].[Organization Key].CurrentMember}))}

select {[Measures].[MeasureScore], [Measures].[PrevMeasureScore], [Measures].[Measure Member Ind],
 [Measures].[Measure Population Ind], [Measures].[ImpN],
 [Measures].[AttributedPatientsScore], [Measures].[mssp_precentile], [Measures].[mssp_points],
  [Measures].[mssp_target], [Measures].[gap], [Measures].[PrevDenominator], [Measures].[org_filt]} 
  on columns,

non empty hierarchize({[final_set]}) on rows
from [MSSP]
where ([Date].[Month Year].&[2015_04], [Junc Dim MAN].[Cpo].&[A_A])

'') '







--select @Myquery
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

 EXEC sp_dropserver 'FDX_3', 'droplogins'