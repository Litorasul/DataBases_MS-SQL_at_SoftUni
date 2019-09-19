CREATE TABLE Users(
Id INT NOT NULL IDENTITY(1, 1) PRIMARY KEY,
Username VARCHAR(30) UNIQUE NOT NULL,
[Password] VARCHAR(26) NOT NULL, 
ProfilePicture VARBINARY(MAX),
LastLoginTime DATETIME DEFAULT GETDATE(),
IsDeleted BIT
)

ALTER TABLE Users
ADD CONSTRAINT CHK_T_Picture__900kB 
CHECK (DATALENGTH(ProfilePicture) <= 900000)  

INSERT INTO Users(Username, [Password], ProfilePicture, IsDeleted) VALUES
('Pesho', 'go94', NULL, 'false'),
('Gosho', 'gd24', NULL, 'false'),
('Ivan', 'deq4', NULL, 'false'),
('Varna', 'hol3wspfhr7', NULL, 'false'),
('Dani', 'kljfdklj8', NULL, 'false')


