CREATE PROCEDURE usp_MoveVehicle(@vehicleId INT, @officeId INT)
AS
BEGIN
	BEGIN TRANSACTION [Tran1]

	BEGIN TRY
		DECLARE @officeParkingCapacity INT = (
		SELECT ParkingPlaces FROM Offices
		WHERE Id = @officeId);


		DECLARE @officeParkedCars INT = (
		SELECT COUNT(Id) FROM Vehicles
		WHERE OfficeId = @officeId);

		IF(@officeParkedCars = @officeParkingCapacity)
		BEGIN
			RAISERROR('Not enough room in this office!', 16, 1);
		END

		UPDATE Vehicles
			SET OfficeId = @officeId
			WHERE Id = @vehicleId;

		COMMIT TRANSACTION [Tran1]
	
	 END TRY

  BEGIN CATCH
	
DECLARE 
    @ErrorMessage  NVARCHAR(4000) = ERROR_MESSAGE(), 
    @ErrorSeverity INT = ERROR_SEVERITY(), 
    @ErrorState    INT = ERROR_STATE();

      ROLLBACK TRANSACTION [Tran1]

	  RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);

  END CATCH  
	
END

