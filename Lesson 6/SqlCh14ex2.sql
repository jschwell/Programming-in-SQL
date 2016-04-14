USE MyGuitarShop;

DECLARE @ProductCount int;
DECLARE @AveragePrice money;

SELECT @ProductCount = COUNT(*), @AveragePrice = AVG(ListPrice)
FROM Products;

IF @ProductCount >= 7
	BEGIN
		PRINT 'Product Count = ' + CONVERT(varchar, @ProductCount);
		PRINT 'Average List Price = $' + CONVERT(varchar, @AveragePrice, 1);
	END;
ELSE
	PRINT 'The number of products is less than 7.';
