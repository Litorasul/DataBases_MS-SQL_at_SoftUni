USE School

SELECT S.FirstName, S.LastName, COUNT(ST.TeacherId) AS TeachersCount
FROM Students AS S
LEFT JOIN StudentsTeachers AS ST
ON S.Id = ST.StudentId
GROUP BY S.FirstName, S.LastName