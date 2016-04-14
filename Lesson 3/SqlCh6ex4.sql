SELECT EmailAddress, MAX(OrderTotal) AS LargestOrder
FROM 
	(SELECT EmailAddress, OrderItems.OrderID, 
		SUM(ItemPrice * Quantity) AS OrderTotal
	 FROM Customers
		JOIN Orders ON Customers.CustomerID = Orders.CustomerID
		JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
	 GROUP BY EmailAddress, OrderItems.OrderID) AS OrderTotals
GROUP BY EmailAddress;