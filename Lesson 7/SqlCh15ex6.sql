USE MyGuitarShop;
GO

-- Create trigger
CREATE TRIGGER Products_UPDATE
	ON Products
	AFTER UPDATE
AS
	IF EXISTS (SELECT *
				FROM deleted JOIN Products
					ON deleted.ProductID = Products.ProductID
				WHERE deleted.DiscountPercent <> Products.DiscountPercent)
		BEGIN
			DECLARE @DiscountPercent money;
	
			SELECT @DiscountPercent = DiscountPercent
			FROM Inserted;

			IF (@DiscountPercent >= 0 AND @DiscountPercent <= 100)
				BEGIN
					IF (@DiscountPercent > 0 AND @DiscountPercent < 1)
						BEGIN
							UPDATE Products
							SET DiscountPercent = DiscountPercent * 100
							WHERE ProductID IN (SELECT ProductID FROM Inserted);
						END;
				END;
			ELSE
				BEGIN
					;
					THROW 50001, 'DiscountPercent must be between 0 and 100.', 1;
					ROLLBACK TRAN;
				END;			
		END;
GO

-- Test trigger

-- Success test
BEGIN TRY
	UPDATE Products
	SET DiscountPercent = 0.1
	WHERE ProductID = 2;
	PRINT 'SUCCESS: Record was updated.';
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not updated.';
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1)
		+ ': ' + ERROR_MESSAGE();
END CATCH

-- Fail test
BEGIN TRY
	UPDATE Products
	SET DiscountPercent = -1
	WHERE ProductID = 1;
	PRINT 'SUCCESS: Record was updated.';
END TRY
BEGIN CATCH
	PRINT 'FAILURE: Record was not updated.';
	PRINT 'Error ' + CONVERT(varchar, ERROR_NUMBER(), 1)
		+ ': ' + ERROR_MESSAGE();
END CATCH

