CREATE PROCEDURE InsertPage
    @PageID INT,
    @PageName NVARCHAR(MAX),
    @PageFollowerCount INT,
    @PageCategory INT,
    @CreatedBy INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

        INSERT INTO [dbo].[Page] ([PageID], [PageName], [PageFollowerCount], [PageCategory], [CreatedBy])
        VALUES (@PageID, @PageName, @PageFollowerCount, @PageCategory, @CreatedBy);
		IF @@ROWCOUNT > 0
    BEGIN
        COMMIT TRANSACTION;
        SELECT 'Deletion Successful' AS Status;
    END
    ELSE
    BEGIN
        ROLLBACK TRANSACTION;
        SELECT 'No rows deleted' AS Status;
    END
END;
