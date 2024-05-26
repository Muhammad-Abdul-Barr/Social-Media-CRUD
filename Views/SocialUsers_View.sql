USE [Social App]
GO

/****** Object:  View [dbo].[SocialUsers_View]    Script Date: 10-May-24 4:46:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SocialUsers_View]

AS

SELECT UserID,
UserName,
AccountCreatedOn,
Lookup.Data AS AccountType,
Password
FROM SocialUser
LEFT JOIN Lookup ON Lookup.ID = SocialUser.AccountType;
GO

