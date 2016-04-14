SELECT DateAdded,
	CAST(DateAdded AS date) AS DateOnly,
	CAST(DateAdded AS time) AS TimeOnly,
	CAST(DateAdded AS varchar(6)) AS TextDate
FROM Products;