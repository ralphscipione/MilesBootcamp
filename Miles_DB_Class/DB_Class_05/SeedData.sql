
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
--Roles
SET IDENTITY_INSERT dbo.Roles ON
GO
INSERT INTO [dbo].[Roles]
	([ID],[Name],[Description])
VALUES
	(1, 'Admin','All Access'),
	(2, 'Developer','Most Access'),
	(3, 'Manager','Business Manager Access'),
	(4, 'User','Staff Access'),
	(5, 'Audit','Accounting Access')
	
GO
SET IDENTITY_INSERT dbo.Roles OFF
GO
--Users
SET IDENTITY_INSERT dbo.Users ON
GO
INSERT INTO [dbo].[Users]
	([ID] ,[Name], [RoleID])
VALUES
	(1, 'Tony Stark', 1),
	(2, 'Mary Jane Watson', 2),
	(3, 'Pepper Potts', 3),
	(4, 'Peter Parker', 4),
	(5, 'Bruce Banner', 5),
	(6, 'Natasha Romanoff', 1),
	(7, 'Betty Ross', 4),
	(8, 'Phil Coulson', 2),
	(9, 'Nick Fury', 1),
	(10, 'Maria Hill', 3)
GO
SET IDENTITY_INSERT dbo.Users OFF
GO
/* TAVERNS */
--Locations
SET IDENTITY_INSERT dbo.Locations ON
GO
INSERT INTO [dbo].[Locations]
	([ID], [Name])
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
	(1, 'The Ale House', 3, 1, 1),
	(2, 'Ye Old Pub', 3, 6, 1),
	(3, 'The Watering Hole', 2, 1, 2),
	(4, 'Pub & Grub', 2, 6, 4),
	(5, 'The Rest Stop', 3, 9, 3)
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
--Status
SET IDENTITY_INSERT dbo.Status ON
GO
INSERT INTO [dbo].[Status]
	([ID], [Name])
VALUES
	(1, 'OK'),
	(2, 'Discontinued'),
	(3, 'Temporarily Unavailable'),
	(4, 'Out of Stock'),
	(5, 'Out of Season')
GO
SET IDENTITY_INSERT dbo.Status OFF
GO
--Services
SET IDENTITY_INSERT dbo.Services ON
GO
INSERT INTO [dbo].[Services]
	(ID, Name, StatusID, Price)
VALUES
	(1, 'Pool Use', 1, $14.00),
	(2, 'Weapon Sharpening', 1, $20.00),
	(3, 'Eyeglass Repair', 1,$25.00),
	(4, 'Massage', 1, $60.00),
	(5, 'Haircut', 3,$27.00),
	(6, 'Shave', 3, $15.00),
	(7, 'Wound Care', 5, $125.00),
	(8, 'Horse Tending', 5, $75.00),
	(9, 'Shower', 1, $18.00),
	(10, 'Garment Mending', 1, $30.00)
GO
SET IDENTITY_INSERT dbo.Services OFF
GO
-- SalesServices
SET IDENTITY_INSERT dbo.SalesServices ON
GO
INSERT INTO [dbo].[SalesServices]
	(ID, Price, DatePurchased, QuantityPurchased, TavernID, ServiceID, GuestID)
VALUES
	(1,$110.00,'1-1-2021',7,1,2,1),
	(2,$120.00,'1-1-2021',2,2,3,10),
	(3,$130.00,'1-1-2021',3,3,1,2),
	(4,$140.00, '1-1-2021',2,4,4,9),
	(5,$150.00,'1-1-2021',6,5,5,3),
	(6,$110.00,'1-1-2021',10,1,2,1),
	(7,$120.00,'1-1-2021',12,2,3,4),
	(8,$130.00,'1-1-2021',5,3,1,7),
	(9,$140.00,'1-1-2021',1,4,4,8),
	(10,$150.00,'1-1-2021',2,5,5,3)
GO
SET IDENTITY_INSERT dbo.SalesServices OFF
GO



/* SUPPLIES */
--Supplies
SET IDENTITY_INSERT dbo.Supplies ON
GO
INSERT INTO [dbo].[Supplies]
	([ID], [Name], [Unit], [Price])
