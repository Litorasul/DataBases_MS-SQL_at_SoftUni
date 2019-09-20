CREATE DATABASE Movies

CREATE TABLE Directors(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
DirectorName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(200)
)

CREATE TABLE Genres(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
GenreName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(200)
)

CREATE TABLE Categories(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
CategoryName NVARCHAR(50) NOT NULL,
Notes NVARCHAR(200)
)

CREATE TABLE Movies(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
Title NVARCHAR(200) NOT NULL,
DirectorId INT NOT NULL, 
CopyrightYear INT,
[Length] INT,
GenreId INT NOT NULL,
CategoryId INT NOT NULL,
Rating INT,
Notes NVARCHAR(200)
)

ALTER TABLE Movies
ADD CONSTRAINT FK_DirectorId
FOREIGN KEY (DirectorId) REFERENCES Directors(Id)

ALTER TABLE Movies
ADD CONSTRAINT FK_GenreId
FOREIGN KEY (GenreId) REFERENCES Genres(Id)

ALTER TABLE Movies
ADD CONSTRAINT FK_CategoryId
FOREIGN KEY (CategoryId) REFERENCES Categories(Id)

INSERT INTO Directors(DirectorName, Notes) VALUES
('Scorsesse', NULL),
('Tarantino', 'Not so much'),
('Godart', 'French new wave'),
('Wright', NULL),
('Nolan', 'I am Batman')

INSERT INTO Genres(GenreName, Notes) VALUES
('Crime', NULL),
('Post Modern', 'Blood'),
('French new wave', 'French'),
('Zombie comedy', 'British'),
('Blockbuster', NULL)

INSERT INTO Categories(CategoryName, Notes) VALUES
('Motion Picture', NULL),
('Bloody', '90s'),
('Wierd', 'French new wave'),
('Funny', NULL),
('Existential', 'Not Batman')

INSERT INTO Movies(Title, DirectorId, CopyrightYear, GenreId, CategoryId) VALUES
('Goodfellas', 1, 1990, 1, 1),
('Reservoir Dogs', 2, 1992, 2, 2),
('Breathless', 3, 1960, 3, 3),
('Shaun of the Dead', 4, 2004, 4, 4),
('Inception', 5, 2010, 5, 5)
