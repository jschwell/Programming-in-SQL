USE MyGuitarShop;
GO

-- Create function
CREATE FUNCTION fnDiscountPrice(@ItemID int)
	RETURNS money
BEGIN
	RETURN (SELECT (ItemPrice - DiscountAmount)
			FROM OrderItems
			WHERE ItemID = @ItemID);
END;
GO

-- Query using function
SELECT ItemID, ItemPrice, DiscountAmount, 
	dbo.fnDiscountPrice(ItemID) AS DiscountPrice
FROM OrderItems;