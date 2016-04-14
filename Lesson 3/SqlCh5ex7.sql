SELECT EmailAddress,
	COUNT(DISTINCT ProductID) AS TotalProducts
FROM Customers 
	JOIN Orders ON Customers.CustomerID = Orders.CustomerID
	JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
GROUP BY EmailAddress
HAVING COUNT(DISTINCT ProductID) > 1;