 /*
Ralph Scipione
 DB Class 01 Assignment
 1/11/2021

 Seed Data Script

InsertOrder

Roles
Users
Supplies
Status
Locations -- will need to move under Taverns if relationship changes to Taverns
	UserRoles
	Taverns
		BasementRats
		SuppliesReceived
		Inventory
		Services
			Sales
			ServiceStatus
*/

USE [TavernsDB]
GO

--Roles
INSERT INTO [dbo].[Roles] ([ID], [Name])
	VALUES
		(1, 'Owner'),
		(2, 'Manager'),
		(3, 'Cashier'),
		(4, 'Chef'),
		(5, 'Waiter')
GO

--Users
INSERT INTO [dbo].[Users] ([ID] ,[Name], [DOB])
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

--Supplies
INSERT INTO [dbo].[Supplies] ([ID], [Name], [Unit])
     VALUES
           (1, 'Strong Ale','24-case 12oz bottles'),
		   (2, 'Light Ale','24-case 12oz bottles'),
		   (3, 'India Pale Ale','12-case 16oz bottles'),
		   (4, 'Stout','12-case 12oz cans'),
		   (5, 'Beer','30-case 12oz cans')
GO
--Status
INSERT INTO [dbo].[Status] ([ID], [Status])
     VALUES
           (1, 'OK'),
		   (2, 'Discontinued'),
		   (3, 'Temporarily Unavailable'),
		   (4, 'Out of Stock'),
		   (5, 'Out of Season')
GO
--Locations
INSERT INTO [dbo].[Locations] ([ID], [Location])
     VALUES
           (1,'Phildadelphia'),
		   (2,'Atlantic City'),
		   (3,'New York City'),
		   (4,'Miami'),
		   (5,'Fort Lauderdale')
GO
--UserRoles
INSERT INTO [dbo].[UserRoles] ([UserID], [RoleID])
     VALUES
           (1,1),
		   (2,2),
		   (2,3),
		   (3,2),
		   (3,3),
		   (4,4),
		   (4,5),
		   (5,3),
		   (5,5),
		   (5,4)
GO
--Taverns
INSERT INTO [dbo].[Taverns] ([ID], [Name], [FloorsCount], [OwnerID], [LocationID])
     VALUES
           (1, 'The Ale House', 3, 6, 1),
		   (2, 'Ye Old Pub', 3, 6, 1),
		   (3, 'The Watering Hole', 3, 6, 1),
		   (4, 'Pub & Grub', 3, 6, 1),
		   (5, 'The Rest Stop', 3, 6, 1)
GO
--BasementRats
INSERT INTO [dbo].[BasementRats] ([ID], [Name], [TavernID])
     VALUES
           (1,'Fluffy',1),
		   (2,'Hairy',1),
		   (3,'Red',2),
		   (4,'Inky',3),
		   (5,'Blinky',3),
		   (6,'Clyde',4),
		   (7,'Happy',4),
		   (8,'Slippery',5),
		   (9,'RobesPierre',5),
		   (10,'Fred',2)
GO
--SuppliesReceived
INSERT INTO [dbo].[SuppliesReceived] ([ID], [TavernID], [SupplyID], [Cost], [AmountReceived], [ReceivedDate])
     VALUES
           (1,1,1,'45.00',1,'1-1-2021'),
		   (2,1,2,'50.00',2,'1-8-2021'),
		   (3,1,3,'55.00',1,'1-15-2021'),
		   (4,2,4,'60.00',2,'1-2-2021'),
		   (5,2,5,'60.00',3,'1-9-2021'),
		   (6,2,1,'45.00',1,'1-16-2021'),
		   (7,3,2,'50.00',2,'1-3-2021'),
		   (8,3,3,'55.00',1,'1-10-2021'),
		   (9,3,4,'60.00',2,'1-17-2021'),
		   (10,4,5,'60.00',3,'1-4-2021'),
		   (11,4,1,'45.00',1,'1-11-2021'),
		   (12,4,2,'50.00',2,'1-18-2021'),
		   (13,5,3,'55.00',1,'1-5-2021'),
		   (14,5,4,'60.00',2,'1-12-2021'),
		   (15,5,5,'60.00',3,'1-19-2021')
GO
--Inventory
INSERT INTO [dbo].[Inventory] ([TavernID], [SupplyID], [CurrentCount], [UpdatedDate])
     VALUES
		   (1,1,1,'1-1-2021'),
		   (2,1,2,'1-8-2021'),
		   (3,1,1,'1-15-2021'),
		   (4,2,2,'1-2-2021'),
		   (5,2,3,'1-9-2021'),
		   (6,2,1,'1-16-2021'),
		   (7,3,2,'1-3-2021'),
		   (8,3,1,'1-10-2021'),
		   (9,3,2,'1-17-2021'),
		   (10,4,3,'1-4-2021'),
		   (11,4,1,'1-11-2021'),
		   (12,4,2,'1-18-2021'),
		   (13,5,1,'1-5-2021'),
		   (14,5,2,'1-12-2021'),
		   (15,5,3,'1-19-2021')
GO

--Services
INSERT INTO [dbo].[Services] ([ID], [Name], [TavernID])
     VALUES
           (1,'Pool Use',1),
		   (2,'Weapon Sharpening',1),
		   (3,'Eyeglass Repair',2),
		   (4,'Massage',2),
		   (5,'Haircut',3),
		   (6,'Shave',3),
		   (7,'Nail Salon',4),
		   (8,'Gas',4),
		   (9,'Food',5),
		   (10,'Drink',5)
GO
--Sales
INSERT INTO [dbo].[Sales] ([ID], [TavernID], [ServiceID], [Guest], [Price], [PurchaseAmount], [PurchaseDate])
     VALUES           
		   (1, 1, 1,'John Doe','50.00', '100.00', '1-1-2021'),
		   (2, 1, 10,'Fred Flintstone','50.00', '150.00', '1-2-2021'),
		   (3, 2, 2,'Joe Schmoe','50.00', '200.00', '1-3-2021'),
		   (4, 2, 9,'Al Coholic','50.00', '250.00', '1-4-2021'),
		   (5, 3, 3,'Jane Doe','50.00', '300.00', '1-5-2021'),
		   (6, 3, 8,'Mary Jane','50.00', '350.00', '1-6-2021'),
		   (7, 4, 4,'Hondo Lane','50.00', '100.00', '1-7-2021'),
		   (8, 4, 7,'Lady Luck','50.00', '100.00', '1-8-2021'),
		   (9, 5, 5,'Festus Haggen','50.00', '50.00', '1-9-2021'),
		   (10, 5, 1,'John Wayne','25.00', '100.00', '1-10-2021')
GO

--ServiceStatus
INSERT INTO [dbo].[ServiceStatus] ([ServiceID], [StatusID])
     VALUES
           (1,1),
		   (2,1),
		   (3,1),
		   (4,1),
		   (5,1),
		   (6,1),
		   (7,1),
		   (8,1),
		   (9,1),
		   (10,1)
GO
