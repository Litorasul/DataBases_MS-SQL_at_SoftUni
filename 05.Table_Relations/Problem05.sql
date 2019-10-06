CREATE DATABASE OnlineStore

USE OnlineStore

CREATE TABLE Cities(
CityID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE Customers(
CustomerID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
[Name] NVARCHAR(50) NOT NULL,
Birthday DATE,
CityID INT NOT NULL
)


ALTER TABLE Customers
ADD CONSTRAINT FK_CityID
FOREIGN KEY (CityID) REFERENCES Cities(CityID)

CREATE TABLE Orders(
OrderID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID)
)

CREATE TABLE ItemTypes(
ItemTypeID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE Items(
ItemID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
[Name] NVARCHAR(50) NOT NULL,
ItemTypeID INT FOREIGN KEY REFERENCES ItemTypes(ItemTypeID)
)

CREATE TABLE OrderItems(
OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
ItemID INT FOREIGN KEY REFERENCES Items(ItemID)
CONSTRAINT PK_OrderItems PRIMARY KEY(OrderID, ItemID)
)

