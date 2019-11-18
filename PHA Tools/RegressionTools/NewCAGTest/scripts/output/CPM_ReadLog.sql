Set nocount on 
select TableID, TableName
from log.CPM
where tableid in (1,4,6)