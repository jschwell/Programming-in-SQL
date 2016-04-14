SELECT EmailAddress, OrderID, OrderDate
FROM Customers JOIN Orders AS o1
	ON Customers.CustomerID = o1.CustomerID
WHERE OrderDate = 
	(SELECT MIN(OrderDate)
	 FROM Orders AS o2
	 WHERE o2.CustomerID = Customers.CustomerID)