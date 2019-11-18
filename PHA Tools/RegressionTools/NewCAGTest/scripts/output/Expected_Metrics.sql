
 use dbmSemanticAnalytics


CREATE TABLE #NUM(MetricId bigint null,  id_Patient int null, date_YearMonth int null)
CREATE TABLE #DEN(MetricId bigint null,  id_Patient int null, date_YearMonth int null)

insert into #NUM
	-- metric 1 \\ Numerator
	select MetricId,  id_Patient, date_YearMonth from 
	((
	select 1 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 3
	union
	select 1 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 4
	)
	intersect
	select 1 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] <> 2
	) q
insert into #DEN
	-- metric 1 \\ Den
	select 1 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 3

insert into #NUM
	-- metric 2 \\ Numerator
	select MetricId,  id_Patient, date_YearMonth from 
	((
	select 2 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 3
	union
	select 2 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 1
	)
	Except
	select 2 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 2
	)q

insert into #DEN
	-- metric 2 \\ Den
	select 2 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 3
	union
	select 2 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 1

	-- metric 3 \\ Numerator
insert into #NUM	
	select 3 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 2
	intersect
	select 3 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 1
	
insert into #DEN
	-- metric 3 \\ Den
	select 3 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 1
	union
	select 3 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 2
	union
	select 3 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 3
	union
	select 3 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 4

	-- metric 4 \\ Numerator
insert into #NUM	
	select 4 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 4	

insert into #DEN
	-- metric 4 \\ Den
	select 4 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 1
	union
	select 4 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 2
	union
	select 4 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 3
	union
	select 4 MetricId,  id_Patient, date_YearMonth from [Fact].[BuildingBlocks] where [BuildingBlockId] = 4

select den.MetricId [MetricKey],  
		den.id_Patient, 
		den.date_YearMonth, 
		
		case when num.id_Patient is null then 0 else 1 end measure_DenumeratorInd,1 measure_DenumeratorInd
from #DEN den left join #NUM num on den.id_Patient = num.id_Patient and den.MetricId = num.MetricId and den.date_YearMonth = num.date_YearMonth
order by 1,2,3

drop table #NUM
drop table #DEN