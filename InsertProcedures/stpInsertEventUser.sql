CREATE PROCEDURE InsertEventUser
    @EventID INT,
    @UserID INT,
    @IsInterested BIT,
    @IsGoing BIT,
    @TimeStamp DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        INSERT INTO [dbo].[EventUser] ([EventID], [UserID], [IsInterested], [IsGoing], [TimeStamp])
        VALUES (@EventID, @UserID, @IsInterested, @IsGoing, @TimeStamp);

        COMMIT TRANSACTION;
        PRINT 'EventUser inserted successfully.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while inserting EventUser.';
    END CATCH
END