VALUES
	(1, 'Strong Ale', '12 oz. bottle', '9.00'),
	(2, 'Light Ale', '12 oz. bottle', '7.00'),
	(3, 'India Pale Ale', '16 oz. bottle', '10.00'),
	(4, 'Stout', '16 oz. can', '8.00'),
	(5, 'Beer', '12 oz. can', '5.00'),
	(6, 'Beef Sandwich', 'each', '15.00'),
	(7, 'Pork Sandwich', 'each', '13.00'),
	(8, 'Chicken Sandwich', 'each', '12.00'),
	(9, 'Hot Dog', 'each', '9.00'),
	(10, 'PB&J Sandwich', 'each', '7.00')
GO
SET IDENTITY_INSERT dbo.Supplies OFF
GO
--SuppliesReceived
SET IDENTITY_INSERT dbo.Receiving ON
GO
INSERT INTO dbo.Receiving
	(ID, TavernID, SupplyID, Cost, Quantity, ReceivedDate)
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
SET IDENTITY_INSERT dbo.Receiving OFF
GO
--Inventory
INSERT INTO dbo.Inventory
	(TavernID, SupplyID, Count, UpdatedDate)
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
	([ID], [Name])
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
INSERT INTO dbo.Rooms
	(ID,RoomStatusID, TavernID, Price)
VALUES
	(1, 2,1,$111.00),
	(2, 2,1,$112.00),
	(3, 2,1,$113.00),
	(4, 1,1,$114.00),
	(5, 1,5,$151.00),
	(6, 1,5,$152.00),
	(7, 1,2,$121.00),
	(8, 1,2,$122.00),
	(9, 2,2,$123.00),
	(10,1,3,$131.00),
	(11, 1,3,$132.00),
	(12, 2,3,$133.00),
	(13, 3,3,$134.00),
	(14, 2,4,$141.00),
	(15, 2,4,$142.00)
GO
SET IDENTITY_INSERT dbo.Rooms OFF
GO
/* SALES */

-- SalesSupplies
SET IDENTITY_INSERT dbo.SalesSupplies ON
GO
INSERT INTO [dbo].[SalesSupplies]
	(ID, Price, DatePurchased, QuantityPurchased, TavernID, SupplyID, GuestID)
VALUES
	(1,$210.00,'1-1-2021',4,1,2,1),
	(2,$220.00,'1-1-2021',6,2,3,9),
	(3,$230.00,'1-1-2021',9,3,1,2),
	(4,$240.00, '1-1-2021',1,4,4,6),
	(5,$250.00,'1-1-2021',3,5,5,3),
	(6,$210.00,'1-1-2021',5,1,2,5),
	(7,$220.00,'1-1-2021',8,2,3,7),
	(8,$230.00,'1-1-2021',14,3,1,4),
	(9,$240.00,'1-1-2021',10,4,4,1),
	(10,$250.00,'1-1-2021',12,5,5,2)
GO
SET IDENTITY_INSERT dbo.SalesSupplies OFF
GO
-- SalesRooms
SET IDENTITY_INSERT dbo.SalesRooms ON
GO
INSERT INTO [dbo].[SalesRooms]
	(ID, Price, DatePurchased, QuantityPurchased, TavernID, RoomID, GuestID)
VALUES
	(1,$310.00,'1-1-2021',4,1,2,10),
	(2,$320.00,'1-2-2021',6,2,3,1),
	(3,$330.00,'1-3-2021',9,3,1,3),
	(4,$340.00, '1-14-2021',1,4,4,4),
	(5,$350.00,'1-15-2021',3,5,5,5),
	(6,$310.00,'1-16-2021',5,1,2,6),
	(7,$320.00,'1-17-2021',8,2,3,8),
	(8,$330.00,'1-21-2021',14,3,1,9),
	(9,$340.00,'1-31-2021',10,4,4,2),
	(10,$350.00,'1-19-2021',12,5,5,7)
GO
SET IDENTITY_INSERT dbo.SalesRooms OFF
GO




