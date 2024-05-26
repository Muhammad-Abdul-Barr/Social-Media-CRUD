CREATE PROCEDURE UpdateEventUser
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
        UPDATE [dbo].[EventUser]
        SET [IsInterested] = @IsInterested,
            [IsGoing] = @IsGoing,
            [TimeStamp] = @TimeStamp
        WHERE [EventID] = @EventID AND [UserID] = @UserID;

        IF @@ROWCOUNT > 0
        BEGIN
            COMMIT TRANSACTION;
            PRINT 'EventUser updated successfully.';
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT 'EventUser update failed. EventUser with EventID ' + CAST(@EventID AS NVARCHAR(255)) + ' and UserID ' + CAST(@UserID AS NVARCHAR(255)) + ' does not exist.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while updating the EventUser.';
    END CATCH
END