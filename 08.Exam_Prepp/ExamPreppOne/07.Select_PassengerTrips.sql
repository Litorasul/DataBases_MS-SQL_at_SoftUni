USE Airport

SELECT P.FirstName + ' ' + P.LastName AS [Full Name],
		F.Origin AS [Origin],
		F.Destination AS [Destination]
FROM Passengers AS p
JOIN Tickets AS t
ON T.PassengerId = P.Id
JOIN Flights AS f
ON T.FlightId = F.Id
ORDER BY [Full Name], [Origin], [Destination]