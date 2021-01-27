
/*
Ralph Scipione
 DB Class 02 Assignment
 Due 1/24/2021
 **
 Modified for Class 03 
 Due 1/28/2021

 Seed Data Script
 
*/

USE [TavernsDB]
GO
/* USERS */
--Users
SET IDENTITY_INSERT dbo.Users ON
GO
INSERT INTO [dbo].[Users]
	([ID] ,[Name], [BirthDate])
VALUES
	(1, 'Tony Stark', '1980-09-18'),
	(2, 'Mary Jane Watson', '1981-07-15'),
	(3, 'Pepper Potts', '1982-04-14'),
	(4, 'Peter Parker', '1983-05-09'),
	(5, 'Bruce Banner', '1984-06-10'),
	(6, 'Natasha Romanoff', '1985-07-11'),
	(7, 'Betty Ross', '1986-08-12'),
	(8, 'Phil Coulson', '1987-09-13'),
	(9, 'Nick Fury', '1988-10-14'),
	(10, 'Maria Hill', '1989-03-15')
GO
SET IDENTITY_INSERT dbo.Users OFF
GO
--Roles
SET IDENTITY_INSERT dbo.Roles ON
GO
INSERT INTO [dbo].[Roles]
	([ID],[Name])
VALUES
	(1, 'Owner'),
	(2, 'Manager'),
	(3, 'Cashier'),
	(4, 'Chef'),
	(5, 'Waiter')
GO
SET IDENTITY_INSERT dbo.Roles OFF
GO
--UserRoles
INSERT INTO [dbo].[UserRoles]
	([UserID], [RoleID])
VALUES
	(1, 1),
	(2, 2),
	(2, 3),
	(3, 2),
	(3, 3),
	(4, 4),
	(4, 5),
	(5, 3),
	(5, 5),
	(5, 4)
GO
/* TAVERNS */
--Locations
SET IDENTITY_INSERT dbo.Locations ON
GO
INSERT INTO [dbo].[Locations]
	([ID], [Location])
VALUES
	(1, 'Phildadelphia'),
	(2, 'Atlantic City'),
	(3, 'New York City'),
	(4, 'Miami'),
	(5, 'Fort Lauderdale')
GO
SET IDENTITY_INSERT dbo.Locations OFF
GO
--Taverns
SET IDENTITY_INSERT dbo.Taverns ON
GO
INSERT INTO [dbo].[Taverns]
	([ID], [Name], [FloorsCount], [OwnerID], [LocationID])
VALUES
	(1, 'The Ale House', 3, 6, 1),
	(2, 'Ye Old Pub', 3, 6, 1),
	(3, 'The Watering Hole', 3, 6, 1),
	(4, 'Pub & Grub', 3, 6, 1),
	(5, 'The Rest Stop', 3, 6, 1)
GO
SET IDENTITY_INSERT dbo.Taverns OFF
GO
-- --BasementRats
-- SET IDENTITY_INSERT dbo.BasementRats ON
-- GO
-- INSERT INTO [dbo].[BasementRats] ([ID], [Name], [TavernID])
--      VALUES
--            (1,'Fluffy',1),
-- 		   (2,'Hairy',1),
-- 		   (3,'Red',2),
-- 		   (4,'Inky',3),
-- 		   (5,'Blinky',3),
-- 		   (6,'Clyde',4),
-- 		   (7,'Happy',4),
-- 		   (8,'Slippery',5),
-- 		   (9,'RobesPierre',5),
-- 		   (10,'Fred',2)
-- GO
-- SET IDENTITY_INSERT dbo.BasementRats OFF
-- GO
/* GUESTS */
--GuestStatuses
SET IDENTITY_INSERT dbo.GuestStatuses ON
GO
INSERT INTO [dbo].[GuestStatuses]
	([ID], [Name])
VALUES
	(1, 'Fine'),
	(2, 'Sick'),
	(3, 'Hangry'),
	(4, 'Raging'),
	(5, 'Placid')
GO
SET IDENTITY_INSERT dbo.GuestStatuses OFF
GO
--Guests
SET IDENTITY_INSERT dbo.Guests ON
GO
INSERT INTO [dbo].[Guests]
	([ID] ,[Name],[Notes], [BirthDate], StatusID)
VALUES
	(1, 'John Smith', 'Likes red wine', '1990-09-18',1),
	(2, 'Jane Doe', 'Loves beef', '1991-07-15',2),
	(3, 'Jean Jones', 'Likes seafood.', '1992-04-14',3),
	(4, 'Peter James', 'Beer man', '1993-05-09',4),
	(5, 'Frank Banes', 'Stout is the drink', '1994-06-10',5),
	(6, 'Nataly Chase', '', '1995-07-11',1),
	(7, 'Betsy Flowers', '', '1996-08-12',2),
	(8, 'Colt Mavis', 'Whiskey lover', '1997-09-13',3),
	(9, 'James Fleur', '', '1998-10-14',4),
	(10, 'Donna Martine', 'White wine lover', '1999-03-15',5)
