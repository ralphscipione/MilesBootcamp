/*
Ralph Scipione
 DB Class 02 Assignment
 Due 1/24/2021

 Add Foreign Keys Script

*/

USE TavernsDB
GO
/* Users */
--UserRoles
ALTER TABLE dbo.UserRoles
   ADD CONSTRAINT  FK_UserRoles_Users FOREIGN KEY (UserID)
      REFERENCES dbo.Users(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
ALTER TABLE dbo.UserRoles
   ADD CONSTRAINT  FK_UserRoles_Roles FOREIGN KEY (RoleID)
      REFERENCES dbo.Roles(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
/* Taverns */
-- Taverns
ALTER TABLE dbo.Taverns
   ADD CONSTRAINT  FK_Taverns_Locations FOREIGN KEY (LocationID)
      REFERENCES dbo.Locations(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
ALTER TABLE dbo.Taverns
   ADD CONSTRAINT  FK_Taverns_Users FOREIGN KEY (OwnerID)
      REFERENCES dbo.Users(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
/* Guests */
-- Guests
ALTER TABLE dbo.Guests
   ADD CONSTRAINT  FK_Guests_GuestStatuses FOREIGN KEY (StatusID)
      REFERENCES dbo.GuestStatuses(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
-- Levels
ALTER TABLE dbo.Levels
   ADD CONSTRAINT  FK_Levels_Guests FOREIGN KEY (GuestID)
      REFERENCES dbo.Guests(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
ALTER TABLE dbo.Levels
   ADD CONSTRAINT  FK_Levels_Classes FOREIGN KEY (ClassID)
      REFERENCES dbo.Classes(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
/* Services */
-- Services
ALTER TABLE dbo.Services
   ADD CONSTRAINT  FK_Services_Taverns FOREIGN KEY (TavernID)
      REFERENCES dbo.Taverns(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
-- ServiceStatus
ALTER TABLE dbo.ServiceStatus
   ADD CONSTRAINT  FK_ServiceStatus_Status FOREIGN KEY (StatusID)
      REFERENCES dbo.Status(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
ALTER TABLE dbo.ServiceStatus
   ADD CONSTRAINT  FK_ServiceStatus_Services FOREIGN KEY (ServiceID)
      REFERENCES dbo.Services(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
/* Supplies */
-- SuppliesReceived
ALTER TABLE dbo.SuppliesReceived
   ADD CONSTRAINT  FK_SuppliesReceived_Supplies FOREIGN KEY (SupplyID)
      REFERENCES dbo.Supplies(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
ALTER TABLE dbo.SuppliesReceived
   ADD CONSTRAINT  FK_SuppliesReceived_Taverns FOREIGN KEY (TavernID)
      REFERENCES dbo.Taverns(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
-- TavernSupplies
ALTER TABLE dbo.TavernSupplies
   ADD CONSTRAINT  FK_TavernSupplies_Supplies FOREIGN KEY (SupplyID)
      REFERENCES dbo.Supplies(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
ALTER TABLE dbo.TavernSupplies
   ADD CONSTRAINT  FK_TavernSupplies_Taverns FOREIGN KEY (TavernID)
      REFERENCES dbo.Taverns(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
/* Sales */
-- SalesSupplies
ALTER TABLE dbo.SalesSupplies
   ADD CONSTRAINT  FK_SalesSupplies_Supplies FOREIGN KEY (SupplyID)
      REFERENCES dbo.Supplies(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
ALTER TABLE dbo.SalesSupplies
   ADD CONSTRAINT  FK_SalesSupplies_Sales FOREIGN KEY (SaleID)
      REFERENCES dbo.Sales(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
-- SalesServices
ALTER TABLE dbo.SalesServices
   ADD CONSTRAINT  FK_SalesServices_Services FOREIGN KEY (ServiceID)
      REFERENCES dbo.Services(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO
ALTER TABLE dbo.SalesServices
   ADD CONSTRAINT  FK_SalesServices_Sales FOREIGN KEY (SaleID)
      REFERENCES dbo.Sales(ID)
      ON DELETE CASCADE
      ON UPDATE CASCADE
GO