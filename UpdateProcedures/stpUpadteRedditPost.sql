CREATE PROCEDURE UpdateRedditPost
    @PostID INT,
    @UserID INT,
    @SubredditID INT,
    @TimePosted DATETIME,
    @TimeEdited DATETIME,
    @PostText NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        UPDATE [dbo].[Reddit_Post]
        SET [UserID] = @UserID,
            [SubredditID] = @SubredditID,
            [TimePosted] = @TimePosted,
            [TimeEdited] = @TimeEdited,
            [PostText] = @PostText
        WHERE [PostID] = @PostID;

        IF @@ROWCOUNT > 0
        BEGIN
            COMMIT TRANSACTION;
            PRINT 'Reddit_Post updated successfully.';
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT 'Reddit_Post update failed. Post with ID ' + CAST(@PostID AS NVARCHAR(MAX)) + ' does not exist.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while updating the Reddit_Post.';
    END CATCH
END