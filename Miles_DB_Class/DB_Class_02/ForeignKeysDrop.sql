/*
Ralph Scipione
 DB Class 02 Assignment
 Due 1/24/2021

 Drop Foreign Keys Script

*/

USE TavernsDB
GO
/* Users */
--UserRoles
ALTER TABLE dbo.UserRoles
   DROP CONSTRAINT  FK_UserRoles_Users
GO
ALTER TABLE dbo.UserRoles
   DROP CONSTRAINT  FK_UserRoles_Roles 
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
-- Services
ALTER TABLE dbo.Services
   DROP CONSTRAINT  FK_Services_Taverns 
GO
-- ServiceStatus
ALTER TABLE dbo.ServiceStatus
   DROP CONSTRAINT  FK_ServiceStatus_Status 
GO
ALTER TABLE dbo.ServiceStatus
   DROP CONSTRAINT  FK_ServiceStatus_Services 
GO
/* Supplies */
ALTER TABLE dbo.SuppliesReceived
   DROP CONSTRAINT  FK_SuppliesReceived_Supplies 
GO
ALTER TABLE dbo.SuppliesReceived
   DROP CONSTRAINT  FK_SuppliesReceived_Taverns 
GO
-- TavernSupplies
ALTER TABLE dbo.TavernSupplies
   DROP CONSTRAINT  FK_TavernSupplies_Supplies 
GO
ALTER TABLE dbo.TavernSupplies
   DROP CONSTRAINT  FK_TavernSupplies_Taverns 
GO
/* Sales */
-- SalesSupplies
ALTER TABLE dbo.SalesSupplies
   DROP CONSTRAINT  FK_SalesSupplies_Supplies 
GO
ALTER TABLE dbo.SalesSupplies
   DROP CONSTRAINT  FK_SalesSupplies_Sales 
GO
-- SalesServices
ALTER TABLE dbo.SalesServices
   DROP CONSTRAINT  FK_SalesServices_Services 
GO
ALTER TABLE dbo.SalesServices
   DROP CONSTRAINT  FK_SalesServices_Sales 
GO