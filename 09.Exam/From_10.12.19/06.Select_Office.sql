USE CarShowroom

SELECT T.[Name] AS [TownName], O.[Name] AS [OfficeName], O.ParkingPlaces AS [ParkingPlaces] 
FROM Offices AS O
JOIN Towns AS T
ON O.TownId = T.Id
WHERE O.ParkingPlaces > 25
ORDER BY [TownName], O.Id