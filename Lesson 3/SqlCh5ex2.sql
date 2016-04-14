SELECT CategoryName,
	COUNT(*) AS TotalProducts,
	MAX(ListPrice) AS MostExpensive
FROM Categories JOIN Products
	ON Categories.CategoryID = Products.CategoryID
GROUP BY CategoryName
ORDER BY TotalProducts DESC;