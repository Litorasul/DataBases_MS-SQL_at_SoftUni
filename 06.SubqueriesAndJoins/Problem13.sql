SELECT
	mc.CountryCode,
	COUNT(mc.MountainId) AS [MountainRanges]
FROM Countries AS c
	JOIN MountainsCountries AS mc ON c.CountryCode = mc.CountryCode
	JOIN Mountains AS m ON mc.MountainId = m.Id
GROUP BY mc.CountryCode
HAVING mc.CountryCode = 'BG' OR mc.CountryCode = 'RU' OR mc.CountryCode = 'US'