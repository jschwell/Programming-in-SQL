USE MyGuitarShop;
GO

-- Create function
CREATE FUNCTION fnItemTotal(@ItemID int)
	RETURNS money
BEGIN
	RETURN (SELECT (dbo.fnDiscountPrice(@ItemID) * Quantity)
			FROM OrderItems
			WHERE ItemID = @ItemID);
END;
GO

-- Query using functions
SELECT ItemID, ItemPrice, DiscountAmount, dbo.fnDiscountPrice(ItemID) AS DiscountPrice,
	Quantity, dbo.fnItemTotal(ItemID) AS ItemTotal
FROM OrderItems;