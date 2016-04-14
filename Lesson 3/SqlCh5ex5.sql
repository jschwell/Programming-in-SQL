SELECT EmailAddress,
	COUNT(*) AS NumberOfOrders,
	SUM((ItemPrice - DiscountAmount) * Quantity) AS TotalAmount
FROM Customers 
	JOIN Orders	ON Customers.CustomerID = Orders.CustomerID
	JOIN OrderItems ON Orders.OrderID = OrderItems.OrderID
WHERE ItemPrice > 400
GROUP BY EmailAddress
HAVING COUNT(*) > 1
ORDER BY SUM(ItemPrice) DESC;