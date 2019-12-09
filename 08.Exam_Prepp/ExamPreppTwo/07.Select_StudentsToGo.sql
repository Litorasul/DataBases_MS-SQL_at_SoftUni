USE School

SELECT CONCAT(S.FirstName, ' ', S.LastName) AS [Full Name]
FROM Students AS S
LEFT JOIN StudentsExams AS SE
ON S.Id = SE.StudentId
LEFT JOIN Exams AS E
ON SE.ExamId = E.Id
WHERE E.Id IS NULL
ORDER BY [Full Name]