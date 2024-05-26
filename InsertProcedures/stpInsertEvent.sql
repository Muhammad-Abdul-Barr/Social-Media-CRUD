CREATE PROCEDURE InsertEvent
    @EventID INT,
    @EventName NVARCHAR(MAX),
    @EventDate DATETIME,
    @Location NVARCHAR(MAX),
    @CreatedBy INT
AS
BEGIN 
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        INSERT INTO [dbo].[Event] ([EventID], [EventTitle], [EventDate], [Location], [CreatedBy])
        VALUES (@EventID, @EventName, @EventDate, @Location, @CreatedBy);

        COMMIT TRANSACTION;
        PRINT 'Event inserted successfully.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while inserting Event.';
    END CATCH
END