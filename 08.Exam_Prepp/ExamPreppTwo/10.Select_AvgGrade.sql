USE School

SELECT S.[Name], AVG(SS.Grade) AS [AverageGrade]
FROM Subjects AS S
JOIN StudentsSubjects AS SS
ON S.Id = SS.SubjectId
GROUP BY S.Id, S.[Name]
ORDER BY S.Id
