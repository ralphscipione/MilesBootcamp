/*
Ralph Scipione
 Created for Class 05 
 Due 2/4/2021

 Class 5 - Lab
 
 */

USE TavernsDB
 GO

-- 1. Write a query to return a “report” of all users and their roles
select u.name, r.name, r.description
from Users u
  inner join Roles r
  on u.RoleID = r.ID

-- 2. Write a query to return all classes and the count of guests that hold those classes
select c.Name, count(l.GuestID) 'Guest Count'
from Levels l join Classes c
  on c.ID = l.ClassID
group by c.Name

-- 3. Write a query that returns all guests ordered by name (ascending) and their classes and corresponding levels. Add a column that labels them beginner (lvl 1-5), intermediate (5-10) and expert (10+) for their classes (Don’t alter the table for this)
select Guests.Name as Guest, Classes.Name as Class, Levels.Level,
  CASE
		when Level >0 and Level <= 5 THEN 'beginner'
		when Level >5 and Level <= 10 THEN 'intermediate'
		when Level >=10  THEN 'expert'
	END as 'Level Group'
from Guests
  inner join Levels
  on Guests.ID = Levels.GuestID
  inner join Classes
  on Levels.ClassID = Classes.ID
order by Guest asc

-- 4. Write a function that takes a level and returns a “grouping” from question 3 (e.g. 1-5, 5-10, 10+, etc)
IF OBJECT_ID (N'dbo.getLevelGroup', N'FN') IS NOT NULL
  DROP FUNCTION dbo.getLevelGroup;
GO
CREATE FUNCTION dbo.getLevelGroup(@level int)
RETURNS varchar(50) 
  AS 
    BEGIN
  DECLARE @grouping varchar(50)
  SELECT @grouping = 
        CASE
          when @level >0 and @level <= 5 THEN 'beginner'
          when @level >5 and @level <= 10 THEN 'intermediate'
          when @level >=10  THEN 'expert'
	      END
  RETURN @grouping
END;
GO
select dbo.getLevelGroup(1) 'Grouping'
select dbo.getLevelGroup(7) 'Grouping'
select dbo.getLevelGroup(10) 'Grouping'
select dbo.getLevelGroup(15) 'Grouping'
GO
-- 5. Write a function that returns a report of all open rooms (not used) on a particular day (input) and which tavern they belong to 
IF OBJECT_ID (N'dbo.openRoomsByDate', N'IF') IS NOT NULL
  DROP FUNCTION openRoomsByDate;
GO
CREATE FUNCTION dbo.openRoomsByDate(@date datetime)
RETURNS TABLE
AS 
RETURN 
(
  select t.Name, r.ID, @date as 'Not used on'
  from Rooms r
  join Taverns t on r.TavernID = t.ID
  where r.ID not in (
    Select ID
    from SalesRooms
    where DatePurchased = @date 
  )
);
GO
select * from dbo.openRoomsByDate(CAST('1-1-2021' as datetime))
select * from dbo.openRoomsByDate(CAST('1-3-2021' as datetime))
select * from dbo.openRoomsByDate(CAST('1-14-2021' as datetime))
GO

-- 6. Modify the same function from 5 to instead return a report of prices in a range (min and max prices) - Return Rooms and their taverns based on price inputs
IF OBJECT_ID (N'dbo.roomsByPriceRange',N'IF') IS NOT NULL
  DROP FUNCTION roomsByPriceRange;
GO
CREATE FUNCTION dbo.roomsByPriceRange( @lowPrice money,  @highPrice money)
RETURNS TABLE
AS 
RETURN 
(
 select t.ID as TavernID, t.Name, r.ID as Room, r.Price 
from Rooms r
join Taverns t on r.TavernID = t.ID
where r.Price between @lowPrice and @highPrice 
);
GO
select * from dbo.roomsByPriceRange($100.00, $119.00)
select * from dbo.roomsByPriceRange($120.00, $125.00)
select * from dbo.roomsByPriceRange($131.00, $134.00)
select * from dbo.roomsByPriceRange($140.00, $145.00)
select * from dbo.roomsByPriceRange($113.00, $135.00)

-- Version 2 -  Using SalesRooms for price lookup
IF OBJECT_ID (N'dbo.roomsByPriceRange2') IS NOT NULL
  DROP FUNCTION roomsByPriceRange2;
