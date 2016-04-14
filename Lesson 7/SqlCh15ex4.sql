USE MyGuitarShop;
GO

-- Create stored procedure
CREATE PROC spInsertProduct
	@CategoryID int,
	@ProductCode varchar(10),
	@ProductName varchar(255),
	@ListPrice money,
	@DiscountPercent money
AS
	IF @ListPrice < 0
		THROW 50001, 'ListPrice does not accept negative numbers.', 1;
	IF @DiscountPercent < 0
		THROW 50002, 'DiscountPercent does not accept negative numbers.', 1;

	INSERT INTO Products (CategoryID, ProductCode, ProductName, Description,
		ListPrice, DiscountPercent, DateAdded)
	VALUES (@CategoryID, @ProductCode, @ProductName, '', @ListPrice, 
		@DiscountPercent, GETDATE());
GO

-- Test procedure

-- Success test
BEGIN TRY
	EXEC spInsertProduct 2, 'sr250', 'Ibanez SR250 Electric Bass', 299.99, 10.00;
	PRINT 'SUCCESS: Record was inserted.';
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not inserted.';
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1)
		+ ': ' + ERROR_MESSAGE();
END CATCH

-- Fail test (negative list price)
BEGIN TRY
	EXEC spInsertProduct 3, 'td25kv', 'TD-25KV V-Tour Drum Kit', -2499.00, 20.00;
	PRINT 'SUCCESS: Record was inserted.';
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not inserted.';
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1)
		+ ': ' + ERROR_MESSAGE();
END CATCH

-- Fail test (negative discount percent)
BEGIN TRY
	EXEC spInsertProduct 3, 'td25kv', 'TD-25KV V-Tour Drum Kit', 2499.00, -20.00;
	PRINT 'SUCCESS: Record was inserted.';
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not inserted.';
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1)
		+ ': ' + ERROR_MESSAGE();
END CATCH