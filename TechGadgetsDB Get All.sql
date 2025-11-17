USE TechGadgetsDB;
GO

DECLARE @sql NVARCHAR(MAX) = '';

-- Build SELECT statements for all tables in TechGadgetsDB
SELECT @sql = STRING_AGG('SELECT * FROM [' + TABLE_SCHEMA + '].[' + TABLE_NAME + '];', CHAR(13))
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

-- Execute all SELECT statements
EXEC sp_executesql @sql;