USE Airport

GO 

CREATE FUNCTION udf_CalculateTickets(@origin VARCHAR(50), @destination VARCHAR(50), @peopleCount INT)
RETURNS VARCHAR(50)
AS 
BEGIN
	IF(@peopleCount <= 0)
	BEGIN
		RETURN 'Invalid people count!';
	END

	DECLARE @flightId INT = (SELECT Id FROM Flights
							 WHERE Origin = @origin AND Destination = @destination)
	IF(@flightId IS NULL)
	BEGIN
		RETURN 'Invalid flight!';
	END

	DECLARE @pricePerPerson DECIMAL(18, 2) = (SELECT TOP(1) T.Price FROM Tickets AS T											  
											   WHERE T.FlightId = @flightId);

	DECLARE @totalPrice DECIMAL(24, 2) = @pricePerPerson * @peopleCount;

	RETURN CONCAT('Total price ', @totalPrice);
END