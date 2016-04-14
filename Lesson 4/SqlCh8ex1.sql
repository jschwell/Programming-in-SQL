SELECT ListPrice, 
	CAST(ListPrice AS decimal(19,1)) AS ListPriceDecimal,
	CONVERT(int, ListPrice) AS ListPriceConvertInt,
	CAST(ListPrice AS int) AS ListPriceCastInt
FROM Products;