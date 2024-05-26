CREATE PROCEDURE InsertRedditInteraction
    @PostID INT,
    @UserID INT,
    @InteractionTime DATETIME,
    @Vote INT,
    @Comment NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    BEGIN TRY
        INSERT INTO [dbo].[Reddit_Interaction] ([PostID], [UserID], [InteractionTime], [Vote], [Comment])
        VALUES (@PostID, @UserID, @InteractionTime, @Vote, @Comment);

        COMMIT TRANSACTION;
        PRINT 'Reddit Interaction inserted successfully.';
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'An error occurred while inserting Reddit Interaction.';
    END CATCH
END