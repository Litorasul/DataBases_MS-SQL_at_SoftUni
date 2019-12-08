USE Airport

SELECT P.FirstName AS [First Name], 
		P.LastName AS [Last Name], 
		P.Age AS [Age]
FROM Passengers AS P
LEFT JOIN Tickets AS T
ON T.PassengerId = P.Id
WHERE T.Id IS NULL
ORDER BY [Age] DESC, [First Name], [Last Name]