/*
Ralph Scipione
 DB Class 02 Assignment
 Due 1/24/2021
 **
 Modified for Class 03 
 Due 1/28/2021

 Drop & Create Tables Script


*/

USE TavernsDB
GO
/* USERS */
-- Users
DROP TABLE IF EXISTS [dbo].[Users]
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[BirthDate] [datetime] NOT NULL
)
GO
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK_Users] PRIMARY KEY ([ID])
GO  
-- Roles
DROP TABLE IF EXISTS [dbo].[Roles]
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	CONSTRAINT [PK_Roles] PRIMARY KEY ([ID]),
)
GO
-- UserRoles
DROP TABLE IF EXISTS [dbo].[UserRoles]
GO
CREATE TABLE [dbo].[UserRoles](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
	CONSTRAINT [PK_UserRoles] PRIMARY KEY ([UserID],[RoleID])
)
GO
/* TAVERNS */
-- Locations
DROP TABLE IF EXISTS [dbo].[Locations]
GO
CREATE TABLE [dbo].[Locations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Location] [varchar](250) NOT NULL,
	CONSTRAINT [PK_Locations] PRIMARY KEY ([ID])
)
GO
-- Taverns
DROP TABLE IF EXISTS [dbo].[Taverns]
GO
CREATE TABLE [dbo].[Taverns](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[FloorsCount] [int] NOT NULL,
	[OwnerID] [int] NOT NULL,
	[LocationID] [int] NOT NULL
 )
GO
ALTER TABLE [dbo].[Taverns] ADD CONSTRAINT [PK_Taverns] PRIMARY KEY ([ID])
GO 
-- BasementRats
-- DROP TABLE IF EXISTS [dbo].[BasementRats]
-- GO
-- CREATE TABLE [dbo].[BasementRats](
-- 	[ID] [int] IDENTITY(1,1) NOT NULL,
-- 	[Name] [varchar](250) NOT NULL,
-- 	[TavernID] [int] NOT NULL,
-- 	CONSTRAINT [PK_BasementRats] PRIMARY KEY ([ID])
-- )
-- GO

/* GUESTS */
-- GuestStatuses
DROP TABLE IF EXISTS [dbo].[GuestStatuses]
GO
CREATE TABLE [dbo].[GuestStatuses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	CONSTRAINT [PK_GuestStatuses] PRIMARY KEY ([ID])
 )
GO
-- Guests
DROP TABLE IF EXISTS [dbo].[Guests]
GO
CREATE TABLE [dbo].[Guests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Notes] [varchar](4000),
	[BirthDate] [datetime] NOT NULL,
	[CakeDay] [datetime],
	[StatusID] [int] NOT NULL,
	CONSTRAINT [PK_Guests] PRIMARY KEY ([ID])
)
GO
-- Classes
DROP TABLE IF EXISTS [dbo].[Classes]
GO
CREATE TABLE [dbo].[Classes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	CONSTRAINT [PK_Classes] PRIMARY KEY ([ID])
 )
GO
-- Levels
DROP TABLE IF EXISTS [dbo].[Levels]
GO
CREATE TABLE [dbo].[Levels](
	[GuestID] [int] NOT NULL,
	[ClassID] [int] NOT NULL,
	[Level] [int] NOT NULL,
	[DateAchieved] [datetime] NOT NULL,
	CONSTRAINT [PK_Levels] PRIMARY KEY ([GuestID],[ClassID],[Level])
)
GO
/* SERVICES */
-- Services
DROP TABLE IF EXISTS [dbo].[Services]
GO
CREATE TABLE [dbo].[Services](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Unit] [varchar](250) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[TavernID] [int] NOT NULL,
	CONSTRAINT [PK_Services] PRIMARY KEY ([ID])
)
GO
-- Status
DROP TABLE IF EXISTS [dbo].[Status]
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](250) NOT NULL,
	CONSTRAINT [PK_Status] PRIMARY KEY ([ID])
 )
