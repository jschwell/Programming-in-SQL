SELECT OrderID, OrderDate,
	DATEADD(day, 2, OrderDate) AS ApproxShipDate,
	ShipDate,
	DATEDIFF(day, OrderDate, ShipDate) AS DaysToShip
FROM Orders
WHERE MONTH(OrderDate) = 3 AND
	YEAR(OrderDate) = 2012;