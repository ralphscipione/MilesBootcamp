/*
Ralph Scipione
 Created for Class 05 
 Due 2/4/2021

 Class 5 - Lab
 
 */
Use TavernsDB
GO


/* Class Lab*/
IF OBJECT_ID (N'dbo.calculatePrice', N'FN') IS NOT NULL  
    DROP FUNCTION calculatePrice;  
GO  
CREATE FUNCTION dbo.calculatePrice(@ProductID int, @Quantity int)  
RETURNS money
AS   
BEGIN  
    DECLARE @ret int;  
    SELECT @ret = s.Price *  @Quantity  
    FROM dbo.SalesSupplies s
    WHERE s.ID = @ProductID ;
     IF (@ret IS NULL)   
        SET @ret = 0;  
    RETURN @ret;  
END; 
GO

select dbo.calculatePrice(1, 5) 


IF OBJECT_ID (N'[dbo].createTable', N'IF') IS NOT NULL  
    DROP FUNCTION [dbo].createTable;  
GO  

CREATE FUNCTION [dbo].createTable(@tableName varchar(50))  
RETURNS TABLE  
AS  
RETURN   
(
	SELECT 
CONCAT('CREATE TABLE ',TABLE_NAME, ' (') as queryPiece 
FROM INFORMATION_SCHEMA.TABLES
 WHERE TABLE_NAME = @tableName
UNION ALL
SELECT CONCAT(cols.COLUMN_NAME, ' ', cols.DATA_TYPE, 
(
	CASE WHEN CHARACTER_MAXIMUM_LENGTH IS NOT NULL 
	Then CONCAT
		('(', CAST(CHARACTER_MAXIMUM_LENGTH as varchar(100)), ')') 
	Else '' 
	END)
, 
	CASE WHEN refConst.CONSTRAINT_NAME IS NOT NULL
	Then 
		(CONCAT(' FOREIGN KEY REFERENCES ', constKeys.TABLE_NAME, '(', constKeys.COLUMN_NAME, ')')) 
	Else '' 
	END
,
	CASE WHEN refConst.CONSTRAINT_NAME IS NULL AND keys.COLUMN_NAME IS NOT NULL
	Then 
		' PRIMARY KEY'
	Else '' 
	END
, 
',') as queryPiece FROM 
INFORMATION_SCHEMA.COLUMNS as cols
LEFT JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE as keys ON 
(keys.TABLE_NAME = cols.TABLE_NAME and keys.COLUMN_NAME = cols.COLUMN_NAME)
LEFT JOIN INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS as refConst ON 
(refConst.CONSTRAINT_NAME = keys.CONSTRAINT_NAME)
LEFT JOIN 
(SELECT DISTINCT CONSTRAINT_NAME, TABLE_NAME, COLUMN_NAME 
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE) as constKeys 
ON (constKeys.CONSTRAINT_NAME = refConst.UNIQUE_CONSTRAINT_NAME)
 WHERE cols.TABLE_NAME = @tableName
UNION ALL
SELECT ')'

);

GO

select * from dbo.createTable('Taverns')
GO