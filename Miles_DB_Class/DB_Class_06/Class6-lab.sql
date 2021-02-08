USE TavernsDB
GO

IF OBJECT_ID ( 'dbo.AddSupplySale', 'P' ) IS NOT NULL
    DROP PROCEDURE AddSupplySale;
GO

CREATE PROCEDURE AddSupplySale
  @TavernID int,
  @SupplyID int,
  @QuantityPurchased int,
  @GuestID int
AS
BEGIN

  DECLARE @Price money;
  SET @Price = (select price
  from Supplies
  where ID = @SupplyID);

  INSERT INTO SalesSupplies
    ( Price, DatePurchased, QuantityPurchased, TavernID, SupplyID, GuestID )
  Values(@Price, GETDATE(), @QuantityPurchased, @TavernID, @SupplyID, @GuestID);

-- UPDATE Inventory
--   SET CurrentCount = CurrentCount-1
-- Where ID = @SupplyID;

END
GO

DROP TRIGGER IF EXISTS dbo.UpdateInventory;
GO

CREATE TRIGGER dbo.UpdateInventory
ON SalesSupplies
AFTER INSERT
AS
  Declare @CurrentCount int, @QuantityPurchased int, SupplyID int
  BEGIN
  
  SET @CurrentCount = (SELECT TOP(1) CurrentCount FROM Inserted );
  SET @QuantityPurchased = (SELECT TOP(1) QuantityPurchased FROM Inserted );
  Set @SupplyID = (SELECT TOP(1) SupplyID FROM Inserted );

  UPDATE Inventory
    SET CurrentCount = @CurrentCount-@QuantityPurchased
  Where ID = @SupplyID;
END


select * from Inventory 
select * from Supplies
GO

exec AddSupplySale
@TavernID = 1,
  @SupplyID = 1,
  @QuantityPurchased = 1,
  @GuestID = 1
GO

select * from Inventory 
select * from Supplies
GO