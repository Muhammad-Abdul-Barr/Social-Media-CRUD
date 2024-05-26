USE [Social App]
GO

/****** Object:  View [dbo].[Reddit_Votes_View]    Script Date: 10-May-24 12:47:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Reddit_Votes_View]

AS

SELECT Reddit_Post.PostID,
Reddit_Interaction.InteractionID,
SocialUser.UserName,
InteractionTime,
Lookup.Data AS Vote
FROM Reddit_Post
LEFT JOIN Reddit_Interaction ON Reddit_Post.PostID = Reddit_Interaction.PostID
LEFT JOIN SocialUser ON SocialUser.UserID = Reddit_Interaction.UserID
LEFT JOIN Lookup ON Lookup.ID = Reddit_Interaction.Vote;
GO

