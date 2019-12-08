USE Airport

SELECT 
	P.[Name] AS [Name],
	P.Seats AS [Seats],
	COUNT(T.Id) AS [Passengers Count]
FROM Planes AS P
LEFT JOIN Flights AS F
ON F.PlaneId = P.Id
LEFT JOIN Tickets AS T
ON T.FlightId = F.Id
GROUP BY P.[Name], P.Seats
ORDER BY [Passengers Count] DESC, [Name], [Seats]


