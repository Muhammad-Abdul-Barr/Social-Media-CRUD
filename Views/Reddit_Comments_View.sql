USE [Social App]
GO

/****** Object:  View [dbo].[Reddit_Comments_View]    Script Date: 10-May-24 12:46:55 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Reddit_Comments_View]

AS

SELECT Reddit_Post.PostID,
Reddit_Interaction.InteractionID,
SocialUser.UserName,
InteractionTime,
Comment
FROM Reddit_Post
LEFT JOIN Reddit_Interaction ON Reddit_Post.PostID = Reddit_Interaction.PostID
LEFT JOIN SocialUser ON SocialUser.UserID = Reddit_Interaction.UserID;
GO

