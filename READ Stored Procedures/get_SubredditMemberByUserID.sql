USE [Social App]
GO

/****** Object:  StoredProcedure [dbo].[get_SubredditMemberByUserID]    Script Date: 10-May-24 4:35:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mian Muhammad Ashhad
-- Description:	Get subreddit memberships of a given user
-- =============================================
CREATE PROCEDURE [dbo].[get_SubredditMemberByUserID] 
	@id int
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    SELECT
	SubredditName,
	JoinTime
	FROM SubredditMembers_View
	WHERE UserID = @id;

	COMMIT TRANSACTION;
END
GO

