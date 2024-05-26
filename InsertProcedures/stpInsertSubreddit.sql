CREATE PROCEDURE InsertSubreddit
    @SubredditID INT,
    @SubredditName NVARCHAR(MAX),
    @TimeCreated DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        INSERT INTO [dbo].[Subreddit] ([SubredditID], [SubredditName], [TimeCreated])
        VALUES (@SubredditID, @SubredditName, @TimeCreated);

        COMMIT TRANSACTION;
        PRINT 'Subreddit inserted successfully.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while inserting Subreddit.';
    END CATCH;
END;
