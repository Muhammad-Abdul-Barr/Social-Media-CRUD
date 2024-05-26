CREATE PROCEDURE UpdateHashtag
    @HashtagID INT,
    @HashtagName VARCHAR(255),
    @Popularity INT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        UPDATE [dbo].[Hashtag]
        SET [HashtagName] = @HashtagName,
            [Popularity] = @Popularity
        WHERE [HashtagID] = @HashtagID;

        IF @@ROWCOUNT > 0
        BEGIN
            COMMIT TRANSACTION;
            PRINT 'Hashtag updated successfully.';
        END
        ELSE
        BEGIN
            ROLLBACK TRANSACTION;
            PRINT 'Hashtag update failed. Hashtag with ID ' + CAST(@HashtagID AS VARCHAR(255)) + ' does not exist.';
        END
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while updating the Hashtag.';
    END CATCH
END