CREATE FUNCTION udf_CheckForVehicle(@townName NVARCHAR(50), @seatsNumber INT)
RETURNS NVARCHAR(200)
AS
BEGIN

	DECLARE @officeName NVARCHAR(40) = (
			SELECT TOP(1) O.[Name] FROM Offices AS O
			JOIN Towns AS T ON O.TownId = T.Id
			JOIN Vehicles AS V ON O.Id = V.OfficeId
			JOIN Models AS M ON V.ModelId = M.Id
			WHERE T.[Name] = @townName AND M.Seats = @seatsNumber
			ORDER BY O.[Name])

	IF(@officeName IS NULL)
	BEGIN
		RETURN 'NO SUCH VEHICLE FOUND';
	END

	DECLARE @model NVARCHAR(50) = (
			SELECT TOP(1) M.Model FROM Offices AS O
			JOIN Towns AS T ON O.TownId = T.Id
			JOIN Vehicles AS V ON O.Id = V.OfficeId
			JOIN Models AS M ON V.ModelId = M.Id
			WHERE T.[Name] = @townName AND M.Seats = @seatsNumber
			ORDER BY O.[Name])


	RETURN CONCAT(@officeName, ' - ', @model);

END