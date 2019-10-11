CREATE PROCEDURE usp_GetTownsStartingWith @String NVARCHAR(30)
AS
SELECT [Name]
FROM Towns
WHERE LEFT([Name], LEN(@String)) = @String