USE [Social App]
GO

/****** Object:  StoredProcedure [dbo].[get_FbUserByCreds]    Script Date: 10-May-24 4:32:42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Mian Muhammad Ashhad
-- Description:	Get a Facebook User's details through their credentials
-- =============================================
CREATE PROCEDURE [dbo].[get_FbUserByCreds]
	-- Add the parameters for the stored procedure here
	@name nvarchar(MAX),
	@password nvarchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRANSACTION
    SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

    -- Insert statements for procedure here
	SELECT [UserID]
		,[UserName]
      ,[AccountCreatedOn]
      ,[Password]
      ,[Country]
      ,[UserGender]
      ,[FollowerCount]
      ,[DoB]
  FROM [Social App].[dbo].[FacebookUsers_View]
  WHERE Username = @name
  AND Password = @password;

  COMMIT TRANSACTION;
END
GO

