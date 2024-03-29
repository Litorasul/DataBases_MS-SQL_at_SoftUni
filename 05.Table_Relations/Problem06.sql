CREATE DATABASE University

USE University

CREATE TABLE Majors(
MajorID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
[Name] NVARCHAR(50) NOT NULL
)

CREATE TABLE Students(
StudentID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
StudentNumber INT NOT NULL,
StudentName NVARCHAR(50) NOT NULL,
MajorID INT FOREIGN KEY REFERENCES Majors(MajorID)
)

CREATE TABLE Payments(
PaymentID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
PaymentDate DATE NOT NULL,
PaymentAmount DECIMAL(18, 2) NOT NULL,
StudentID INT FOREIGN KEY REFERENCES Students(StudentID)
)

CREATE TABLE Subjects(
SubjectID INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
SubjectName NVARCHAR(50) NOT NULL,
)

CREATE TABLE Agenda(
StudentID INT FOREIGN KEY REFERENCES Students(StudentID),
SubjectID INT FOREIGN KEY REFERENCES Subjects(SubjectID),
CONSTRAINT PK_Agenda PRIMARY KEY(StudentID, SubjectID)
)