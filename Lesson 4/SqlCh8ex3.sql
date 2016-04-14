SELECT 
	CONVERT(varchar, OrderDate, 101) AS NewDate,
	CONVERT(varchar, OrderDate, 0) AS NewDateAndTime,
	CONVERT(varchar, OrderDate, 8) AS NewTime
FROM Orders;