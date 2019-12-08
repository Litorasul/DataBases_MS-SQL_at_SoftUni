USE Airport

SELECT 
	P.FirstName + ' ' + P.LastName AS [Full Name],
	PL.[Name] AS [Plane Name],
	F.Origin + ' - ' + F.Destination AS [Trip],
	LT.[Type] AS [Luggage Type]
FROM Passengers AS P
JOIN Tickets AS T
ON T.PassengerId = P.Id
LEFT JOIN Luggages AS L
ON T.LuggageId = L.Id
JOIN Flights AS F 
ON T.FlightId = F.Id
JOIN Planes AS PL
ON F.PlaneId = PL.Id
LEFT JOIN LuggageTypes AS LT
ON L.LuggageTypeId = LT.Id
ORDER BY [Full Name], [Plane Name], F.Origin, F.Destination, [Luggage Type]