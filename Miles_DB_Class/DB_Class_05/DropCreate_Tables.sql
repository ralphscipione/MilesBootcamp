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
	[Name] [varchar](100) NOT NULL,
	[RoleID] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK_Users] PRIMARY KEY ([ID])
GO  
-- Roles x
DROP TABLE IF EXISTS [dbo].[Roles]
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](250) NOT NULL,
	CONSTRAINT [PK_Roles] PRIMARY KEY ([ID]),
)
GO

/* TAVERNS */
-- Locations
DROP TABLE IF EXISTS [dbo].[Locations]
GO
CREATE TABLE [dbo].[Locations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	CONSTRAINT [PK_Locations] PRIMARY KEY ([ID])
)
GO
-- Taverns
DROP TABLE IF EXISTS [dbo].[Taverns]
GO
CREATE TABLE [dbo].[Taverns](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
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
	[Name] [varchar](100) NOT NULL,
	CONSTRAINT [PK_GuestStatuses] PRIMARY KEY ([ID])
 )
GO
-- Guests
DROP TABLE IF EXISTS [dbo].[Guests]
GO
CREATE TABLE [dbo].[Guests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Notes] [varchar](250),
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
-- Status
DROP TABLE IF EXISTS [dbo].[Status]
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	CONSTRAINT [PK_Status] PRIMARY KEY ([ID])
 )
GO
-- Services
DROP TABLE IF EXISTS [dbo].[Services]
GO
CREATE TABLE [dbo].[Services](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[StatusID] [int] NOT NULL,
	Price money NOT NULL,
	CONSTRAINT [PK_Services] PRIMARY KEY ([ID])
)
GO
-- SalesServices
DROP TABLE IF EXISTS dbo.SalesServices
GO
CREATE TABLE dbo.SalesServices(
	ID int IDENTITY(1,1) NOT NULL,
	Price money NOT NULL,
	DatePurchased datetime NOT NULL,
	QuantityPurchased int NOT NULL,
	TavernID int NOT NULL,
	ServiceID int NOT NULL,
	GuestID int NOT NULL,
	CONSTRAINT PK_SalesService PRIMARY KEY (ID)
)
GO
/* SUPPLIES */
-- Supplies
DROP TABLE IF EXISTS dbo.Supplies
GO
CREATE TABLE dbo.Supplies(
	ID int IDENTITY(1,1) NOT NULL,
	Name varchar (100) NOT NULL,
	Unit varchar (100) NOT NULL,
	Price money NOT NULL,
	CONSTRAINT  PK_Supplies  PRIMARY KEY (ID)
 )
GO
-- SuppliesReceived
DROP TABLE IF EXISTS dbo.Receiving
GO
CREATE TABLE dbo.Receiving(
	ID int IDENTITY(1,1) NOT NULL,
	TavernID int NOT NULL,
	SupplyID int NOT NULL,
	Cost money NOT NULL,
	Quantity int NOT NULL,
	ReceivedDate datetime NOT NULL,
	CONSTRAINT PK_Receiving PRIMARY KEY ([ID])
 )
GO
-- Inventory
DROP TABLE IF EXISTS dbo.Inventory
GO
CREATE TABLE dbo.Inventory(
	TavernID int NOT NULL,
	SupplyID int NOT NULL,
	Count int NOT NULL,
	UpdatedDate datetime NOT NULL,
	CONSTRAINT PK_Inventory PRIMARY KEY (TavernID,SupplyID)
)
GO
-- SalesSupplies
DROP TABLE IF EXISTS dbo.SalesSupplies
GO
CREATE TABLE dbo.SalesSupplies(
	ID int IDENTITY(1,1) NOT NULL,
	Price money NOT NULL,
	DatePurchased datetime NOT NULL,
	QuantityPurchased int NOT NULL,
	TavernID int NOT NULL,
	SupplyID int NOT NULL,
	GuestID int NOT NULL,
	CONSTRAINT PK_SalesSupplies PRIMARY KEY (ID)
)
GO
/* ROOMS */
-- RoomStatuses
DROP TABLE IF EXISTS [dbo].[RoomStatuses]
GO
CREATE TABLE [dbo].[RoomStatuses](
	ID int IDENTITY(1,1) NOT NULL,
	Name varchar (100) NOT NULL,
	CONSTRAINT [PK_RoomStatuses] PRIMARY KEY ([ID])
 )
GO
-- Rooms
DROP TABLE IF EXISTS dbo.Rooms
GO
CREATE TABLE [dbo].[Rooms](
	ID int IDENTITY(1,1) NOT NULL,
	RoomStatusID int NOT NULL,
	TavernID int NOT NULL,
	Price money NOT NULL,
	CONSTRAINT [PK_Rooms] PRIMARY KEY (ID)
)
GO
-- SalesRooms
DROP TABLE IF EXISTS dbo.SalesRooms
GO
CREATE TABLE dbo.SalesRooms(
	ID int IDENTITY(1,1) NOT NULL,
	Price money NOT NULL,
	DatePurchased datetime NOT NULL,
	QuantityPurchased int NOT NULL,
	TavernID int NOT NULL,
	RoomID int NOT NULL,
	GuestID int NOT NULL,
	CONSTRAINT PK_SalesRooms PRIMARY KEY (ID)
)
GO