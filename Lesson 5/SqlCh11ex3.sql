USE MyWebDB;
GO

INSERT INTO Users
	(EmailAddress, FirstName, LastName)
VALUES 
	('johnsmith@gmail.com', 'John', 'Smith'),
	('janedoe@yahoo.com', 'Jane', 'Doe');

INSERT INTO Products
	(ProductName)
VALUES 
	('Local Music Vol 1'),
	('Local Music Vol 2');

INSERT INTO Downloads
	(UserID, DownloadDate, FileName, ProductID)
VALUES 
	(1, GETDATE(), 'pedals_are_falling.mp3', 1),
	(2, GETDATE(), 'turn_signal.mp3', 1),
	(2, GETDATE(), 'one_horse_town.mp3', 2);

SELECT EmailAddress, FirstName, LastName, DownloadDate, FileName, ProductName
FROM Users 
	JOIN Downloads ON Users.UserID = Downloads.UserID
	JOIN Products ON Downloads.ProductID = Products.ProductID
ORDER BY EmailAddress DESC, ProductName;