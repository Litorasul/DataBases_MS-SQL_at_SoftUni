CREATE DATABASE Hotel

CREATE TABLE Employees(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
FirstName NVARCHAR(30) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Title NVARCHAR(50) NOT NULL,
Notes NVARCHAR(200)
)

CREATE TABLE Customers(
AccountNumber INT NOT NULL,
FirstName NVARCHAR(30) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
PhoneNumber INT NOT NULL,
EmergencyName NVARCHAR(50) NOT NULL,
EmergencyNumber INT NOT NULL,
Notes NVARCHAR(200)
)


ALTER TABLE Customers
ADD PRIMARY KEY (AccountNumber);

CREATE TABLE RoomStatus(
RoomStatus NVARCHAR(50) NOT NULL,
Notes NVARCHAR(200)
)

CREATE TABLE RoomTypes(
RoomType NVARCHAR(50) NOT NULL,
Notes NVARCHAR(200)
)

CREATE TABLE BedTypes(
BedType NVARCHAR(50) NOT NULL,
Notes NVARCHAR(200)
)

CREATE TABLE Rooms(
RoomNumber INT NOT NULL,
RoomType NVARCHAR(50) NOT NULL,
BedType NVARCHAR(50) NOT NULL,
Rate DECIMAL(15, 2) NOT NULL,
RoomStatus NVARCHAR(50) NOT NULL,
Notes NVARCHAR(200)
)

ALTER TABLE Rooms
ADD PRIMARY KEY (RoomNumber);

ALTER TABLE RoomStatus
ADD PRIMARY KEY (RoomStatus);

ALTER TABLE RoomTypes
ADD PRIMARY KEY (RoomType);

ALTER TABLE BedTypes
ADD PRIMARY KEY (BedType);

ALTER TABLE Rooms
ADD CONSTRAINT FK_RoomType
FOREIGN KEY (RoomType) REFERENCES RoomTypes(RoomType)

ALTER TABLE Rooms
ADD CONSTRAINT FK_BedType
FOREIGN KEY (BedType) REFERENCES BedTypes(BedType)

ALTER TABLE Rooms
ADD CONSTRAINT FK_RoomStatus
FOREIGN KEY (RoomStatus) REFERENCES RoomStatus(RoomStatus)

CREATE TABLE Payments(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
EmployeeId INT NOT NULL,
PaymentDate DATE NOT NULL,
AccountNumber INT NOT NULL,
FirstDateOccupied DATE NOT NULL,
LastDateOccupied DATE NOT NULL,
TotalDays  AS DATEDIFF(day, FirstDateOccupied, LastDateOccupied),
AmountCharged DECIMAL(15, 2) NOT NULL,
TaxRate DECIMAL(15, 2) NOT NULL,
TaxAmount DECIMAL(15, 2) NOT NULL,
PaymentTotal DECIMAL(15, 2) NOT NULL,
Notes NVARCHAR(200)
)

ALTER TABLE Payments
ADD CONSTRAINT FK_EmployeeId
FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)

ALTER TABLE Payments
ADD CONSTRAINT FK_AccountNumber
FOREIGN KEY (AccountNumber) REFERENCES Customers(AccountNumber)

CREATE TABLE Occupancies(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
EmployeeId INT NOT NULL,
DateOccupied DATE NOT NULL,
AccountNumber INT NOT NULL,
RoomNumber INT NOT NULL,
RateApplied DECIMAL(15, 2) NOT NULL,
PhoneCharge DECIMAL(15, 2),
Notes NVARCHAR(200)
)

ALTER TABLE Occupancies
ADD CONSTRAINT FK_EmployeeId2
FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)

ALTER TABLE Occupancies
ADD CONSTRAINT FK_AccountNumber2
FOREIGN KEY (AccountNumber) REFERENCES Customers(AccountNumber)

ALTER TABLE Occupancies
ADD CONSTRAINT FK_RoomNumber
FOREIGN KEY (RoomNumber) REFERENCES Rooms(RoomNumber)

INSERT INTO Employees(FirstName, LastName, Title) VALUES
('IVAN', 'IVANOV', 'INTERN'),
('PESHO', 'PESHEV', 'SALESMAN'),
('GINKA', 'IVANOVA', 'MENAGER')

INSERT INTO Customers (AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber) VALUES
(123, 'IVAN', 'IVANOV', 555, 'GANCHO', 111),
(234, 'PESHO', 'PESHEV', 666, 'STANKA', 222),
(345, 'GINKA', 'IVANOVA', 777, 'TONCHO', 333)

INSERT INTO RoomStatus (RoomStatus, Notes) VALUES
('FREE', 'JSALD'),
('BOOKED', 'UEYRIW'),
('OCCUPIED', 'UWYEA')

INSERT INTO RoomTypes (RoomType, Notes) VALUES
('SMALL', 'JSALD'),
('MEDIUM', 'UEYRIW'),
('BIG', 'UWYEA')

INSERT INTO BedTypes (BedType, Notes) VALUES
('SINGLE', 'JSALD'),
('DOUBLE', 'UEYRIW'),
('KING SIZE', 'UWYEA')

INSERT INTO Rooms (RoomNumber, RoomType, BedType, Rate, RoomStatus) VALUES
(1, 'SMALL', 'SINGLE', 2.54, 'FREE'),
(2, 'MEDIUM', 'DOUBLE', 5.67, 'OCCUPIED'),
(3, 'BIG', 'KING SIZE', 12.32, 'BOOKED')

INSERT INTO Payments (EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied, LastDateOccupied, AmountCharged, TaxRate, TaxAmount, PaymentTotal) VALUES
(1, '2019-03-20', 123, '2019-03-13', '2019-03-20', 7, 2.44, 5.66, 20),
(2, '2019-03-23', 234, '2019-03-13', '2019-03-23', 7, 2.44, 5.66, 20),
(3, '2019-04-09', 345, '2019-03-13', '2019-04-09', 7, 2.44, 5.66, 20)

INSERT INTO Occupancies ( EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied) VALUES
(1, '2019-03-20', 123, 1, 2.54),
(2, '2019-03-23', 234, 2, 5.67),
(3, '2019-04-09', 345, 3, 12.32)

