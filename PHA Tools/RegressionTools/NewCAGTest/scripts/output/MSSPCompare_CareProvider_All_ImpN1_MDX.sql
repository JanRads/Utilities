
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
     --@datasrc='dbm8-data112\inst01',   /* @datasrc='$(OlapServer)'   analysis server name (machine name) */
     @catalog='Analytics Cube'      /* default catalog/database */
Go 

declare @Month varchar(7) =(select MonthYear
                            from [Dim].[Dates]
		                    where DateKey =  cast( datepart(yyyy,getdate())as varchar)+'0101')
declare @Myquery varchar (max) = '

select 
cast("[MSSP  Dim].[MSSP Key].[MSSP Key].[MEMBER_CAPTION]" as varchar(80)) as MeasureName,
CAST(cast("[MSSP  Dim].[Group Name].[Group Name].[MEMBER_CAPTION]" as varchar(60)) as varchar(60)) as [Group Name],
cast("[Care Providers].[Care Provider].[Care Provider].[MEMBER_CAPTION]" as varchar(15)) as [Care Provider] , 
cast("[Organization].[Level3].[Level3].[MEMBER_CAPTION]" as varchar(15)) as [OrganizationKey],
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


 from openquery(FDX_3,'' 

with set [dim1_leafset] as {[MSSP  Dim].[Group Name].[Group Name].AllMembers}
set [dim2_leafset] as {[Care Providers].[Care Provider].[Care Provider].AllMembers}
set [starting_set] as Filter(CROSSJOIN(CROSSJOIN(CROSSJOIN({[MSSP  Dim].[MSSP Key].&[17]}, [dim1_leafset]), [dim2_leafset]), {[Organization].[Level3].&[-3]}), [Measures].[Measure Population Ind] <> 0.0)
set [final_set] as {Generate([starting_set], CROSSJOIN(CROSSJOIN(CROSSJOIN({[MSSP  Dim].[MSSP Key].CurrentMember}, {[MSSP  Dim].[Group Name].CurrentMember}), {[Care Providers].[Care Provider].CurrentMember}), {[Organization].[Level3].CurrentMember}))}
select {[Measures].[MeasureScore], [Measures].[PrevMeasureScore], [Measures].[Measure Member Ind], [Measures].[Measure Population Ind], [Measures].[ImpN], [Measures].[AttributedPatientsScore], [Measures].[mssp_precentile], [Measures].[mssp_points], [Measures].[mssp_target], [Measures].[gap], [Measures].[PrevDenominator]} on columns,
non empty hierarchize({[final_set]}) on rows
from [MSSP]
where ([Date].[Month Year].&['+@month+'])

'') order by 3 '







--select @Myquery
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'FDX_3',@useself=N'False'

exec(@Myquery)

 EXEC sp_dropserver 'FDX_3', 'droplogins'