SELECT DISTINCT Products1.ProductName, Products1.ListPrice
FROM Products AS Products1 JOIN Products AS Products2
	ON (Products1.ListPrice = Products2.ListPrice) AND
	   (Products1.ProductID <> Products2.ProductID)
ORDER BY Products1.ProductName;