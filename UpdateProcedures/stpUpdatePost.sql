CREATE PROCEDURE UpdateFB_Post
    @PostID INT,
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
        UPDATE [dbo].[FB_Post]
        SET [Caption] = @Caption,
            [PageID] = @PageID,
            [Format] = @Format,
            [TimePosted] = @TimePosted,
            [UserID] = @UserID,
            [PostTitle] = @PostTitle
        WHERE [PostID] = @PostID;

        IF @@ROWCOUNT > 0
        BEGIN
            COMMIT TRANSACTION;
            PRINT 'FB_Post updated successfully.';
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT 'FB_Post update failed. Post with ID ' + CAST(@PostID AS NVARCHAR(MAX)) + ' does not exist.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while updating the FB_Post.';
    END CATCH
END