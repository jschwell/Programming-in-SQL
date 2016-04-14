USE MyGuitarShop;
GO

CREATE VIEW CustomerAddresses
AS
SELECT c.CustomerID, c.EmailAddress, c.LastName, c.FirstName, 
	ba.Line1 AS BillLine1, ba.Line2 AS BillLine2, ba.City AS BillCity, ba.State AS BillState, ba.ZipCode AS BillZip, 
	sa.Line1 AS ShipLine1, sa.Line2 AS ShipLine2, sa.City AS ShipCity, sa.State AS ShipState, sa.ZipCode AS ShipZip
FROM Customers as c
	LEFT JOIN Addresses AS sa ON c.CustomerID = sa.CustomerID AND c.ShippingAddressID = sa.AddressID
	LEFT JOIN Addresses AS ba ON c.CustomerID = ba.CustomerID AND c.BillingAddressID = ba.AddressID;