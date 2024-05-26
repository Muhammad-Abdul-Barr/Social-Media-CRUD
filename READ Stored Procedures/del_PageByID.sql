SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Muhammad Abdul Barr>
-- Description:	<Deletes Facebook Page by ID Reference. Used When Page is Deleted by Admin>
-- =============================================
CREATE PROCEDURE del_PageByID
    @id int
AS	
BEGIN 
    BEGIN TRANSACTION
    SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

    -- Perform deletion process
    DELETE FROM Page
    WHERE PageID = @id;

    -- Check if deletion was successful
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
END

