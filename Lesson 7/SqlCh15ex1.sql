USE MyGuitarShop;
GO

-- Create stored procedure
CREATE PROC spInsertCategory
	@CategoryName varchar(255)
AS
	INSERT INTO Categories (CategoryName)
	VALUES (@CategoryName);
GO

-- Test procedure
EXEC spInsertCategory 'Microphones';
EXEC spInsertCategory 'Speakers';