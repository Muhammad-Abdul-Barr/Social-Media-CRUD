CREATE PROCEDURE UpdateRedditInteraction
    @InteractionID INT,
    @PostID INT,
    @UserID INT,
    @InteractionTime DATETIME,
    @Vote INT,
    @Comment NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        UPDATE [dbo].[Reddit_Interaction]
        SET [PostID] = @PostID,
            [UserID] = @UserID,
            [InteractionTime] = @InteractionTime,
            [Vote] = @Vote,
            [Comment] = @Comment
        WHERE [InteractionID] = @InteractionID;

        IF @@ROWCOUNT > 0
        BEGIN
            COMMIT TRANSACTION;
            PRINT 'Reddit_Interaction updated successfully.';
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT 'Reddit_Interaction update failed. Interaction with ID ' + CAST(@InteractionID AS NVARCHAR(MAX)) + ' does not exist.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while updating the Reddit_Interaction.';
    END CATCH
END