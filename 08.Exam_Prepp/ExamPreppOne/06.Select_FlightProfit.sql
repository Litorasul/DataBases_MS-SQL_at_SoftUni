USE Airport

SELECT F.Id AS [FlightId],
		SUM(Price) AS [Price]
FROM Flights AS F
JOIN Tickets AS T
ON T.FlightId = F.Id
GROUP BY F.Id
ORDER BY Price DESC, F.Id