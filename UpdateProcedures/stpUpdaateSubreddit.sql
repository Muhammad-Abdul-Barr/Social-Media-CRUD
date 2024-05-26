CREATE PROCEDURE UpdateSubreddit
    @SubredditID INT,
    @SubredditName NVARCHAR(MAX),
    @TimeCreated DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        UPDATE [dbo].[Subreddit]
        SET [SubredditName] = @SubredditName,
            [TimeCreated] = @TimeCreated
        WHERE [SubredditID] = @SubredditID;

        IF @@ROWCOUNT > 0
        BEGIN
            COMMIT TRANSACTION;
            PRINT 'Subreddit updated successfully.';
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT 'Subreddit update failed. Subreddit with ID ' + CAST(@SubredditID AS NVARCHAR(MAX)) + ' does not exist.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while updating the Subreddit.';
    END CATCH
END