USE [Social App]
GO

/****** Object:  StoredProcedure [dbo].[get_EventUserDetails]    Script Date: 10-May-24 12:41:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mian Muhammad Ashhad
-- Description:	Get event attendance details of a user
-- =============================================
CREATE PROCEDURE [dbo].[get_EventUserDetails]
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION
	SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    -- Insert statements for procedure here
	SELECT EventTitle,
	Location,
	EventDate,
	IsInterested,
	IsGoing
	FROM EventUser_View
	WHERE UserID = @id;

	COMMIT TRANSACTION;
END
GO

