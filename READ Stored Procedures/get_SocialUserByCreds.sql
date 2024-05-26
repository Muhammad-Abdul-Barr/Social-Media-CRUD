USE [Social App]
GO

/****** Object:  StoredProcedure [dbo].[get_SocialUserByCreds]    Script Date: 10-May-24 4:46:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ashhad
-- Description:	Get social user details by credentials
-- =============================================
CREATE PROCEDURE [dbo].[get_SocialUserByCreds]
	@name nvarchar(MAX),
	@password nvarchar(MAX)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

	SELECT UserID,
	UserName,
	AccountCreatedOn,
	AccountType,
	Password
	FROM SocialUsers_View
	WHERE Username = @name AND Password = @password

END
GO

