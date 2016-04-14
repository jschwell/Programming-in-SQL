USE MyGuitarShop;

DECLARE @LastName varchar(60), @ShipAmountAvg money;

DECLARE Avg_Cursor CURSOR
STATIC
FOR 
	SELECT LastName, AVG(ShipAmount) AS ShipAmountAvg
	FROM Customers JOIN Orders
		ON Customers.CustomerID = Orders.CustomerID
	GROUP BY LastName;
OPEN Avg_Cursor;

IF @@CURSOR_ROWS > 0
	BEGIN
		FETCH NEXT FROM Avg_Cursor INTO @LastName, @ShipAmountAvg;
		WHILE @@FETCH_STATUS = 0
			BEGIN
				PRINT @LastName + ', $' + CONVERT(varchar, @ShipAmountAvg);
				FETCH NEXT FROM Avg_Cursor INTO @LastName, @ShipAmountAvg;
			END;
	END;

CLOSE Avg_Cursor;
DEALLOCATE Avg_Cursor;