GO
SET IDENTITY_INSERT dbo.Guests OFF
GO

-- Classes
SET IDENTITY_INSERT dbo.Classes ON
GO
INSERT INTO [dbo].[Classes]
	([ID],[Name])
VALUES
	(1, 'Fighter'),
	(2, 'Mage'),
	(3, 'Cleric'),
	(4, 'Rogue'),
	(5, 'Ranger')
GO
SET IDENTITY_INSERT dbo.Classes OFF
GO
-- Levels
INSERT INTO [dbo].[Levels]
	([GuestID],[ClassID], [Level], [DateAchieved])
VALUES
	(1, 2, 22, '1-1-2021'),
	(1, 4, 1, '12-7-2020'),
	(2, 1, 3, '8-10-2018'),
	(2, 5, 50, '1-30-2017'),
	(3, 3, 44, '7-19-2014'),
	(3, 2, 32, '8-21-2017'),
	(4, 3, 25, '5-16-2018'),
	(4, 1, 33, '1-12-011'),
	(5, 2, 14, '4-24-2018'),
	(6, 4, 29, '10-1-2019'),
	(7, 1, 30, '9-3-2021'),
	(8, 5, 5, '8-9-2021'),
	(9, 3, 15, '7-4-2021'),
	(10, 1, 3, '6-1-2021')
GO

/* SERVICES*/
--Services
SET IDENTITY_INSERT dbo.Services ON
GO
INSERT INTO [dbo].[Services]
	([ID], [Name], [Unit], [UnitPrice], [TavernID])
VALUES
	(1, 'Pool Use', 'day', '10', 1),
	(2, 'Weapon Sharpening', 'visit', '10', 1),
	(3, 'Eyeglass Repair', 'visit', '10', 2),
	(4, 'Massage', '1/2 hour', '30', 2),
	(5, 'Haircut', 'visit', '15', 3),
	(6, 'Shave', 'visit', '7', 3),
	(7, 'Nail Salon', 'visit', '50', 4),
	(8, 'Horse Tending', 'day', '60', 4),
	(9, 'Shower', 'visit', '10', 5),
	(10, 'Mending', 'visit', '10', 5)
GO
SET IDENTITY_INSERT dbo.Services OFF
GO
--Status
SET IDENTITY_INSERT dbo.Status ON
GO
INSERT INTO [dbo].[Status]
	([ID], [Status])
VALUES
	(1, 'OK'),
	(2, 'Discontinued'),
	(3, 'Temporarily Unavailable'),
	(4, 'Out of Stock'),
	(5, 'Out of Season')
GO
SET IDENTITY_INSERT dbo.Status OFF
GO
--ServiceStatus
INSERT INTO [dbo].[ServiceStatus]
	([ServiceID], [StatusID])
VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1)
GO
/* SUPPLIES */
--Supplies
SET IDENTITY_INSERT dbo.Supplies ON
GO
INSERT INTO [dbo].[Supplies]
	([ID], [Name], [Unit], [UnitPrice])
VALUES
	(1, 'Strong Ale', '12 oz. bottle', '9'),
	(2, 'Light Ale', '12 oz. bottle', '7'),
	(3, 'India Pale Ale', '16 oz. bottle', '10'),
	(4, 'Stout', '16 oz. can', '8'),
	(5, 'Beer', '12 oz. can', '5'),
	(6, 'Beef Sandwich', 'each', '15'),
	(7, 'Pork Sandwich', 'each', '15'),
	(8, 'Chicken Sandwich', 'each', '12')		 
GO
SET IDENTITY_INSERT dbo.Supplies OFF
GO
--SuppliesReceived
SET IDENTITY_INSERT dbo.SuppliesReceived ON
GO
INSERT INTO [dbo].[SuppliesReceived]
	([ID], [TavernID], [SupplyID], [Cost], [AmountReceived], [ReceivedDate])
VALUES
	(1, 1, 1, '45.00', 100, '1-1-2021'),
	(2, 1, 2, '50.00', 200, '1-8-2021'),
	(3, 1, 3, '55.00', 100, '1-15-2021'),
	(4, 2, 4, '60.00', 200, '1-2-2021'),
	(5, 2, 5, '60.00', 300, '1-9-2021'),
	(6, 2, 1, '45.00', 100, '1-16-2021'),
	(7, 3, 2, '50.00', 200, '1-3-2021'),
	(8, 3, 3, '55.00', 100, '1-10-2021'),
	(9, 3, 4, '60.00', 200, '1-17-2021'),
	(10, 4, 5, '60.00', 300, '1-4-2021'),
	(11, 4, 1, '45.00', 100, '1-11-2021'),
	(12, 4, 2, '50.00', 200, '1-18-2021'),
	(13, 5, 3, '55.00', 100, '1-5-2021'),
	(14, 5, 4, '60.00', 200, '1-12-2021'),
	(15, 5, 5, '60.00', 300, '1-19-2021')
