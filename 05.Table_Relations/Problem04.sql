CREATE TABLE Teachers(
TeacherID INT NOT NULL IDENTITY(101, 1) PRIMARY KEY,
[Name] NVARCHAR(50) NOT NULL,
ManagerID INT 
)


ALTER TABLE Teachers
ADD CONSTRAINT FK_ManagerID
FOREIGN KEY (ManagerID) REFERENCES Teachers(TeacherID)

INSERT INTO Teachers([Name], ManagerID) VALUES
('John', NULL),
('Maya', 106),
('Silvia', 106),
('Ted', 105),
('Mark', 101),
('Greta', 101)

