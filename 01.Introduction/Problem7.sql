CREATE TABLE People(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY, 
[Name] NVARCHAR(200) NOT NULL,
Picture VARBINARY(MAX),
Height DECIMAL(3, 2),
[Weight] DECIMAL(5, 2),
Gender VARCHAR(2) NOT NULL,
Birthdate DATE NOT NULL,
Biography NVARCHAR(MAX)
)

ALTER TABLE People
ADD CONSTRAINT CHK_T_Picture__2MB 
CHECK (DATALENGTH(Picture) <= 2097152)  

ALTER TABLE People
ADD CONSTRAINT G_OnlyMF
CHECK (Gender IN ('M', 'F'))

INSERT INTO People([Name], Picture, Height, [Weight], Gender, Birthdate, Biography) VALUES
('Pesho', NULL, 1.834, 88.33, 'M', '1982-03-09', NULL),
('Gosho', NULL, 1.67, 65.73, 'M', '1992-11-09', NULL),
('Maria', NULL, 1.73, 78.34, 'F', '1986-07-12', NULL),
('Ana', NULL, 1.534, 120.30, 'F', '1981-05-16', NULL),
('Dido', NULL, 1.77, 66.35, 'M', '1990-09-05', NULL)

