USE MyGuitarShop;

DECLARE @Number1 int;
DECLARE @Number2 int;
DECLARE @Count int;
DECLARE @Message varchar(100);

SET @Number1 = 10;
SET @Number2 = 20;
SET @Count = 1;
SET @Message = 'Common factors of ' + CONVERT(varchar, @Number1)
	+ ' and ' + CONVERT(varchar, @Number2);

PRINT @Message;

WHILE @Count <= @Number1 AND @Count <= @Number2
	BEGIN
		IF @Number1 % @Count = 0 AND @Number2 % @Count = 0
			PRINT @Count;
		SET @Count = @Count + 1;
	END;
