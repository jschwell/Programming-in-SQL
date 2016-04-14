SELECT ListPrice, DiscountPercent,
	ROUND((ListPrice - ListPrice * DiscountPercent / 100), 2) AS DiscountAmount
FROM Products;