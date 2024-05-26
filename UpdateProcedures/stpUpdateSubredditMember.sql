CREATE PROCEDURE UpdateSubredditMember
    @UserID INT,
    @SubredditID INT,
    @JoinTime DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        UPDATE [dbo].[SubredditMember]
        SET [JoinTime] = @JoinTime
        WHERE [UserID] = @UserID AND [SubredditID] = @SubredditID;

        IF @@ROWCOUNT > 0
        BEGIN
            COMMIT TRANSACTION;
            PRINT 'Subreddit member updated successfully.';
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT 'Subreddit member update failed. Subreddit member with UserID ' + CAST(@UserID AS NVARCHAR(MAX)) + ' and SubredditID ' + CAST(@SubredditID AS NVARCHAR(MAX)) + ' does not exist.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while updating the Subreddit member.';
    END CATCH
END