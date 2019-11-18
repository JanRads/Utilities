
USE msdb ;  
GO  
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec msdb.dbo.sp_start_job	'AnalyticsBuild'


	-- DECLARE @JOB_NAME SYSNAME = N'AnalyticsBuild'; 
	 DECLARE @JOB_NAME SYSNAME = N'PHA_Scheduler'; 

 UPDATE dbmSemanticAnalyticsSTG.[dbo].[Scheduler_Manager] 
SET NextRun=getdate(), InProcess=0, StartTime=NULL
WHERE  ID=1

UPDATE  dbmSemanticAnalyticsSTG.[dbo].[Scheduler_Manager] 
SET NextRun=Dateadd(minute, 3,getdate()) , InProcess=0, StartTime=NULL
WHERE  ID=2


UPDATE  dbmSemanticAnalyticsSTG.[dbo].[Scheduler_Manager] 
SET [STATUS]=5
WHERE  ID=4

UPDATE  dbmSemanticAnalyticsSTG.[dbo].[Scheduler_Manager] 
SET NextRun=Dateadd(minute, 20,getdate()) , InProcess=0, StartTime=NULL,IsActive=1
WHERE  ID=5

EXEC dbo.sp_update_job  
    @job_name = @JOB_NAME,  
    @new_name =@JOB_NAME,  
    @enabled = 1 ;  
 


	IF NOT EXISTS(     
			select 1 
			from msdb.dbo.sysjobs_view job  
			inner join msdb.dbo.sysjobactivity activity on job.job_id = activity.job_id 
			where  
			job.name in ('Claims', 'ClaimsForRegression', 'AnalyticsBuild','PHA_DWH_Fact','PHA_Main_Persist') 
			and	activity.run_Requested_date is not null  
			and activity.stop_execution_date is null  
			and session_id = (SELECT TOP 1 session_id FROM msdb.dbo.syssessions ORDER BY agent_start_date DESC)
			) 
	BEGIN      
	   -- PRINT 'Starting job ''' + @JOB_NAME + ''''; 
		EXEC msdb.dbo.sp_start_job @JOB_NAME; 
		WAITFOR DELAY '00:04:20';
	END 


	while exists (
			select 1 
			from msdb.dbo.sysjobs_view job  
			inner join msdb.dbo.sysjobactivity activity on job.job_id = activity.job_id 
			where  
			job.name in ('Claims', 'ClaimsForRegression', 'AnalyticsBuild','PHA_DWH_Fact','PHA_Main_Persist') 
			and	activity.run_Requested_date is not null  
			and activity.stop_execution_date is null  
			and session_id = (SELECT TOP 1 session_id FROM msdb.dbo.syssessions ORDER BY agent_start_date DESC)
			)
		begin
	--	select 'test1' as tt
		WAITFOR DELAY '00:03:10';
		end