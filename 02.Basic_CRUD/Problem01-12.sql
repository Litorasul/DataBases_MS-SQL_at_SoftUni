USE SoftUni

SELECT * 
	FROM Departments

SELECT [Name] 
	FROM Departments

SELECT FirstName, LastName, Salary 
	FROM Employees


SELECT FirstName, MiddleName, LastName 
	FROM Employees


SELECT FirstName + '.' + LastName + '@softuni.bg' 
	AS [Full Email Address] 
	FROM Employees 


SELECT DISTINCT Salary 
	FROM Employees

SELECT * 
	FROM Employees
	WHERE JobTitle = 'Sales Representative' 

SELECT CONCAT(FirstName, ' ', MiddleName, ' ', LastName) 
	AS [Full Name]
	FROM Employees
	WHERE Salary IN (25000, 14000, 12500, 23600)


SELECT FirstName, LastName
	FROM Employees
	WHERE ManagerID IS NULL


SELECT FirstName, LastName, Salary
	FROM Employees
	WHERE Salary > 50000
	ORDER BY Salary DESC