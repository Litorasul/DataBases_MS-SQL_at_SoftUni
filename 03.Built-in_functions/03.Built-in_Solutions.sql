USE SoftUni

--Problem 01--
SELECT 
	FirstName,
	LastName
FROM Employees
WHERE FirstName LIKE 'Sa%'

--Problem 02--
SELECT 
	FirstName,
	LastName
FROM Employees
WHERE LastName LIKE '%ei%'

--Problem 03--
SELECT 
	FirstName
FROM Employees
WHERE DepartmentID = 3 OR DepartmentID = 10
AND HireDate BETWEEN '1995-01-01' AND '2005-12-31'

--Problem 04--
SELECT 
	FirstName,
	LastName
FROM Employees
WHERE JobTitle NOT LIKE '%engineer%'

--Problem 05--
SELECT
	[Name]
FROM Towns
WHERE LEN([Name]) BETWEEN 5 AND 6
ORDER BY [Name]

--Problem 06--
SELECT
	*
FROM Towns
WHERE [Name] LIKE '[MKBE]%'
ORDER BY [Name]

--Problem 07--
SELECT
	*
FROM Towns
WHERE [Name] NOT LIKE '[RBD]%'
ORDER BY [Name]

--Problem 08--
CREATE VIEW V_EmployeesHiredAfter2000 AS
SELECT 
	FirstName,
	LastName
FROM Employees
WHERE DATEPART(YEAR,HireDate) > 2000

SELECT 
	*
FROM V_EmployeesHiredAfter2000

--Problem 09--
SELECT 
	FirstName,
	LastName
FROM Employees
WHERE LEN(LastName) = 5

--Problem 10--
SELECT
	EmployeeID,
	FirstName,
	LastName,
	Salary,
DENSE_RANK() OVER(PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
FROM Employees
WHERE Salary BETWEEN 10000 AND 50000
ORDER BY Salary DESC

--Problem 11--
SELECT
	*
FROM (SELECT
	EmployeeID,
	FirstName,
	LastName,
	Salary,
DENSE_RANK() OVER(PARTITION BY Salary ORDER BY EmployeeID) AS [Rank]
FROM Employees
WHERE Salary BETWEEN 10000 AND 50000) AS Temp
WHERE Temp.[Rank] = 2
ORDER BY Salary DESC

--Problem 12--
USE [Geography]

SELECT
	CountryName,
	IsoCode
FROM Countries
WHERE CountryName LIKE '%A%A%A%'
ORDER BY IsoCode

--Problem 13--
SELECT
	p.PeakName,
	r.RiverName,
	LOWER(CONCAT(LEFT(p.PeakName, LEN(p.PeakName) - 1), r.RiverName)) AS Mix
FROM Peaks AS p, Rivers AS r
WHERE RIGHT(p.PeakName, 1) = LEFT(r.RiverName, 1)
ORDER BY Mix

--Problem 14--
USE Diablo

SELECT TOP 50
	[Name],
	FORMAT(Start, 'yyyy-MM-dd') AS [Start]
FROM Games
WHERE DATEPART(YEAR, Start) BETWEEN '2011' AND '2012'
ORDER BY [Start]

--Problem 15--
SELECT
	Username,
	RIGHT(Email, LEN(Email) - CHARINDEX('@', email)) AS [Email Provider]
FROM Users
ORDER BY [Email Provider], Username