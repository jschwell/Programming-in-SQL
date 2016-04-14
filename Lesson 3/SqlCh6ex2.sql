SELECT ProductName, ListPrice
FROM Products
WHERE ListPrice > 
	(SELECT AVG(ListPrice)
	 FROM Products)
ORDER BY ListPrice DESC;