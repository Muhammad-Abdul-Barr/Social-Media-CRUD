USE [Social App]
GO

/****** Object:  View [dbo].[EventUser_View]    Script Date: 10-May-24 12:45:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[EventUser_View]

AS

SELECT EventUser.EventID,
EventUser.UserID,
Event.EventTitle,
Event.Location,
Event.EventDate,
EventUser.IsInterested,
EventUser.IsGoing
  FROM EventUser
  LEFT JOIN Event ON EventUser.EventID = Event.EventID;
GO

