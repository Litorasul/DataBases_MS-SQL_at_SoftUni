USE CarShowroom

SELECT 
	C.FirstName,
	C.LastName
FROM Clients AS C
JOIN Orders AS O
ON C.Id = O.ClientId
JOIN Vehicles AS V
ON O.VehicleId = V.Id
JOIN Models AS M
ON V.ModelId = M.Id
GROUP BY C.FirstName, C.LastName