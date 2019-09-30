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
