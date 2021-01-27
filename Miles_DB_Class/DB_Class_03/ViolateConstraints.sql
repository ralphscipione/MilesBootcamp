
/*
Ralph Scipione
 DB Class 02 Assignment
 Due 1/24/2021
 **
 Modified for Class 03 
 Due 1/28/2021

 "Show that there are constraints by making insertions or queries that will fail due to foreign key constraints ..."


*/
USE TavernsDB
GO

-- Violate FK_UserRoles_Users
INSERT INTO [dbo].[UserRoles]
	([UserID],[RoleID])
VALUES
	(101, 20)
GO
-- Violate FK_UserRoles_Roles
INSERT INTO [dbo].[UserRoles]
	([UserID],[RoleID])
VALUES
	(1, 101)
GO
-- Violate FK_Taverns_Locations 
INSERT INTO [dbo].[Taverns]
	([Name], [FloorsCount], [OwnerID], [LocationID])
VALUES
	('My Pub', 3, 1, 101)
GO
-- Violate FK_Taverns_Users 
INSERT INTO [dbo].[Taverns]
	([Name], [FloorsCount], [OwnerID], [LocationID])
VALUES
	('My Pub', 3, 101, 1)
GO
-- Violate FK_Guests_GuestStatuses 
INSERT INTO [dbo].[Guests]
	([Name],[Notes], [BirthDate], StatusID)
VALUES
	('Joe Day', 'Hates red wine', '1970-03-18',101)
GO
-- Violate FK_Levels_Guests
INSERT INTO [dbo].[Levels]
	([GuestID],[ClassID], [Level], [DateAchieved])
VALUES
	(100, 2, 2, '1-1-2021')
GO
-- Violate FK_Levels_Classes
INSERT INTO [dbo].[Levels]
	([GuestID],[ClassID], [Level], [DateAchieved])
VALUES
	(1, 200, 2, '1-1-2021')
GO
-- Violate FK_Services_Taverns 
INSERT INTO [dbo].[Services]
	([Name], [Unit], [UnitPrice], [TavernID])
VALUES
	('Pool Use', 'day', '10', 100)
GO
-- Violate FK_ServiceStatus_Status
 INSERT INTO [dbo].[ServiceStatus]
	([ServiceID], [StatusID])
VALUES
	(1, 100)
GO
-- Violate FK_ServiceStatus_Services
 INSERT INTO [dbo].[ServiceStatus]
	([ServiceID], [StatusID])
VALUES
	(100, 1)
	GO
-- Violate FK_SuppliesReceived_Supplies 
INSERT INTO [dbo].[SuppliesReceived]
	([TavernID], [SupplyID], [Cost], [AmountReceived], [ReceivedDate])
VALUES
	(1, 100, '45.00', 100, '1-1-2021')
GO
--Violate FK_SuppliesReceived_Taverns 
INSERT INTO [dbo].[SuppliesReceived]
	([TavernID], [SupplyID], [Cost], [AmountReceived], [ReceivedDate])
VALUES
	(100, 1, '45.00', 100, '1-1-2021')
GO
-- Violate FK_TavernSupplies_Supplies 
INSERT INTO [dbo].[TavernSupplies]
	([TavernID], [SupplyID], [CurrentCount], [UpdatedDate])
VALUES
	(1, 100, 1000, '1-1-2021')
GO
-- Violate FK_TavernSupplies_Taverns 
INSERT INTO [dbo].[TavernSupplies]
	([TavernID], [SupplyID], [CurrentCount], [UpdatedDate])
VALUES
	(100, 1, 1000, '1-1-2021')
GO
--Violate FK_SalesSupplies_Supplies 
INSERT INTO [dbo].[SalesSupplies]
	(SaleID, SupplyID, UnitPriceSold, Quantity)
VALUES
	(1,100,'200.00',1)
--Violate FK_SalesSupplies_Sales 
INSERT INTO [dbo].[SalesSupplies]
	(SaleID, SupplyID, UnitPriceSold, Quantity)
VALUES
	(1000,1,'125.00',1)
GO
--  Violate FK_SalesServices_Services 
INSERT INTO [dbo].[SalesServices]
	(SaleID, ServiceID, UnitPriceSold, Quantity)
VALUES
	(1,200,'130.00',1)
GO
--Violate FK_SalesServices_Sales 
INSERT INTO [dbo].[SalesServices]
	(SaleID, ServiceID, UnitPriceSold, Quantity)
VALUES
	(1000,2,'130.00',1)
GO
--Violate FK_Rooms_RoomStatuses 
INSERT INTO [dbo].[Rooms]
	([Name], [Rate], [RoomStatusID], [TavernID])
VALUES
	('Room 1', '100.00', 200,1)
GO
