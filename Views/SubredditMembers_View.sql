USE [Social App]
GO

/****** Object:  View [dbo].[SubredditMembers_View]    Script Date: 10-May-24 12:48:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SubredditMembers_View]

AS

SELECT SubredditMember.UserID,
UserName,
SubredditMember.SubredditID,
SubredditName,
JoinTime
  FROM SubredditMember
  LEFT JOIN Subreddit ON Subreddit.SubredditID = SubredditMember.SubredditID
  LEFT JOIN SocialUser ON SocialUser.UserID = SubredditMember.UserID;
GO

