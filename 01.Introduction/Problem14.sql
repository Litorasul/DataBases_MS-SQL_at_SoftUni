CREATE DATABASE CarRental


CREATE TABLE Categories(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
CategoryName NVARCHAR(50) NOT NULL,
DailyRate DECIMAL(15,2) NOT NULL,
WeeklyRate DECIMAL(15,2) NOT NULL,
MonthlyRate DECIMAL(15,2) NOT NULL,
WeekendRate DECIMAL(15,2) NOT NULL
)

CREATE TABLE Cars(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
PlateNumber NVARCHAR(30) NOT NULL,
Manufacturer NVARCHAR(50) NOT NULL,
Model NVARCHAR(50) NOT NULL,
CarYear INT NOT NULL,
CategoryId INT NOT NULL,
Doors INT,
Picture VARBINARY(MAX),
Condition NVARCHAR(200),
Available BIT NOT NULL
)


ALTER TABLE Cars
ADD CONSTRAINT FK_CategoryId
FOREIGN KEY (CategoryId) REFERENCES Categories(Id)

CREATE TABLE Employees(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
FirstName NVARCHAR(50) NOT NULL,
LastName NVARCHAR(50) NOT NULL,
Title NVARCHAR(50) NOT NULL,
Notes NVARCHAR(200)
)

CREATE TABLE Customers(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
DriverLicenceNumber NVARCHAR(30) NOT NULL,
FullName NVARCHAR(100) NOT NULL,
[Address] NVARCHAR(100),
City NVARCHAR(100),
ZIPCode NVARCHAR(30),
Notes NVARCHAR(200)
)

CREATE TABLE RentalOrders(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
EmployeeId INT NOT NULL, 
CustomerId INT NOT NULL,
CarId INT NOT NULL,
TankLevel INT NOT NULL,
KilometrageStart INT NOT NULL,
KilometrageEnd INT NOT NULL, 
TotalKilometrage AS (KilometrageEnd - KilometrageStart),
StartDate DATE NOT NULL,
EndDate DATE NOT NULL, 
TotalDays AS DATEDIFF(day, StartDate, EndDate),
RateApplied DECIMAL(15,2) NOT NULL,
TaxRate DECIMAL(15, 2) NOT NULL,
OrderStatus NVARCHAR(50) NOT NULL,
Notes NVARCHAR(200)
)

ALTER TABLE RentalOrders
ADD CONSTRAINT FK_EmployeeId
FOREIGN KEY (EmployeeId) REFERENCES Employees(Id)

ALTER TABLE RentalOrders
ADD CONSTRAINT FK_CustomerId
FOREIGN KEY (CustomerId) REFERENCES Customers(Id)

ALTER TABLE RentalOrders
ADD CONSTRAINT FK_CarId
FOREIGN KEY (CarId) REFERENCES Cars(Id)

INSERT INTO Categories(CategoryName, DailyRate, WeeklyRate, MonthlyRate, WeekendRate) VALUES
('Small', 20.5, 140, 470.4, 23),
('Medium', 30.5, 205, 820.4, 33),
('Large', 40.5, 270, 1100.4, 43)

INSERT INTO Cars(PlateNumber, Manufacturer, Model, CarYear, CategoryId, Available) VALUES
('C1234H', 'FORD', 'FIESTA', 2017, 1, 1),
('C3245H', 'VW', 'GOLF', 2016, 2, 1),
('C7849H', 'BMW', '740', 2018, 3, 1)

INSERT INTO Employees(FirstName, LastName, Title) VALUES
('IVAN', 'IVANOV', 'INTERN'),
('PESHO', 'PESHEV', 'SALESMAN'),
('GINKA', 'IVANOVA', 'MENAGER')

INSERT INTO Customers (DriverLicenceNumber, FullName) VALUES
('G58HU9','Gosho Goshev'),
('G58FE3','Misho Mishev'),
('DTAS564W','Stanka Stankova')

INSERT INTO RentalOrders (EmployeeId, CustomerId, CarId, TankLevel, KilometrageStart, KilometrageEnd, StartDate, EndDate, RateApplied, TaxRate, OrderStatus) VALUES
(1, 1, 1, 100, 209, 267, '2019-07-13', '2019-07-23', 140, 20, 'Finished'),
(2, 2, 2, 100, 233, 278, '2019-05-13', '2019-07-23', 820.4, 20, 'Unpaid'),
(3, 3, 3, 100, 123, 240, '2019-09-13', '2019-10-03', 1100.4, 20, 'In Progress')

