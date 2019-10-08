SELECT TOP 5
	E.EmployeeID,
	E.FirstName,
	E.Salary,
	D.[Name] AS [DepartmentName]
FROM Employees AS E
	JOIN Departments AS D ON E.DepartmentID = D.DepartmentID
WHERE e.Salary > 15000
ORDER BY d.DepartmentID