GO
SET IDENTITY_INSERT dbo.SuppliesReceived OFF
GO
--TavernSupplies
INSERT INTO [dbo].[TavernSupplies]
	([TavernID], [SupplyID], [CurrentCount], [UpdatedDate])
VALUES
	(1, 1, 1000, '1-1-2021'),
	(2, 1, 2000, '1-8-2021'),
	(3, 1, 1000, '1-15-2021'),
	(4, 2, 2000, '1-2-2021'),
	(5, 2, 3000, '1-9-2021'),
	(1, 2, 1000, '1-16-2021'),
	(2, 3, 2000, '1-3-2021'),
	(3, 3, 1000, '1-10-2021'),
	(4, 3, 2000, '1-17-2021'),
	(5, 4, 3000, '1-4-2021'),
	(1, 4, 1000, '1-11-2021'),
	(2, 4, 2000, '1-18-2021'),
	(3, 5, 1000, '1-5-2021'),
	(4, 5, 2000, '1-12-2021'),
	(5, 5, 3000, '1-19-2021')
GO
/* Rooms */
--RoomStatuses
SET IDENTITY_INSERT dbo.RoomStatuses ON
GO
INSERT INTO [dbo].[RoomStatuses]
	([ID], [Status])
VALUES
	(1, 'Vacant'),
	(2, 'Occupied'),
	(3, 'Out of Service')
GO
SET IDENTITY_INSERT dbo.RoomStatuses OFF
GO
--Rooms
SET IDENTITY_INSERT dbo.Rooms ON
GO
INSERT INTO [dbo].[Rooms]
	([ID],[Name], [Rate], [RoomStatusID], [TavernID])
VALUES
	(1, 'Room 1', '100.00', 2,1),
	(2, 'Room 2', '100.00', 2,1),
	(3, 'Room 3', '120.00', 2,1),
	(4, 'Room 4', '120.00', 1,1),
	(5, 'Room 5', '150.00', 1,1),
	(6, 'Room 6', '150.00', 1,1),
	(7, 'Suite A', '110.00', 1,2),
	(8, 'Suite B', '110.00', 1,2),
	(9, 'Suite C', '145.00', 2,2),
	(10, 'Bedroom 1', '145.00', 1,3),
	(11, 'Bedroom 2', '100.00', 1,3),
	(12, 'Bedroom 3', '100.00', 2,3),
	(13, 'Bedroom 4', '100.00', 3,3),
	(14, 'Aristocrat Suite', '200.00', 2,4),
	(15, 'Presidential Suite', '220.00', 2,4)
GO
SET IDENTITY_INSERT dbo.Rooms OFF
GO
/* SALES */
--Sales
SET IDENTITY_INSERT dbo.Sales ON
GO
INSERT INTO [dbo].[Sales]
	([ID], [TavernID], [GuestID], [PurchaseAmount], [PurchaseDate])
VALUES
	(1, 1, 1, '450.00', '1-1-2021'),
	(2, 1, 10, '230.00', '1-2-2021'),
	(3, 2, 2, '120.00', '1-3-2021'),
	(4, 2, 9, '770.00', '1-4-2021'),
	(5, 3, 3, '1230.00', '1-5-2021'),
	(6, 3, 8, '50.00', '1-6-2021'),
	(7, 4, 4, '20.00', '1-7-2021'),
	(8, 4, 7, '440.00', '1-8-2021'),
	(9, 5, 5, '32.00', '1-9-2021'),
	(10, 5, 1, '99.00', '1-10-2021')
GO
SET IDENTITY_INSERT dbo.Sales OFF
GO
-- SalesServices
INSERT INTO [dbo].[SalesServices]
	(SaleID, ServiceID, UnitPriceSold, Quantity)
VALUES
	(1,2,'100.00',1),
	(2,3,'100.00',2),
	(3,1,'100.00',2),
	(4,4,'100.00',4),
	(5,5,'100.00',2)
	GO
-- SalesSupplies
INSERT INTO [dbo].[SalesSupplies]
	(SaleID, SupplyID, UnitPriceSold, Quantity)
VALUES
	(1,1,'200.00',1),
	(2,2,'200.00',2),
	(3,3,'200.00',2),
	(4,4,'200.00',4),
	(5,5,'200.00',2)
GO
-- SalesRooms
INSERT INTO [dbo].[SalesRooms]
	([SaleID],[RoomID],[RateSold],[Quantity])
VALUES
	(7,1,'210.00',1),
	(8,2,'220.00',1),
	(7,3,'230.00',1),
	(8,4,'240.00',1),
	(10,5,'250.00',2)
GO