GO
-- ServiceStatus
DROP TABLE IF EXISTS [dbo].[ServiceStatus]
GO
CREATE TABLE [dbo].[ServiceStatus](
	[ServiceID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	CONSTRAINT [PK_ServiceStatus] PRIMARY KEY ([ServiceID],[StatusID])
 )
GO
/* SUPPLIES */
-- Supplies
DROP TABLE IF EXISTS [dbo].[Supplies]
GO
CREATE TABLE [dbo].[Supplies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
	[Unit] [varchar](250) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	CONSTRAINT [PK_Supplies] PRIMARY KEY ([ID])
 )
GO
-- SuppliesReceived
DROP TABLE IF EXISTS [dbo].[SuppliesReceived]
GO
CREATE TABLE [dbo].[SuppliesReceived](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TavernID] [int] NOT NULL,
	[SupplyID] [int] NOT NULL,
	[Cost] [money] NOT NULL,
	[AmountReceived] [int] NOT NULL,
	[ReceivedDate] [datetime] NOT NULL,
	CONSTRAINT [PK_SuppliesReceived] PRIMARY KEY ([ID])
 )
GO
-- TavernSupplies
DROP TABLE IF EXISTS [dbo].[TavernSupplies]
GO
CREATE TABLE [dbo].[TavernSupplies](
	[TavernID] [int] NOT NULL,
	[SupplyID] [int] NOT NULL,
	[CurrentCount] [int] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	CONSTRAINT [PK_TavernSupplies] PRIMARY KEY ([TavernID],[SupplyID])
)
GO
/* ROOMS */
-- RoomStatuses
DROP TABLE IF EXISTS [dbo].[RoomStatuses]
GO
CREATE TABLE [dbo].[RoomStatuses](
	[ID] [tinyint] IDENTITY(1,1) NOT NULL,
	[Status] [varchar](250) NOT NULL,
	CONSTRAINT [PK_RoomStatuses] PRIMARY KEY ([ID])
 )
GO
-- Rooms
DROP TABLE IF EXISTS [dbo].[Rooms]
GO
CREATE TABLE [dbo].[Rooms](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	Name varchar(250) NOT NULL,
	[TavernID] [int] NOT NULL,
	[Rate] [money] NOT NULL,
	[RoomStatusID] [tinyint] NOT NULL,
	
	CONSTRAINT [PK_Rooms] PRIMARY KEY (ID)
)
GO
/* SALES */
-- Sales
DROP TABLE IF EXISTS [dbo].[Sales]
GO
CREATE TABLE [dbo].[Sales](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TavernID] [int] NOT NULL,
	[GuestID] [int] NOT NULL,
	[PurchaseAmount] [money] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	CONSTRAINT [PK_Sales] PRIMARY KEY ([ID])
)
GO
-- SalesServices
DROP TABLE IF EXISTS [dbo].[SalesServices]
GO
CREATE TABLE [dbo].[SalesServices](
	[SaleID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[UnitPriceSold] [money] NOT NULL, 
	[Quantity] [int] NOT NULL,
	CONSTRAINT [PK_SalesService] PRIMARY KEY ([SaleID],[ServiceID])
)
GO
-- SalesSupplies
DROP TABLE IF EXISTS [dbo].[SalesSupplies]
GO
CREATE TABLE [dbo].[SalesSupplies](
	[SaleID] [int] NOT NULL,
	[SupplyID] [int] NOT NULL,
	[UnitPriceSold] [money] NOT NULL, 
	[Quantity] [int] NOT NULL,
	CONSTRAINT [PK_SalesSupplies] PRIMARY KEY ([SaleID],[SupplyID])
)
GO
-- SalesRooms
DROP TABLE IF EXISTS [dbo].[SalesRooms]
GO
CREATE TABLE [dbo].[SalesRooms](
	[SaleID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[RateSold] [money],
	[StayDate] [datetime] NOT NULL
	CONSTRAINT PK_SalesRooms PRIMARY KEY (SaleID, RoomID, StayDate)
)
GO