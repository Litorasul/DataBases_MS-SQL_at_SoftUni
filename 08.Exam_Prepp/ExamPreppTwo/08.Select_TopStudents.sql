USE School

SELECT TOP(10) 
	S.FirstName AS [First Name],
	S.LastName AS [Last Name],
	FORMAT(AVG(SE.Grade), 'F2') AS Grade
FROM Students AS S
JOIN StudentsExams AS SE
ON S.Id = SE.StudentId
GROUP BY S.FirstName, S.LastName
ORDER BY Grade DESC, S.FirstName, S.LastName