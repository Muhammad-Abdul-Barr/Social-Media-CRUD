CREATE PROCEDURE UpdateEvent
    @EventID INT,
    @EventTitle NVARCHAR(MAX),
    @Location NVARCHAR(MAX),
    @CreatedBy INT,
    @InterestedUsers INT,
    @AttendingUsers INT,
    @CreatedOn DATETIME,
    @EventDate DATETIME,
    @PageID INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        UPDATE [dbo].[Event]
        SET [EventTitle] = @EventTitle,
            [Location] = @Location,
            [CreatedBy] = @CreatedBy,
            [InterestedUsers] = @InterestedUsers,
            [AttendingUsers] = @AttendingUsers,
            [CreatedOn] = @CreatedOn,
            [EventDate] = @EventDate,
            [PageID] = @PageID
        WHERE [EventID] = @EventID;

        IF @@ROWCOUNT > 0
        BEGIN
            COMMIT TRANSACTION;
            PRINT 'Event updated successfully.';
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT 'Event update failed. Event with ID ' + CAST(@EventID AS NVARCHAR(MAX)) + ' does not exist.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while updating the event.';
    END CATCH
END