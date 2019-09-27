USE SoftUni

-- Problem 14 --
SELECT FirstName, LastName
	FROM Employees
	WHERE DepartmentID != 4

--Problem 15 --
SELECT * 
	FROM Employees
	ORDER BY Salary DESC, FirstName, LastName DESC, MiddleName

-- Problem 16 --
CREATE VIEW V_EmployeesSalaries AS
	SELECT FirstName, LastName, Salary
	FROM Employees

SELECT * 
	FROM V_EmployeesSalaries

-- Problem 17 --
CREATE VIEW V_EmployeeNameJobTitle AS
	SELECT CONCAT_WS(' ', FirstName, MiddleName, LastName) AS [Full Name], JobTitle
	FROM Employees

SELECT *
	FROM V_EmployeeNameJobTitle

-- Problem 18--
SELECT DISTINCT JobTitle
	FROM Employees

-- Problem 19--
SELECT TOP 10 *
	FROM Projects
	ORDER BY StartDate, [Name]

--Problem 20--
SELECT TOP 7 FirstName, LastName, HireDate
	FROM Employees
	ORDER BY HireDate DESC

--Problem 21--
-- To Do --

-- Problem 22--
USE [Geography]

SELECT PeakName
	FROM Peaks
	ORDER BY PeakName

--Problem 23--
SELECT TOP 30 CountryName, [Population]
	FROM Countries
	WHERE ContinentCode = 'EU'
	ORDER BY [Population] DESC, CountryName

--Problem 24--
SELECT CountryName, CountryCode,
	CASE
		WHEN CurrencyCode != 'EUR' THEN 'NOT EUR'
		ELSE 'EUR'
	END AS Currency
	FROM Countries
	ORDER BY CountryName

--Problem 25--
USE Diablo

SELECT [Name]
	FROM Characters
	ORDER BY [Name]