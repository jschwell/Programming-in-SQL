USE MyGuitarShop;

DECLARE @OrderID int;
BEGIN TRY
	BEGIN TRAN;
		INSERT Orders
			VALUES (3, GETDATE(), '10.00', '0.00', NULL, 4, 'American Express', '378282246310005', '04/2013', 4);
		SET @OrderID = @@IDENTITY;
		INSERT OrderItems VALUES (@OrderID, 6, '415.00', '161.85', 1);
		INSERT OrderItems VALUES (@OrderID, 1, '699.00', '209.70', 1 )
	COMMIT TRAN;
	PRINT 'SUCCESS: Order has been added.';
END TRY
BEGIN CATCH
	ROLLBACK TRAN;
	PRINT 'FAILURE: Order was not added.';
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1)
		+ ': ' + ERROR_MESSAGE();
END CATCH;