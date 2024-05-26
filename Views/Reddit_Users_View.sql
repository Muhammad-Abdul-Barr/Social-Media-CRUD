USE [Social App]
GO

/****** Object:  View [dbo].[Reddit_Users_View]    Script Date: 10-May-24 12:48:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Reddit_Users_View]

AS

SELECT Reddit_User.UserID,
SocialUser.UserName,
SocialUser.Password,
SocialUser.AccountCreatedOn,
Reddit_User.PostKarma,
Reddit_User.CommentKarma
FROM Reddit_User
LEFT JOIN SocialUser ON Reddit_User.UserID = SocialUser.UserID
WHERE SocialUser.AccountType = 1;
GO

