-- Ralph Scipione
-- DB Class 01 Assignment
-- 1/11/2021

-- Create Tables Script

USE TavernsDB;
GO
 
-- BasementRats
DROP TABLE IF EXISTS [dbo].[BasementRats]
GO

CREATE TABLE [dbo].[BasementRats](
	[ID] [int] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[TavernID] [int] NOT NULL
)
GO

-- Inventory
DROP TABLE IF EXISTS [dbo].[Inventory]
GO

CREATE TABLE [dbo].[Inventory](
	[TavernID] [int] NOT NULL,
	[SupplyID] [int] NOT NULL,
	[CurrentCount] [int] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL)
GO

-- Locations
DROP TABLE IF EXISTS [dbo].[Locations]
GO

CREATE TABLE [dbo].[Locations](
	[ID] [int] NOT NULL,
	[Location] [varchar](250) NOT NULL
)
GO

-- Roles
DROP TABLE IF EXISTS [dbo].[Roles]
GO

CREATE TABLE [dbo].[Roles](
	[ID] [int] NOT NULL,
	[Name] [varchar](250) NOT NULL
)
GO

-- Sales
DROP TABLE IF EXISTS [dbo].[Sales]
GO

CREATE TABLE [dbo].[Sales](
	[ID] [int] NOT NULL,
	[TavernID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[Guest] [varchar](250) NOT NULL,
	[Price] [money] NOT NULL,
	[PurchaseAmount] [money] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL
)
GO

-- Services
DROP TABLE IF EXISTS [dbo].[Services]
GO

CREATE TABLE [dbo].[Services](
	[ID] [int] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[TavernID] [int] NOT NULL
)
GO

-- ServiceStatus
DROP TABLE IF EXISTS [dbo].[ServiceStatus]
GO

CREATE TABLE [dbo].[ServiceStatus](
	[ServiceID] [int] NOT NULL,
	[StatusID] [int] NOT NULL
 )
GO

--Status
DROP TABLE IF EXISTS [dbo].[Status]
GO

CREATE TABLE [dbo].[Status](
	[ID] [int] NOT NULL,
	[Status] [varchar](250) NOT NULL
 )
GO

-- Supplies
DROP TABLE IF EXISTS [dbo].[Supplies]
GO

CREATE TABLE [dbo].[Supplies](
	[ID] [int] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Unit] [varchar](250) NOT NULL
 )
GO

-- SuppliesReceived
DROP TABLE IF EXISTS [dbo].[SuppliesReceived]
GO

CREATE TABLE [dbo].[SuppliesReceived](
	[ID] [int] NOT NULL,
	[TavernID] [int] NOT NULL,
	[SupplyID] [int] NOT NULL,
	[Cost] [money] NOT NULL,
	[AmountReceived] [int] NOT NULL,
	[ReceivedDate] [datetime] NOT NULL
 )
GO

-- Taverns
DROP TABLE IF EXISTS [dbo].[Taverns]
GO

CREATE TABLE [dbo].[Taverns](
	[ID] [int] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[FloorsCount] [int] NOT NULL,
	[OwnerID] [int] NOT NULL,
	[LocationID] [int] NOT NULL
 )
GO

--UserRoles
DROP TABLE IF EXISTS [dbo].[UserRoles]
GO

CREATE TABLE [dbo].[UserRoles](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL
)
GO

-- Users
DROP TABLE IF EXISTS [dbo].[Users]
GO

CREATE TABLE [dbo].[Users](
	[ID] [int] NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[DOB] [datetime] NOT NULL
)
GO

