USE School

SELECT CONCAT( S.FirstName,' ', S.MiddleName +' ', S.LastName) AS [Full Name]
FROM Students AS S
LEFT JOIN StudentsSubjects AS SS
ON S.Id = SS.StudentId
LEFT JOIN Subjects AS SJ
ON SS.SubjectId = SJ.Id
WHERE SJ.Id IS NULL
ORDER BY [Full Name]