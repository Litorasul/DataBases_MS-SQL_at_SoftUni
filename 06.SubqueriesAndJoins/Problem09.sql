SELECT 
	e.EmployeeID,
	e.FirstName, 
	e.ManagerID,
	em.FirstName AS [ManagerName]
FROM Employees AS e
	JOIN Employees AS EM ON E.ManagerID = EM.EmployeeID
WHERE E.ManagerID = 3 OR E.ManagerID = 7
ORDER BY E.EmployeeID