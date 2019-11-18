Set nocount on

Select max(maxi)
from [dbo].[Bump_tmp]
where TableID = '$(tblId)'