CREATE PROCEDURE sp_InsertFb_User
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
        INSERT INTO [dbo].[Fb_User] ([UserID], [Country], [UserGender], [FollowerCount], [DoB])
        VALUES (@UserID, @Country, @UserGender, @FollowerCount, @DoB);

       IF @@ROWCOUNT > 0
    BEGIN
        COMMIT TRANSACTION;
        SELECT 'Insertion Successful' AS Status;
    END
    ELSE
    BEGIN
        ROLLBACK TRANSACTION;
        SELECT 'Error' AS Status;
    END
END