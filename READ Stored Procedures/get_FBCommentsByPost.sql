USE [Social App]
GO

/****** Object:  StoredProcedure [dbo].[get_FBCommentsByPost]    Script Date: 10-May-24 12:41:08 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mian Muhammad Ashhad
-- Description:	Get comments on a given post
-- =============================================
CREATE PROCEDURE [dbo].[get_FBCommentsByPost]
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
      ,[CommentText]
  FROM [Social App].[dbo].[Facebook_Comments_View]
  WHERE PostID = @id;

	COMMIT TRANSACTION;
END
GO

