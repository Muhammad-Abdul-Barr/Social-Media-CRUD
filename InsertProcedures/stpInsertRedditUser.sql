CREATE PROCEDURE InsertRedditUser
    @UserID INT,
    @PostKarma INT,
    @CommentKarma INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        INSERT INTO [dbo].[Reddit_User] ([UserID], [PostKarma], [CommentKarma])
        VALUES (@UserID, @PostKarma, @CommentKarma);

        COMMIT TRANSACTION;
        PRINT 'Reddit User inserted successfully.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while inserting Reddit User.';
    END CATCH
END