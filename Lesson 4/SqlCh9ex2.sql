SELECT OrderDate,
	YEAR(OrderDate) AS OrderDateYear,
	DAY(OrderDate) AS OrderDateDay,
	DATEADD(day, 30, OrderDate) AS OrderDateAdd30
FROM Orders;