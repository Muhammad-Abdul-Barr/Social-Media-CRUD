USE [Social App]
GO

/****** Object:  View [dbo].[PageFollowers_View]    Script Date: 10-May-24 12:46:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PageFollowers_View]

AS

SELECT [FollowedBy]
      ,Page.PageName
      ,[FollowedOn]
  FROM [Social App].[dbo].[PageFollower]
  JOIN Page ON Page.PageID = PageFollower.FollowedPageID
GO

