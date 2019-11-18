with #templinks as
(
  select distinct ChildCodeKey, ParentCodeKey, dimname, [RelationType]
 
  from
		  (		 select distinct b.AdminCodeKey ChildCodeKey,
  				  c.AdminCodeKey ParentCodeKey,
				  MAX(DeleteKey) over (partition by b.AdminCodeKey,  c.AdminCodeKey) maxi ,
				  MAX(TimeStamp) over (partition by b.AdminCodeKey,  c.AdminCodeKey) maxi_t,
				  timestamp,
				  b.DimName,
				  a.[RelationType]
				  from
					[dbmClinicalAnalyticsGateway].[MasterData].[CodesLinksInternal_v] a
					left join [dbmSemanticAnalyticsSTG].[Persist].DimAdminCodes b
					on a.SourceCodeId = b.CodeId
					left join [dbmSemanticAnalyticsSTG].[Persist].DimAdminCodes c
					on a.TargetCodeId = c.CodeId
				  where c.DimName = b.dimname
				  and ([RelationType] like 'Equa%' or [RelationType] like 'Sub%')
				 -- and [DeleteKey] = 0
				  union 
				  select distinct b.AdminCodeKey s,
  				  c.AdminCodeKey t,
				  MAX(DeleteKey) over (partition by b.AdminCodeKey,  c.AdminCodeKey) maxi ,
				  MAX(TimeStamp) over (partition by b.AdminCodeKey,  c.AdminCodeKey) maxi_t,
				  timestamp,
				  b.DimName,
				  a.[RelationType]				  
				  from
					[dbmClinicalAnalyticsGateway].[MasterData].[CodesLinksInternal_v] a
					left join [dbmSemanticAnalyticsSTG].[Persist].DimAdminCodes b
					on a.SourceCodeId = b.CodeId
					left join [dbmSemanticAnalyticsSTG].[Persist].DimAdminCodes c
					on a.TargetCodeId = c.CodeId
				  where c.DimName <> b.dimname and (c.DimName = '-1' or  b.DimName = '-1')
				  and ([RelationType] like 'Equa%' or [RelationType] like 'Sub%')
				 -- and [DeleteKey] = 0
								
		  ) q
  where 
		maxi <> 1
		and maxi_t = timestamp
)

--select *
--from links

select count(*) cnt,
dimname
from
(
select   a.ChildCodeKey,
	   b.ParentCodeKey,		
	   --a.flagnew,
	   a.DimName
from 
#templinks a
join #templinks b
on a.ParentCodeKey = b.ChildCodeKey
where a.RelationType like 'sub%'
	  and b.RelationType like 'equals%'
	  --and (a.FlagNew = 1 and b.FlagNew = 1)

	  union

select  b.ChildCodeKey,	a.ParentCodeKey , 
	  -- a.flagnew,
	   a.DimName
from 
#templinks a
join #templinks b
on a.ChildCodeKey = b.ParentCodeKey
where a.RelationType like 'sub%'
	  and b.RelationType like 'equals%'
	 -- and (a.FlagNew = 1 and b.FlagNew = 1)
	  union

select a.ChildCodeKey,	b.ChildCodeKey,
		--a.FlagNew,
		a.DimName from 
#templinks a
join #templinks b
on b.ParentCodeKey = a.ParentCodeKey
where a.RelationType like 'sub%'
	  and b.RelationType like 'equals%'
	 -- and (a.FlagNew = 1 and b.FlagNew = 1)

	  union

select b.ParentCodeKey,	a.ParentCodeKey,
		--a.FlagNew,
		a.DimName from 
#templinks a
join #templinks b
on b.ChildCodeKey = a.ChildCodeKey
where a.RelationType like 'sub%'
	  and b.RelationType like 'equals%'
	  --and (a.FlagNew = 1 and b.FlagNew = 1)

	  union

-- subs and local to BL as is
select a.childcodekey,a.ParentCodeKey,  --a.FlagNew,
 a.DimName from 
#templinks a
--where  a.FlagNew = 1

union
-- BL to local
select   a.ParentCodeKey,a.childcodekey, --a.FlagNew,
 a.DimName from 
#templinks a
where a.RelationType like 'sub%' --and a.FlagNew = 1

) qq
 where dimname <> '-1'
group by dimname
order by DimName desc
