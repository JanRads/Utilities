USE dbmSemanticAnalyticsSTG
GO

--Wherever you see server names, replace them with the new server names
SELECT *
FROM [SSIS Configurations] c
RETURN	--remove this return to run the update query below

DECLARE @LOCALSQLSERVER AS NVARCHAR(55)
SELECT @LOCALSQLSERVER = @@SERVERNAME

UPDATE c
	SET ConfiguredValue = REPLACE(ConfiguredValue, '<OLD VALUE>', '<NEW VALUE>')
FROM [SSIS Configurations] c

