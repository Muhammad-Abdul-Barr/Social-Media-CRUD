USE [Social App]
GO

/****** Object:  View [dbo].[Facebook_Reactions_View]    Script Date: 10-May-24 12:46:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Facebook_Reactions_View]

AS

SELECT FB_Interaction.InteractionID,
FB_Interaction.PostID,
FB_Post.PostTitle,
SocialUser.UserName,
FB_Interaction.InteractionTime,
Lookup.Data AS ReactionType
  FROM FB_Interaction
  LEFT JOIN FB_Post ON FB_Post.PostID = FB_Interaction.PostID
  LEFT JOIN SocialUser ON SocialUser.UserID = FB_Interaction.UserID
  LEFT JOIN Lookup ON Lookup.ID = FB_Interaction.ReactionType;
GO

