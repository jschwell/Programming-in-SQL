SELECT LastName, FirstName, OrderDate, ProductName, ItemPrice, DiscountAmount, Quantity
FROM Customers AS c 
	JOIN Orders AS o ON c.CustomerID = o.CustomerID
	JOIN OrderItems AS oi ON o.OrderID = oi.OrderID
	JOIN Products AS p ON p.ProductID = oi.ProductID
ORDER BY LastName, OrderDate, ProductName;