SELECT 
	E.EmployeeID,
	E.FirstName,
	IIF(P.StartDate >= '2005-01-01', NULL, P.[Name]) AS [ProjectName]
FROM Employees AS E
	 JOIN EmployeesProjects AS EP ON E.EmployeeID = EP.EmployeeID
	 JOIN Projects AS P ON EP.ProjectID = P.ProjectID
WHERE e.EmployeeID = 24
