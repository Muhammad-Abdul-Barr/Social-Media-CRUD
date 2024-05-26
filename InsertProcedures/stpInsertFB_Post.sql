CREATE PROCEDURE InsertFB_Post
    @Caption NVARCHAR(MAX),
    @PageID INT,
    @Format INT,
    @TimePosted DATETIME,
    @UserID INT,
    @PostTitle NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        INSERT INTO [dbo].[FB_Post] ([Caption], [PageID], [Format], [TimePosted], [UserID], [PostTitle])
        VALUES (@Caption, @PageID, @Format, @TimePosted, @UserID, @PostTitle);

        COMMIT TRANSACTION;
        PRINT 'FB post inserted successfully.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while inserting FB post.';
    END CATCH
END