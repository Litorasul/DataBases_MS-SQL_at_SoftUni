USE School

UPDATE StudentsSubjects 
	SET Grade = 6.00
	WHERE Grade >= 5.5 AND (SubjectId = 1 OR SubjectId = 2)