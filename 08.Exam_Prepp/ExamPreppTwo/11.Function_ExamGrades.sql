USE School

GO

CREATE FUNCTION udf_ExamGradesToUpdate(@studentId INT, @grade DECIMAL(18, 2))
RETURNS NVARCHAR(100)
AS
BEGIN
	IF(@grade > 6.00)
	BEGIN
		RETURN 'Grade cannot be above 6.00!';
	END

	DECLARE @firstName NVARCHAR(30) = (
			SELECT FirstName FROM Students WHERE Id = @studentId) 

	IF(@firstName IS NULL)
	BEGIN
		RETURN 'The student with provided id does not exist in the school!';
	END
	DECLARE @topLine DECIMAL(18, 2);

	IF(@grade <= 5.5)
	BEGIN
		SET @topLine = @grade + 0.5;
	END
	IF(@grade > 5.5)
	BEGIN
		SET @topLine = 6;
	END

	DECLARE @count INT =(
		SELECT COUNT(Grade) FROM StudentsSubjects
		 WHERE StudentId = @studentId AND Grade > @grade AND Grade <= @topLine)

	RETURN CONCAT('You have to update', ' ', @count, ' ', 'grades for the student', ' ', @firstName)

END