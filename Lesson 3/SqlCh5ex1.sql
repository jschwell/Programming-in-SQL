SELECT COUNT(*) AS NumberOfOrders,
	SUM(TaxAmount) AS TaxAmountTotal
FROM Orders;