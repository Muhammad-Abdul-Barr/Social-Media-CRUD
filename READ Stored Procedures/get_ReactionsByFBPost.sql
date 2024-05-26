USE [Social App]
GO

/****** Object:  StoredProcedure [dbo].[get_ReactionsByFBPost]    Script Date: 10-May-24 12:42:34 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Ashhad
-- Description:	Get reactions on a given post
-- =============================================
CREATE PROCEDURE [dbo].[get_ReactionsByFBPost]
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    -- Insert statements for procedure here
	SELECT [PostTitle]
      ,[UserName]
      ,[InteractionTime]
      ,[ReactionType]
  FROM [Social App].[dbo].[Facebook_Reactions_View]
  WHERE PostID = @id;

  COMMIT TRANSACTION;
END
GO

