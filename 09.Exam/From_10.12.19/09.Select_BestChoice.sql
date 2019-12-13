USE CarShowroom

SELECT 
	M.Manufacturer,
	M.Model,
	COUNT(O.Id) AS [TimesOrdered]
FROM Models AS M
LEFT JOIN Vehicles AS V
ON M.Id = V.ModelId
LEFT JOIN Orders AS O
ON V.Id = O.VehicleId
GROUP BY M.Manufacturer, M.Model
ORDER BY [TimesOrdered] DESC, Manufacturer DESC, Model