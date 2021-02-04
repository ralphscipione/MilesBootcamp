/*
Ralph Scipione
 DB Class 02 Assignment
 Due 1/24/2021
 **
 Modified for Class 03 
 Due 1/28/2021

 Add Foreign Keys Script

*/

USE TavernsDB
GO
/* Users */
--Users x
ALTER TABLE dbo.Users
   ADD CONSTRAINT  FK_Users_Roles FOREIGN KEY (RoleID)
      REFERENCES dbo.Roles(ID)
GO
/* Taverns */
-- Taverns
ALTER TABLE dbo.Taverns
   ADD CONSTRAINT  FK_Taverns_Locations FOREIGN KEY (LocationID)
      REFERENCES dbo.Locations(ID)
GO
ALTER TABLE dbo.Taverns
   ADD CONSTRAINT  FK_Taverns_Users FOREIGN KEY (OwnerID)
      REFERENCES dbo.Users(ID)
GO
/* Guests */
-- Guests
ALTER TABLE dbo.Guests
   ADD CONSTRAINT  FK_Guests_GuestStatuses FOREIGN KEY (StatusID)
      REFERENCES dbo.GuestStatuses(ID)
GO
-- Levels
ALTER TABLE dbo.Levels
   ADD CONSTRAINT  FK_Levels_Guests FOREIGN KEY (GuestID)
      REFERENCES dbo.Guests(ID)
GO
ALTER TABLE dbo.Levels
   ADD CONSTRAINT  FK_Levels_Classes FOREIGN KEY (ClassID)
      REFERENCES dbo.Classes(ID)
GO
/* Services */
-- SalesServices
ALTER TABLE dbo.SalesServices
   ADD CONSTRAINT  FK_SalesServices_Services FOREIGN KEY (ServiceID)
      REFERENCES dbo.Services(ID)
GO
ALTER TABLE dbo.SalesServices
   ADD CONSTRAINT  FK_SalesServices_Taverns FOREIGN KEY (TavernID)
      REFERENCES dbo.Taverns(ID)
GO
ALTER TABLE dbo.SalesServices
   ADD CONSTRAINT  FK_SalesServices_Guests FOREIGN KEY (GuestID)
      REFERENCES dbo.Guests(ID)
GO
/* Supplies */
-- Receiving
ALTER TABLE dbo.Receiving
   ADD CONSTRAINT  FK_Receiving_Supplies FOREIGN KEY (SupplyID)
      REFERENCES dbo.Supplies(ID)
GO
ALTER TABLE dbo.Receiving
   ADD CONSTRAINT  FK_Receiving_Taverns FOREIGN KEY (TavernID)
      REFERENCES dbo.Taverns(ID)
GO
-- TavernSupplies
ALTER TABLE dbo.Inventory
   ADD CONSTRAINT  FK_Inventory_Supplies FOREIGN KEY (SupplyID)
      REFERENCES dbo.Supplies(ID)
GO
ALTER TABLE dbo.Inventory
   ADD CONSTRAINT  FK_Inventory_Taverns FOREIGN KEY (TavernID)
      REFERENCES dbo.Taverns(ID)
GO
-- SalesSupplies
ALTER TABLE dbo.SalesSupplies
   ADD CONSTRAINT  FK_SalesSupplies_Supplies FOREIGN KEY (SupplyID)
      REFERENCES dbo.Supplies(ID)
GO
ALTER TABLE dbo.SalesSupplies
   ADD CONSTRAINT  FK_SalesSupplies_Taverns FOREIGN KEY (TavernID)
      REFERENCES dbo.Taverns(ID)

GO
ALTER TABLE dbo.SalesSupplies
	ADD CONSTRAINT FK_SalesSupplies_Guests FOREIGN KEY (GuestID)
		REFERENCES dbo.Guests(ID)
GO
/* Rooms */
--Rooms
ALTER TABLE dbo.Rooms
	ADD CONSTRAINT FK_Rooms_RoomStatuses FOREIGN KEY (RoomStatusID)
		REFERENCES dbo.RoomStatuses(ID)
GO
-- SalesRooms
ALTER TABLE dbo.SalesRooms
	ADD CONSTRAINT FK_SalesRooms_Rooms FOREIGN KEY (RoomID)
		REFERENCES dbo.Rooms(ID)
GO
ALTER TABLE dbo.SalesRooms
	ADD CONSTRAINT FK_SalesRooms_Taverns FOREIGN KEY (TavernID)
		REFERENCES dbo.Taverns(ID)
GO
ALTER TABLE dbo.SalesRooms
	ADD CONSTRAINT FK_SalesRooms_Guests FOREIGN KEY (GuestID)
		REFERENCES dbo.Guests(ID)
GO