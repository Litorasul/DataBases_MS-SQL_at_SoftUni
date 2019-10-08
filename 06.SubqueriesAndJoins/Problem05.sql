SELECT TOP 3
	E.EmployeeID,
	E.FirstName
FROM Employees AS E
	LEFT JOIN EmployeesProjects AS EP ON E.EmployeeID = EP.EmployeeID
	LEFT JOIN Projects AS P ON EP.ProjectID = P.ProjectID
WHERE P.ProjectID IS NULL
ORDER BY E.EmployeeID