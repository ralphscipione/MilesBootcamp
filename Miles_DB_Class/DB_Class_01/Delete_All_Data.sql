 /*
Ralph Scipione
 DB Class 01 Assignment
 1/11/2021

 Delet All Data Script

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

DELETE FROM [dbo].[ServiceStatus]
GO

DELETE FROM [dbo].[Sales]
GO

DELETE FROM [dbo].[Services]
GO 

DELETE FROM [dbo].[Inventory]
GO

DELETE FROM [dbo].[SuppliesReceived]
GO

DELETE FROM [dbo].[BasementRats]
GO

DELETE FROM [dbo].[Taverns]
GO

DELETE FROM [dbo].[UserRoles]
GO

DELETE FROM [dbo].[Locations]
GO

DELETE FROM [dbo].[Status]
GO

DELETE FROM [dbo].[Supplies]
GO

DELETE FROM [dbo].[Users]
GO

DELETE FROM [dbo].[Roles]
GO