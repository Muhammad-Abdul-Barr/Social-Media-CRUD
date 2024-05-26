CREATE PROCEDURE UpdateFB_Interaction
    @InteractionID INT,
    @PostID INT,
    @UserID INT,
    @InteractionTime DATETIME,
    @CommentText NVARCHAR(MAX),
    @ReactionType INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        UPDATE [dbo].[FB_Interaction]
        SET [PostID] = @PostID,
            [UserID] = @UserID,
            [InteractionTime] = @InteractionTime,
            [CommentText] = @CommentText,
            [ReactionType] = @ReactionType
        WHERE [InteractionID] = @InteractionID;

        IF @@ROWCOUNT > 0
        BEGIN
            COMMIT TRANSACTION;
            PRINT 'FB_Interaction updated successfully.';
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT 'FB_Interaction update failed. Interaction with ID ' + CAST(@InteractionID AS NVARCHAR(255)) + ' does not exist.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while updating the FB_Interaction.';
    END CATCH
END