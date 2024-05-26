CREATE PROCEDURE InsertHashtagPost
    @HashtagID INT,
    @PostID INT,
    @HashtagCount INT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        INSERT INTO [dbo].[HashtagPost] ([HashtagID], [PostID], [HashtagCount])
        VALUES (@HashtagID, @PostID, @HashtagCount);

        COMMIT TRANSACTION;
        PRINT 'HashtagPost inserted successfully.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while inserting HashtagPost.';
    END CATCH
END