SELECT
	E.FirstName,
	E.LastName,
	E.HireDate,
	D.[Name] AS [DeptName]
FROM Employees AS E
	JOIN Departments AS D ON E.DepartmentID = D.DepartmentID
WHERE e.HireDate > '1999-01-01'
	AND D.[Name] = 'Sales'
	OR D.[Name] = 'Finance'
ORDER BY e.HireDate