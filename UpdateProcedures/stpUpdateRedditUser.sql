CREATE PROCEDURE UpdateRedditUser
    @UserID INT,
    @PostKarma INT,
    @CommentKarma INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        UPDATE [dbo].[Reddit_User]
        SET [PostKarma] = @PostKarma,
            [CommentKarma] = @CommentKarma
        WHERE [UserID] = @UserID;

        IF @@ROWCOUNT > 0
        BEGIN
            COMMIT TRANSACTION;
            PRINT 'Reddit_User updated successfully.';
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT 'Reddit_User update failed. User with ID ' + CAST(@UserID AS NVARCHAR(MAX)) + ' does not exist.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while updating the Reddit_User.';
    END CATCH
END