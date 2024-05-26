CREATE PROCEDURE UpdateFb_User
    @UserID INT,
    @Country INT,
    @UserGender INT,
    @FollowerCount INT,
    @DoB DATETIME
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        UPDATE [dbo].[Fb_User]
        SET [Country] = @Country,
            [UserGender] = @UserGender,
            [FollowerCount] = @FollowerCount,
            [DoB] = @DoB
        WHERE [UserID] = @UserID;

        IF @@ROWCOUNT > 0
        BEGIN
            COMMIT TRANSACTION;
            PRINT 'Fb_User updated successfully.';
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT 'Fb_User update failed. User with ID ' + CAST(@UserID AS NVARCHAR(255)) + ' does not exist.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while updating the Fb_User.';
    END CATCH
END