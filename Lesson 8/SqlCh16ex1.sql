USE MyGuitarShop;

DECLARE @ProductName varchar(255), @ListPrice money;

DECLARE Products_Cursor CURSOR
STATIC
FOR
	SELECT ProductName, ListPrice
	FROM Products
	WHERE ListPrice > 700
	ORDER BY ListPrice DESC;
OPEN Products_Cursor;

IF @@CURSOR_ROWS > 0
	BEGIN
		FETCH NEXT FROM Products_Cursor INTO @ProductName, @ListPrice;
		WHILE @@FETCH_STATUS = 0
			BEGIN
				PRINT @ProductName + ', $' + CONVERT(varchar, @ListPrice);
				FETCH NEXT FROM Products_Cursor INTO @ProductName, @ListPrice;
			END;
	END;

CLOSE Products_Cursor;
DEALLOCATE Products_Cursor;

