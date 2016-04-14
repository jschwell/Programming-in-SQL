USE MyGuitarShop;
GO

-- Create trigger
CREATE TRIGGER Products_INSERT
	ON Products
	AFTER INSERT
AS
	DECLARE @DateAdded datetime;

	SELECT @DateAdded = DateAdded
	FROM Inserted;

	IF @DateAdded IS NULL
		BEGIN
			UPDATE Products
			SET DateAdded = GETDATE()
			WHERE ProductID IN (SELECT ProductID FROM Inserted);
		END;
GO

-- Test trigger
INSERT INTO Products (CategoryID, ProductCode, ProductName, Description,
	ListPrice, DiscountPercent)
VALUES (3, 'td25kv', 'TD-25KV V-Tour Drum Kit', '', 2499.99, 20.00);