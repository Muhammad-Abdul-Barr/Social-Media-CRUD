CREATE PROCEDURE InsertPageFollower
    @FollowedBy INT,
    @FollowedPageID INT,
    @FollowedOn DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        INSERT INTO [dbo].[PageFollower] ([FollowedBy], [FollowedPageID], [FollowedOn])
        VALUES (@FollowedBy, @FollowedPageID, @FollowedOn);

        COMMIT TRANSACTION;
        PRINT 'Page Follower inserted successfully.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while inserting Page Follower.';
    END CATCH
END