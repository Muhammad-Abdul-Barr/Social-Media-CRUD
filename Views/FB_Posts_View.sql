USE [Social App]
GO

/****** Object:  View [dbo].[Fb_Post_View]    Script Date: 10-May-24 12:46:17 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Fb_Post_View]

AS

SELECT PostID,
Caption,
FB_Post.PageID,
Page.PageName,
Lookup.Data AS Format,
TimePosted,
FB_Post.UserID,
SocialUser.UserName,
PostTitle
FROM FB_Post
LEFT JOIN Page ON Page.PageID = FB_Post.PageID
LEFT JOIN Lookup ON Lookup.ID = FB_Post.Format
LEFT JOIN SocialUser ON SocialUser.UserID = FB_Post.UserID;
GO

