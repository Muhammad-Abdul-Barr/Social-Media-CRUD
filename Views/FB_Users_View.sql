USE [Social App]
GO

/****** Object:  View [dbo].[FacebookUsers_View]    Script Date: 10-May-24 12:46:05 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FacebookUsers_View]

AS

SELECT SocialUser.UserID,
SocialUser.UserName,
SocialUser.AccountCreatedOn,
SocialUser.Password,
L1.Data AS Country,
L2.Data AS UserGender,
Fb_User.FollowerCount,
Fb_User.DoB
FROM SocialUser
LEFT JOIN Fb_User ON SocialUser.UserID = Fb_User.UserID
LEFT JOIN Lookup AS L1 ON Fb_User.Country = L1.ID
LEFT JOIN Lookup AS L2 ON Fb_User.UserGender = L2.ID
WHERE AccountType = 2;
GO

