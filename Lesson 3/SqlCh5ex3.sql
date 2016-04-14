SELECT EmailAddress,
	SUM(ItemPrice * Quantity) AS TotalItemPrice,
	SUM(DiscountAmount * Quantity) AS TotalDiscount
FROM Customers 
	JOIN Orders	ON Customers.CustomerID = Orders.CustomerID
	JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
GROUP BY EmailAddress
ORDER BY TotalItemPrice DESC;