USE MyGuitarShop;
GO

CREATE VIEW OrderItemProducts
AS
SELECT o.OrderID, o.OrderDate, o.TaxAmount, o.ShipDate,
	oi.ItemPrice, oi.DiscountAmount, oi.ItemPrice - oi.DiscountAmount AS FinalPrice,
	oi.Quantity, (oi.ItemPrice - oi.DiscountAmount) * oi.Quantity AS ItemTotal, p.ProductName
FROM Orders AS o 
	JOIN OrderItems AS oi ON o.OrderID = oi.OrderID
	JOIN Products AS p ON oi.ProductID = p.ProductID;