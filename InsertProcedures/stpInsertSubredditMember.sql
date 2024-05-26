CREATE PROCEDURE InsertSubredditMember
    @UserID INT,
    @SubredditID INT,
    @JoinTime DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        INSERT INTO [dbo].[SubredditMember] ([UserID], [SubredditID], [JoinTime])
        VALUES (@UserID, @SubredditID, @JoinTime);

        COMMIT TRANSACTION;
        PRINT 'Subreddit member inserted successfully.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while inserting Subreddit member.';
    END CATCH
END
