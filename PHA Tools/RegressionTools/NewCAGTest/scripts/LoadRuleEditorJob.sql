SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec msdb.dbo.sp_start_job	'PHA_RuleEditor'


	 DECLARE @JOB_NAME SYSNAME = N'PHA_RuleEditor'; 
 
	IF NOT EXISTS(     
			select 1 
			from msdb.dbo.sysjobs_view job  
			inner join msdb.dbo.sysjobactivity activity on job.job_id = activity.job_id 
			where  
				activity.run_Requested_date is not null  
			and activity.stop_execution_date is null  
			and job.name = @JOB_NAME
			and session_id = (SELECT TOP 1 session_id FROM msdb.dbo.syssessions ORDER BY agent_start_date DESC)
			) 
	BEGIN      
	   -- PRINT 'Starting job ''' + @JOB_NAME + ''''; 
		EXEC msdb.dbo.sp_start_job @JOB_NAME; 
	END 


	while exists (select 1 
			from msdb.dbo.sysjobs_view job  
			inner join msdb.dbo.sysjobactivity activity on job.job_id = activity.job_id 
			where  
				activity.run_Requested_date is not null  
			and activity.stop_execution_date is null  
			and job.name = @JOB_NAME
			and session_id = (SELECT TOP 1 session_id FROM msdb.dbo.syssessions ORDER BY agent_start_date DESC)
			)
		begin
	--	select 'test1' as tt
		WAITFOR DELAY '00:00:10';
		end