GO
CREATE FUNCTION dbo.roomsByPriceRange2( @lowPrice money,  @highPrice money)
RETURNS TABLE
AS 
RETURN 
(
 select sr.Price Price, sr.DatePurchased DatePurchased, sr.QuantityPurchased QuantityPurchased, t.ID TavernID, t.Name Tavern, sr.RoomID Room, sr.GuestID GuestID
from SalesRooms sr
join Taverns t on sr.TavernID = t.ID
where sr.Price between @lowPrice and @highPrice 
);
GO
select * from dbo.roomsByPriceRange2($320.00, $340.00)
select * from dbo.roomsByPriceRange2($310.00, $335.00)

-- 7. Write a command that uses the result from 6 to Create a Room in another tavern that undercuts (is less than) the cheapest room by a penny - thereby making the new room the cheapest one
Declare @low money, @high money
SET @low = $100.00
SET @high = $119.00

Insert into dbo.Rooms 
   (RoomStatusID, TavernID, Price)
  
    Select 1 as RoomStatusID,
    CASE  
      WHEN l.TavernID = 1 then 2 else 1
    END as TavernID,
    Price -.01 as Price
    
    from 
    -- Both of the following queries work but I did not test for efficiency
    (
      select * --TavernID, Name, Room, Price 
      from dbo.roomsByPriceRange(@low, @high)
      where Price = (select MIN(Price) from dbo.roomsByPriceRange(@low, @high))
    ) 
      -- OR
    -- (
    --   select * -- TavernID, Name, Room, Price, b.MinPrice
    --   from dbo.roomsByPriceRange(@low, @high) as a 
    --   cross join (select MIN(Price) as MinPrice from dbo.roomsByPriceRange(@low, @high)) as b
    --   where a.Price = b.MinPrice
    -- )
    as l
GO

-- show results
select r.ID Room, r.Price Price,  t.Name Tavern 
from Rooms r 
join Taverns t
on r.TavernID = t.ID
    
-- Version 2 - Using SalesRooms for price lookup and adding the record
SET IDENTITY_INSERT dbo. Rooms ON
GO
Declare @low money, @high money, @MaxRoomID int, @RoomID int, @RoomStatusID int, @TavernID int, @Price money, @DatePurchased DATETIME, @QuantityPurchased int, @GuestID int  
SET @low = $300.00
SET @high = $340.00

    select @MaxRoomID = MAX(ID) from dbo.Rooms;
    Select @RoomStatusID =  1 ,
    @TavernID= 
    CASE  
      WHEN TavernID = 1 then 2 else 1
    END ,
    @Price = Price -.01,
    @DatePurchased = DatePurchased,
    @QuantityPurchased = QuantityPurchased,
    @RoomID = Room,
    @GuestID = GuestID
    
    from 
    (
      select * --Price, DatePurchased, QuantityPurchased, TavernID, Tavern, Room, GuestID
      from dbo.roomsByPriceRange2(@low, @high)
      where Price = (select MIN(Price) from dbo.roomsByPriceRange2(@low, @high))
    ) 
    as l

    -- select @Price Price, @DatePurchased DatePurchased, @QuantityPurchased QuantityPurchased, @TavernID TavernID, @RoomID RoomID, @GuestID GuestID
  
  Insert into dbo.Rooms
    (ID, RoomStatusID, TavernID, Price)
    VALUES(@MaxRoomID + 1, @RoomStatusID, @TavernID, @Price);

  Insert into dbo.SalesRooms
  (Price, DatePurchased,QuantityPurchased,TavernID,RoomID,GuestID)
  Values
  (@Price, GETDATE(), @QuantityPurchased, @TavernID, @MaxRoomID + 1 , @GuestID);

  -- select @MaxRoomID + 1, @RoomStatusID, @TavernID, @Price;
  -- select @Price, GETDATE(), @QuantityPurchased, @TavernID, @MaxRoomID + 1 , @GuestID;
GO
SET IDENTITY_INSERT dbo.Rooms OFF
GO
-- show results
select * from SalesRooms
select * from Rooms

-- select sr.RoomID Room, sr.Price Price,  t.Name Tavern 
-- from SalesRooms sr 
-- join Taverns t
-- on sr.TavernID = t.ID

-- select * from Rooms
