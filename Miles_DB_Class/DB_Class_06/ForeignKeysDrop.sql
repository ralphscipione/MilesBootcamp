/*
Ralph Scipione
 DB Class 02 Assignment
 Due 1/24/2021
 **
 Modified for Class 03 
 Due 1/28/2021

 Drop Foreign Keys Script

*/

USE TavernsDB
GO
/* Users */
--UserRoles

ALTER TABLE dbo.Users
   DROP CONSTRAINT FK_Users_Roles 
GO
/* Taverns */
-- Taverns
ALTER TABLE dbo.Taverns
   DROP CONSTRAINT  FK_Taverns_Locations 
GO
ALTER TABLE dbo.Taverns
   DROP CONSTRAINT  FK_Taverns_Users 
GO
/* Guests */
-- Guests
ALTER TABLE dbo.Guests
   DROP CONSTRAINT  FK_Guests_GuestStatuses 
GO
-- Levels
ALTER TABLE dbo.Levels
   DROP CONSTRAINT  FK_Levels_Guests
GO
ALTER TABLE dbo.Levels
   DROP CONSTRAINT  FK_Levels_Classes 
GO
/* Services */
-- SalesServices
ALTER TABLE dbo.SalesServices
   DROP CONSTRAINT  FK_SalesServices_Services 
GO
ALTER TABLE dbo.SalesServices
   DROP CONSTRAINT  FK_SalesServices_Taverns
GO
ALTER TABLE dbo.SalesServices
   DROP CONSTRAINT  FK_SalesServices_Guests  
GO
/* Supplies */
-- Receiving
ALTER TABLE dbo.Receiving
   DROP CONSTRAINT  FK_Receiving_Supplies 
GO
ALTER TABLE dbo.Receiving
   DROP CONSTRAINT  FK_Receiving_Taverns 
GO
-- Inventory
ALTER TABLE dbo.Inventory
   DROP CONSTRAINT  FK_Inventory_Supplies 
GO
ALTER TABLE dbo.Inventory
   DROP CONSTRAINT  FK_Inventory_Taverns 
GO
-- SalesSupplies
ALTER TABLE dbo.SalesSupplies
   DROP CONSTRAINT  FK_SalesSupplies_Supplies 
GO
ALTER TABLE dbo.SalesSupplies
   DROP CONSTRAINT  FK_SalesSupplies_Taverns 
GO
ALTER TABLE dbo.SalesSupplies
   DROP CONSTRAINT  FK_SalesSupplies_Guests 
GO
/* Rooms */
-- Rooms
ALTER TABLE dbo.Rooms
	DROP CONSTRAINT FK_Rooms_RoomStatuses 
GO
-- SalesRooms
ALTER TABLE dbo.SalesRooms
	DROP CONSTRAINT FK_SalesRooms_Rooms
GO
ALTER TABLE dbo.SalesRooms
	DROP CONSTRAINT FK_SalesRooms_Taverns 
GO
ALTER TABLE dbo.SalesRooms
	DROP CONSTRAINT FK_SalesRooms_Guests 
GO