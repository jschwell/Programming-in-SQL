USE MyGuitarShop;
GO

-- Create stored procedure
CREATE PROC spUpdateProductDiscount
	@ProductID int,
	@DiscountPercent money
AS
	IF @DiscountPercent < 0
		THROW 50001, 'DiscountPercent must be a positive number.', 1;

	UPDATE Products
	SET DiscountPercent = @DiscountPercent
	WHERE ProductID = @ProductID;
GO

-- Test procedure

-- Success test
BEGIN TRY
	EXEC spUpdateProductDiscount 2, 20.00;
	PRINT 'SUCCESS: Record was updated.';
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not updated.';
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1)
		+ ': ' + ERROR_MESSAGE();
END CATCH

-- Fail test (negative discount percent)
BEGIN TRY
	EXEC spUpdateProductDiscount 5, -10.00;
	PRINT 'SUCCESS: Record was updated.';
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not updated.';
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1)
		+ ': ' + ERROR_MESSAGE();
END CATCH