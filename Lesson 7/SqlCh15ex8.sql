USE MyGuitarShop;

-- Create table
CREATE TABLE ProductsAudit
(
    AuditID				INT				PRIMARY KEY		IDENTITY,
    ProductID			INT				NOT NULL,
	CategoryID			INT				NULL,
	ProductCode			varchar(10)		NOT NULL,
	ProductName			varchar(255)	NOT NULL,
	ListPrice			money			NOT NULL,
	DiscountPercent		money			NOT NULL,
	DateUpdated			datetime		NULL
);
GO

-- Drop previous update trigger
IF OBJECT_ID('Products_UPDATE') IS NOT NULL
	DROP TRIGGER Products_UPDATE;
GO

-- Create trigger
CREATE TRIGGER Products_UPDATE
	ON Products
	AFTER UPDATE
AS
	DECLARE @ProductID int,
			@CategoryID int,
			@ProductCode varchar(10),
			@ProductName varchar(255),
			@ListPrice money,
			@DiscountPercent money;

	SELECT @ProductID = ProductID, @CategoryID = CategoryID, 
		@ProductCode = ProductCode, @ProductName = ProductName, 
		@ListPrice = ListPrice, @DiscountPercent = DiscountPercent
	FROM Deleted;

	INSERT INTO ProductsAudit (ProductID, CategoryID, ProductCode, 
		ProductName, ListPrice, DiscountPercent, DateUpdated)
	VALUES (@ProductID, @CategoryID, @ProductCode, @ProductName, 
		@ListPrice,	@DiscountPercent, GETDATE());
GO

-- Test trigger
UPDATE Products
SET ListPrice = 599.99
WHERE ProductID = 1;
