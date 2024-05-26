USE [Social App]
GO

/****** Object:  StoredProcedure [dbo].[get_ReactionsByRedditPostID]    Script Date: 10-May-24 12:42:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mian Muhammad Ashhad
-- Description:	Get reactions on a given reddit post
-- =============================================
CREATE PROCEDURE [dbo].[get_ReactionsByRedditPostID]
	@id int
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED

	SELECT UserName,
	InteractionTime,
	Vote
	FROM Reddit_Interactions_View
	WHERE PostID = @id;

	COMMIT TRANSACTION;
END
GO

