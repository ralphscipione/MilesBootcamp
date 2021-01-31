/*
Ralph Scipione
 Created for Class 03 
 Due 1/28/2021

 Class 3 - Queries Script
 
 */

USE TavernsDB
GO

 /*
0. Complete the lab to create the SELECT CREATE query!
Reproduce the output:

CREATE TABLE Taverns (
ID int,
Name varchar(100),
Floors int,
LocationID int,
OwnerID int,
)

*/
DECLARE @tableName varchar(250), @count int ;
SET @tableName = 'Taverns';
SELECT @count = COUNT(*) from INFORMATION_SCHEMA.Columns where TABLE_NAME = @tableName;

SELECT * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = @tableName;
SELECT * from INFORMATION_SCHEMA.Columns where TABLE_NAME = @tableName; 

select DISTINCT 'CREATE TABLE '+ @tableName +' (' as Statement FROM INFORMATION_SCHEMA.TABLES  where TABLE_NAME = @tableName
UNION ALL
select CONCAT(COLUMN_NAME, ' ', DATA_TYPE, 
	CASE   
		WHEN CHARACTER_MAXIMUM_LENGTH is not null THEN CONCAT(' (', CAST(CHARACTER_MAXIMUM_LENGTH as varchar), ')')  
	END,
	CASE   
		WHEN Ordinal_position <> @count THEN ','
	END 
	) as Name
from INFORMATION_SCHEMA.Columns 
where TABLE_NAME = @tableName
UNION ALL
select DISTINCT ')' as Statement FROM INFORMATION_SCHEMA.TABLES  where TABLE_NAME = @tableName

GO

--1. The system should also be able to track Rooms. Rooms should have a status and an associated tavern. There should be a way to track Room Stays which will contain a sale, guest, room, the date it was stayed in and the rate
-- Existing scripts modified to accomodate these requirements

--2. Write a query that returns guests with a birthday before 2000. 
select Name, BirthDate
from Guests 
where BirthDate < CAST('1-1-2000' as Date)
GO

--3. Write a query to return rooms that cost more than 100 gold a night
select Taverns.Name as 'Tavern', Rooms.Name as Room, Rooms.Rate
from Rooms 
inner join Taverns
on Rooms.TavernID = Taverns.ID 
where Rate > 100.00
GO

--4.Write a query that returns UNIQUE guest names. 
select distinct Name from Guests
GO

--5. Write a query that returns all guests ordered by name (ascending) Use ASC or DESC after your ORDER BY [col]
select Name from Guests order by Name asc
GO

--6. Write a query that returns the top 10 highest price sales
select TOP(10) Sales.ID as 'Sale ID', Taverns.Name as Tavern, Guests.Name as Guest, Sales.PurchaseAmount, Sales.PurchaseDate
from Sales
inner join Taverns
on Sales.TavernID = Taverns.ID
inner join Guests
on Sales.GuestID = Guests.ID
order by PurchaseAmount desc
GO

--7. Write a query to return all the values stored in all Lookup Tables - Lookup tables are the tables we reference typically with just an ID and a name. This should be a dynamic combining of all of the tables
select * from Roles
Union All
select * from Locations
Union All
select * from Classes
Union All
select * from GuestStatuses
Union All
select * from Status
Union All
select * from RoomStatuses
GO

--8. Write a query that returns Guest Classes with Levels and Generate a new column with a label for their level grouping (lvl 1-10, 10-20, etc)

select Guests.Name as Guest, Classes.Name as Class, Levels.Level, 
	CASE
		when Level >0 and Level <= 10 THEN 'Lvl 1-10'
		when Level >10 and Level <= 20 THEN 'Lvl 11-20'
		when Level >20 and Level <= 30 THEN 'Lvl 21-30'
		when Level >30 and Level <= 40 THEN 'Lvl 31-40'
		when Level >40 and Level <= 50 THEN 'Lvl 41-50'
	END as 'Level Group'
from Guests
	inner join Levels
	on Guests.ID = Levels.GuestID
	inner join Classes
	on Levels.ClassID = Classes.ID
order by Class,Level,Guest


--9. Write a series of INSERT commands that will insert the statuses of one table into another of your choosing using SELECT statements (See our lab in class - The INSERT commands should be generated). It’s ok if the data doesn’t match or make sense! :)
--* Remember, INSERT Commands look like: INSERT INTO Table1 (column1, column2) VALUES (column1, column2)
select CONCAT('INSERT INTO GuestStatuses (Name) VALUES (''',Status,''')') from RoomStatuses
GO
-- Used only Name/Status column as ID column is IDENTITY
