USE MyGuitarShop;

BEGIN TRY
	INSERT INTO Categories (CategoryName)
	VALUES ('Guitars');

	PRINT 'SUCCESS: Record was inserted.';
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not inserted.';
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1)
		+ ': ' + ERROR_MESSAGE();
END CATCH;