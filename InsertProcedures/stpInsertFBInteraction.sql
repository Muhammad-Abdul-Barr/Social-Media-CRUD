CREATE PROCEDURE InsertFBInteraction
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
        INSERT INTO [dbo].[FB_Interaction] ([PostID], [UserID], [InteractionTime], [CommentText], [ReactionType])
        VALUES (@PostID, @UserID, @InteractionTime, @CommentText, @ReactionType);

        COMMIT TRANSACTION;
        PRINT 'FB Interaction inserted successfully.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while inserting FB Interaction.';
    END CATCH
END
