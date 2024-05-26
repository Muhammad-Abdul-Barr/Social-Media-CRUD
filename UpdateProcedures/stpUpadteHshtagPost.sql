CREATE PROCEDURE UpdateHashtagPost
    @HashtagID INT,
    @PostID INT,
    @HashtagCount INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        UPDATE [dbo].[HashtagPost]
        SET [HashtagCount] = @HashtagCount
        WHERE [HashtagID] = @HashtagID AND [PostID] = @PostID;

        IF @@ROWCOUNT > 0
        BEGIN
            COMMIT TRANSACTION;
            PRINT 'HashtagPost updated successfully.';
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT 'HashtagPost update failed. Hashtag with ID ' + CAST(@HashtagID AS NVARCHAR(MAX)) + ' and Post with ID ' + CAST(@PostID AS NVARCHAR(MAX)) + ' does not exist.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while updating the HashtagPost.';
    END CATCH
END