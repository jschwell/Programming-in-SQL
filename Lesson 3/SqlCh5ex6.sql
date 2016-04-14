SELECT ProductName,
	SUM((ItemPrice - DiscountAmount) * Quantity) AS TotalAmount
FROM Products JOIN OrderItems
	ON Products.ProductID = OrderItems.ProductID
GROUP BY ProductName WITH ROLLUP;