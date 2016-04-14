SELECT CategoryName, ProductName, ListPrice
FROM Categories JOIN Products
	ON Categories.CategoryID = Products.CategoryID
ORDER BY CategoryName, ProductName;