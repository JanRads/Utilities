Set nocount on 
declare @tbl nvarchar(100) = '$(tblName)'
declare @ColName nvarchar(100) = '$(ColName)'
declare @sql nvarchar(max)
set @sql = 'SELECT DISTINCT  
                T1.bookmark
FROM   cpm.'+@tbl+' T1 
       INNER JOIN cpm.codes t2 
               ON T1.'+@ColName+' = T2.[codekey] 
                  AND T1.'+@ColName+' > 0 
WHERE  T2.codedesc LIKE ''%head%'''

exec (@Sql) 