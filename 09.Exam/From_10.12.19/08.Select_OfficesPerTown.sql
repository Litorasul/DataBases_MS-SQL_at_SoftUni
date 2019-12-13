USE CarShowroom

SELECT 
	T.[Name] AS [TownName],
	COUNT(O.Id) AS [OfficesNumber]
FROM Towns AS T
JOIN Offices AS O
ON T.Id = O.TownId
GROUP BY T.[Name]
ORDER BY [OfficesNumber] DESC, [TownName]