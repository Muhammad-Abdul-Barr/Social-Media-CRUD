USE [Social App]
GO

/****** Object:  StoredProcedure [dbo].[get_FBPostsByUserID]    Script Date: 10-May-24 12:42:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mian Muhammad Ashhad
-- Description:	Get Post details of a particular user
-- =============================================
CREATE PROCEDURE [dbo].[get_FBPostsByUserID] 
	@id int
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
	SELECT Caption,
	PageName,
	Format,
	TimePosted,
	UserName,
	PostTitle
	FROM FB_Post_View
	WHERE UserID = @id;

	COMMIT TRANSACTION;
END
GO

