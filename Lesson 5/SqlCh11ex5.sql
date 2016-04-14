USE MyWebDB;
GO

ALTER TABLE Users
ALTER COLUMN FirstName VARCHAR(20) NOT NULL;

UPDATE Users
SET FirstName = NULL
WHERE UserID = 1;

UPDATE Users
SET FirstName = 'Christopher Christopher'
WHERE UserID = 1;