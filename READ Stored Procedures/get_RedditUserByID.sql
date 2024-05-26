USE [Social App]
GO

/****** Object:  StoredProcedure [dbo].[get_RedditUserByID]    Script Date: 10-May-24 12:43:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mian Muhammad Ashhad
-- Description:	Get Reddit user details by ID
-- =============================================
CREATE PROCEDURE [dbo].[get_RedditUserByID] 
	@id int
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

	SELECT UserID,
	UserName,
	Password,
	AccountCreatedOn,
	PostKarma,
	CommentKarma
	FROM Reddit_Users_View
	WHERE UserID = @id;

	COMMIT TRANSACTION;
END
GO

