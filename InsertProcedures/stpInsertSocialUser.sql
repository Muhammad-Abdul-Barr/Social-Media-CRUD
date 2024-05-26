CREATE PROCEDURE sp_Insert_SocialUser
    @UserName NVARCHAR(MAX),
    @Password NVARCHAR(MAX),
    @AccountType INT,
	@CreatedOn datetime
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

        INSERT INTO [dbo].[SocialUser] ([UserName], [Password] , [AccountType], [AccountCreatedOn])
        VALUES (@UserName, @Password, @AccountType,@CreatedOn);
    IF @@ROWCOUNT > 0
    BEGIN
        COMMIT TRANSACTION;
        SELECT 'Insertion Successful' AS Status;
    END
    ELSE
    BEGIN
        ROLLBACK TRANSACTION;
        SELECT 'Error' AS Status;
END;
