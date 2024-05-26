CREATE PROCEDURE InsertRedditPost
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
        INSERT INTO [dbo].[Reddit_Post] ([UserID], [SubredditID], [TimePosted], [TimeEdited], [PostText])
        VALUES (@UserID, @SubredditID, @TimePosted, @TimeEdited, @PostText);

        COMMIT TRANSACTION;
        PRINT 'Reddit Post inserted successfully.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while inserting Reddit Post.';
    END CATCH
END