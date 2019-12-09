USE School

GO

CREATE PROCEDURE usp_ExcludeFromSchool(@StudentId INT)
AS 
BEGIN
	DECLARE @studentName NVARCHAR(30) =(
			SELECT FirstName FROM Students
			WHERE Id = @StudentId);

	IF(@studentName IS NULL)
	BEGIN
		RAISERROR('This school has no student with the provided id!',16,1);
	END

	DELETE FROM StudentsExams
	WHERE StudentId = @StudentId;

	DELETE FROM StudentsTeachers
	WHERE StudentId = @StudentId;

	DELETE FROM StudentsSubjects
	WHERE StudentId = @StudentId;

	DELETE FROM Students
	WHERE Id = @StudentId;
END