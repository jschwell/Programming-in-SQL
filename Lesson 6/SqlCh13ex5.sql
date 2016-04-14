USE MyGuitarShop;
GO

CREATE VIEW ProductSummary
AS
SELECT ProductName, COUNT(*) AS OrderCount, SUM(ItemTotal) AS OrderTotal
FROM OrderItemProducts
GROUP BY ProductName;