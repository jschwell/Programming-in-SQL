USE master;
GO

IF DB_ID('MyWebDB') IS NOT NULL
	DROP DATABASE MyWebDB;
GO

CREATE DATABASE MyWebDB;
GO

USE MyWebDB;

CREATE TABLE Users
(
    UserID			INT				PRIMARY KEY		IDENTITY,
    EmailAddress	VARCHAR(255)	NOT NULL,
	FirstName		VARCHAR(50)		NULL,
	LastName		VARCHAR(50)		NULL
);

CREATE TABLE Products
(
	ProductID		INT				PRIMARY KEY		IDENTITY,
	ProductName		VARCHAR(50)		NOT NULL
);

CREATE TABLE Downloads
(
	DownloadID		INT				PRIMARY KEY		IDENTITY,
	UserID			INT				REFERENCES Users (UserID),
	DownloadDate	DATETIME2(0)	NOT NULL,
	FileName		VARCHAR(100)	NOT NULL,
	ProductID		INT				REFERENCES Products (ProductID)
);

CREATE INDEX IX_Downloads_UserID
	ON Downloads (UserID);

CREATE INDEX IX_Downloads_ProductID
	ON Downloads (ProductID);