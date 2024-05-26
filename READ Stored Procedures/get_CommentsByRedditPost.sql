USE [Social App]
GO

/****** Object:  StoredProcedure [dbo].[get_CommentsByRedditPostID]    Script Date: 10-May-24 12:41:27 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mian Muhammad Ashhad
-- Description:	Get comments on a given reddit post
-- =============================================
CREATE PROCEDURE [dbo].[get_CommentsByRedditPostID]
	@id int
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED

	SELECT UserName,
	InteractionTime,
	Comment
	FROM Reddit_Comments_View
	WHERE PostID = @id;

	COMMIT TRANSACTION;
END
GO

