CREATE PROCEDURE UpdatePageFollower
    @FollowedBy INT,
    @FollowedPageID INT,
    @FollowedOn DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        UPDATE [dbo].[PageFollower]
        SET [FollowedOn] = @FollowedOn
        WHERE [FollowedBy] = @FollowedBy AND [FollowedPageID] = @FollowedPageID;

        IF @@ROWCOUNT > 0
        BEGIN
            COMMIT TRANSACTION;
            PRINT 'PageFollower updated successfully.';
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT 'PageFollower update failed. PageFollower with FollowedBy ' + CAST(@FollowedBy AS NVARCHAR(255)) + ' and FollowedPageID ' + CAST(@FollowedPageID AS NVARCHAR(255)) + ' does not exist.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while updating the PageFollower.';
    END CATCH
END