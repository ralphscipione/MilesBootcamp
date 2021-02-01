/*
Ralph Scipione
 Created for Class 04 
 Due 2/1/2021

 Class 4 - Queries Script
 
 */

USE TavernsDB
GO
--1. Write a query to return users who have admin roles
select u.Name, r.Name
from Users  u
	join UserRoles ur
	on u.ID = ur.UserID
	join Roles r
	on ur.RoleID = r.ID
	where r.Name = 'Admin'
GO
--2. Write a query to return users who have admin roles and information about their taverns
select u.Name Owner, r.Name Role, t.Name Tavern, t.FloorsCount , l.Location
from Users  u
	join UserRoles ur
	on u.ID = ur.UserID
	join Roles r
	on ur.RoleID = r.ID
	join Taverns t
	on u.ID = t.OwnerID
	join Locations l
	on t.LocationID = l.ID
where r.Name = 'Admin'
order by Owner
GO

--3. Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels
select g.Name 'Guest', c.Name 'Class', l.Level
from Guests g
	join Levels l
	on g.ID = l.GuestID
	join Classes c 
	on l.ClassID = c.ID
order by g.Name
GO

--4. Write a query that returns the top 10 sales in terms of sales price and what the services were
	--class 3 - Q 6. Write a query that returns the top 10 highest price sales
	select TOP(10) s.ID as 'Sale ID', t.Name as Tavern, g.Name as Guest, s.PurchaseAmount, s.PurchaseDate, ISNULL(sr.Name,'No Services Purchased')
	from Sales s
	inner join Taverns t
	on s.TavernID = t.ID
	inner join Guests g
	on s.GuestID = g.ID
	left join SalesServices ss
	on ss.SaleID = s.ID
	left join Services sr
	on sr.ID = ss.ServiceID
	order by PurchaseAmount desc
	GO

select * from SalesSupplies
--5. Write a query that returns guests with 2 or more classes
select g.Name 'Guest', Count(c.ID) 'Class Count'
from Guests g
	join Levels l
	on g.ID = l.GuestID
	join Classes c 
	on l.ClassID = c.ID
group by g.Name
having Count(c.ID) >= 2
order by Count(c.ID), g.Name 
GO

--6. Write a query that returns guests with 2 or more classes with levels higher than 5
select g.Name 'Guest', Count(c.ID) 'Classes', MAX(l.Level) 'Highest Level'
from Guests g
	join Levels l
	on g.ID = l.GuestID
	join Classes c 
	on l.ClassID = c.ID
where l.Level > 5
group by g.Name
having Count(c.ID) >= 2
order by Count(c.ID), g.Name

--7. Write a query that returns guests with ONLY their highest level class
select g.Name 'Guest', c.Name 'Class', l.Level as 'Highest Level'
from Guests g
	join Levels l
	on g.ID = l.GuestID
	join Classes c 
	on l.ClassID = c.ID
	join (select GuestID, MAX(Level) as MaxLevel
			from Levels
			group by GuestID) as mt
	on mt.GuestID = g.ID and mt.MaxLevel = l.Level

--8. Write a query that returns guests that stay within a date range. Please remember that guests can stay for more than one night AND not all of the dates they stay have to be in that range (just some of them)
select g.Name, sr.StayDate 
from SalesRooms sr
join Sales s
on s.ID = sr.SaleID
join Guests g
on s.GuestID = g.ID
where sr.StayDate between '1-3-2021' and '1-13-2021'
order by g.Name

--9. Using the additional queries provided, take the lab’s SELECT ‘CREATE query’ and add any IDENTITY and PRIMARY KEY constraints to it.

--9. Using the additional queries provided, take the lab’s SELECT ‘CREATE query’ and add any IDENTITY and PRIMARY KEY constraints to it.

--For Number 9: 
-----

--select sysObj.name, sysCol.name, *
--from sys.objects sysObj inner join sys.columns sysCol on sysObj.object_id = sysCol.object_id
---
/* 9 */
DECLARE @tableName varchar(250), @count int ;
SET @tableName = 'Taverns';
-- SELECT @count = COUNT(*) from INFORMATION_SCHEMA.Columns where TABLE_NAME = @tableName;

--SELECT * from INFORMATION_SCHEMA.TABLES where TABLE_NAME = @tableName;
--SELECT * from INFORMATION_SCHEMA.Columns where TABLE_NAME = @tableName; 

select DISTINCT 'CREATE TABLE '+ @tableName +' (' as Statement FROM INFORMATION_SCHEMA.TABLES  where TABLE_NAME = @tableName
UNION ALL
select  
	CASE   
		--WHEN CHARACTER_MAXIMUM_LENGTH is not null THEN CONCAT(COLUMN_NAME, ' ', DATA_TYPE,' (', CAST(CHARACTER_MAXIMUM_LENGTH as varchar), ')')  
		WHEN c.is_identity = 1 then CONCAT(c.name, ' ', t.name,' IDENTITY (1,1),')
		WHEN c.collation_name is not null THEN CONCAT(c.name, ' ', t.name,' (', CAST( c.max_length as varchar), '),')  
		ELSE CONCAT(c.name, ' ', t.name, ', ')
	END
	as Name
from sys.objects o inner join sys.columns c on o.object_id = c.object_id 
join sys.types t 
on t.system_type_id = c.system_type_id
where o.name = 'Taverns'

UNION ALL
	select 
	CASE
		WHEN r.CONSTRAINT_NAME is not null
		THEN CONCAT('CONSTRAINT ', k.CONSTRAINT_NAME,' FOREIGN KEY (', k.COLUMN_NAME,') REFERENCES ',c.TABLE_NAME, '(',c.COLUMN_NAME,'),') 
		ELSE CONCAT('CONSTRAINT ', k.CONSTRAINT_NAME,' PRIMARY KEY (', k.COLUMN_NAME,') ') 
	END
	from INFORMATION_SCHEMA.KEY_COLUMN_USAGE k
	left join INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS r
		on k.CONSTRAINT_NAME = r.CONSTRAINT_NAME
	left join INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
		on c.CONSTRAINT_NAME = r.UNIQUE_CONSTRAINT_NAME
		where (k.TABLE_NAME = @tableName or c.CONSTRAINT_NAME = k.CONSTRAINT_NAME)
		--and r.CONSTRAINT_NAME is not null
UNION ALL
select DISTINCT ')' as Statement FROM INFORMATION_SCHEMA.TABLES  where TABLE_NAME = @tableName
GO

