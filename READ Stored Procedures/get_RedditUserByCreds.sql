USE [Social App]
GO

/****** Object:  StoredProcedure [dbo].[get_RedditUserByCredss]    Script Date: 10-May-24 4:33:20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ashhad
-- Description:	Get Reddit User by Username and Password
-- =============================================
CREATE PROCEDURE [dbo].[get_RedditUserByCredss]
	-- Add the parameters for the stored procedure here
	@name nvarchar(MAX), @password nvarchar(MAX)
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
	WHERE UserName = @name AND Password = @password;

	COMMIT TRANSACTION;
END
GO

