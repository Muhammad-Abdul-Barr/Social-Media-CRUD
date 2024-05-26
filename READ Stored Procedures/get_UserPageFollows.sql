USE [Social App]
GO

/****** Object:  StoredProcedure [dbo].[get_UserPageFollows]    Script Date: 10-May-24 12:44:25 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mian Muhammad Ashhad
-- Create date: <Create Date,,>
-- Description:	Get a user's page follows
-- =============================================
CREATE PROCEDURE [dbo].[get_UserPageFollows]
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    -- Insert statements for procedure here
	SELECT PageName, FollowedOn
	FROM PageFollowers_View
	WHERE FollowedBy = @id;

	COMMIT TRANSACTION;
END
GO

