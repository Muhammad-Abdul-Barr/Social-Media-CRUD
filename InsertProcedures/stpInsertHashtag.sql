CREATE PROCEDURE InsertHashtag
    @HashtagName VARCHAR(255),
    @Popularity INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        INSERT INTO [dbo].[Hashtag] ([HashtagName], [Popularity])
        VALUES (@HashtagName, @Popularity);

        COMMIT TRANSACTION;
        PRINT 'Hashtag inserted successfully.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while inserting Hashtag.';
    END CATCH
END