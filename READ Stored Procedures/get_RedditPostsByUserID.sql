USE [Social App]
GO

/****** Object:  StoredProcedure [dbo].[get_RedditPostsByUserID]    Script Date: 10-May-24 12:43:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ashhad
-- Description:	Get Posts made by a given user
-- =============================================
CREATE PROCEDURE [dbo].[get_RedditPostsByUserID] 
	-- Add the parameters for the stored procedure here
	@id int
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    SELECT PostID,
	UserName,
	SubredditName,
	TimePosted,
	TimeEdited,
	PostText
	FROM Reddit_Posts_View
	WHERE UserID = @id;

	COMMIT TRANSACTION;
END
GO

