CREATE PROCEDURE UpdatePage
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

    BEGIN TRY
        UPDATE [dbo].[Page]
        SET [PageName] = @PageName,
            [PageFollowerCount] = @PageFollowerCount,
            [PageCategory] = @PageCategory,
            [CreatedBy] = @CreatedBy
        WHERE [PageID] = @PageID;

        IF @@ROWCOUNT > 0
        BEGIN
            COMMIT TRANSACTION;
            PRINT 'Page updated successfully.';
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT 'Page update failed. Page with ID ' + CAST(@PageID AS NVARCHAR(MAX)) + ' does not exist.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while updating the Page.';
    END CATCH
END