/*
Find tables with Column name by pattern
*/

DECLARE @SchemaName AS VARCHAR(10) = '%'	--LIKE operator
DECLARE @ColumnName AS VARCHAR(100) = '%'	--LIKE operator. Use % to match any character

SELECT s.name AS SchemaName, t.name AS tableName, c.name AS ColumnName, *
FROM sys.tables t
INNER JOIN sys.columns c ON c.object_id = t.object_id
INNER JOIN sys.schemas s ON t.schema_id = s.schema_id
WHERE s.name LIKE @SchemaName
AND c.name LIKE @ColumnName
ORDER BY 1, 2
