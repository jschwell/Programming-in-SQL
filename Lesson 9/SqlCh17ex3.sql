USE MyGuitarShop;

-- Create table
CREATE TABLE CustomerArchive
(
    CustomerID			int				PRIMARY KEY,
    EmailAddress		varchar(255)	NOT NULL,
	Password			varchar(60)		NOT NULL,
	FirstName			varchar(60)		NOT NULL,
	LastName			varchar(60)		NOT NULL,
	ShippingAddressID	int				NULL,
	BillingAddressID	int				NULL
);
GO

DECLARE @CustomerID int;
SELECT @CustomerID = CustomerID
FROM Customers
WHERE NOT EXISTS
	(SELECT * FROM Orders
	 WHERE Orders.CustomerID = Customers.CustomerID);

-- Transaction
BEGIN TRY
IF (@CustomerID IS NOT NULL)
	BEGIN
		BEGIN TRAN;
			INSERT CustomerArchive
				SELECT * 
				FROM Customers
				WHERE NOT EXISTS
					(SELECT * FROM Orders
					 WHERE Orders.CustomerID = Customers.CustomerID);

			DELETE Addresses
			WHERE NOT EXISTS
					(SELECT * FROM Orders
					 WHERE Orders.CustomerID = Addresses.CustomerID);

			DELETE Customers
			WHERE NOT EXISTS
					(SELECT * FROM Orders
					 WHERE Orders.CustomerID = Customers.CustomerID);
		COMMIT TRAN;
		PRINT 'SUCCESS: Customers without orders have been deleted.';
	END
ELSE
	PRINT 'ERROR: No customers without orders were found.';
END TRY
BEGIN CATCH
	ROLLBACK TRAN;
	PRINT 'FAILURE: Customers without orders were not deleted.';
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1)
		+ ': ' + ERROR_MESSAGE();
END CATCH;