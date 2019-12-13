USE CarShowroom

SELECT M.Model, M.Seats, V.Mileage
FROM Vehicles AS V
JOIN Models AS M
ON V.ModelId = M.Id
JOIN Orders AS O
ON V.Id = O.VehicleId
WHERE O.ReturnDate IS NULL
ORDER BY V.Mileage, M.Seats DESC, M.Id