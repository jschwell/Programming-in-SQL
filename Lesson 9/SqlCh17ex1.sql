USE MyGuitarShop;

DECLARE @CustomerID int;
SET @CustomerID = 8;

BEGIN TRY
IF EXISTS (SELECT * FROM Customers WHERE CustomerID = @CustomerID)
	BEGIN
		BEGIN TRAN;
			DELETE Addresses
			WHERE CustomerID = @CustomerID;

			DELETE Customers
			WHERE CustomerID = @CustomerID;
		COMMIT TRAN;
		PRINT 'SUCCESS: Customer with a CustomerID of ' + CONVERT(varchar, @CustomerID) + ' has been deleted.';
	END;
ELSE
	PRINT 'ERROR: No customer with a CustomerID of ' + CONVERT(varchar, @CustomerID) + ' was found.';
END TRY
BEGIN CATCH
	ROLLBACK TRAN;
	PRINT 'FAILURE: Customer with a CustomerID of ' + CONVERT(varchar, @CustomerID) + ' was not deleted.';
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1)
		+ ': ' + ERROR_MESSAGE();
END CATCH;
