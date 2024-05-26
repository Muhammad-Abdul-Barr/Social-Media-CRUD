USE [Social App]
GO

/****** Object:  View [dbo].[Reddit_Posts_View]    Script Date: 10-May-24 12:47:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Reddit_Posts_View]

AS

SELECT PostID,
Reddit_Post.UserID,
SocialUser.UserName,
Reddit_Post.SubredditID,
Subreddit.SubredditName,
TimePosted,
TimeEdited,
PostText
  FROM Reddit_Post
  LEFT JOIN Subreddit ON Subreddit.SubredditID = Reddit_Post.SubredditID
  LEFT JOIN SocialUser ON SocialUser.UserID = Reddit_Post.UserID;
GO

