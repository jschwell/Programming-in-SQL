SELECT FirstName, LastName, Line1, City, State, ZipCode
FROM Customers JOIN Addresses
	ON Customers.CustomerID = Addresses.CustomerID
WHERE EmailAddress = 'allan.sherwood@yahoo.com';