CREATE PROCEDURE UpdateSocialUser
    @UserID INT,
    @UserName NVARCHAR(MAX),
    @AccountCreatedOn DATETIME,
    @AccountType INT,
    @Password NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        UPDATE [dbo].[SocialUser]
        SET [UserName] = @UserName,
            [AccountCreatedOn] = @AccountCreatedOn,
            [AccountType] = @AccountType,
            [Password] = @Password
        WHERE [UserID] = @UserID;

        IF @@ROWCOUNT > 0
        BEGIN
            COMMIT TRANSACTION;
            PRINT 'Social user updated successfully.';
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT 'Social user update failed. User with ID ' + CAST(@UserID AS NVARCHAR(MAX)) + ' does not exist.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while updating the social user.';
    END CATCH
END