USE [CircularLogic]
GO
/****** Object:  StoredProcedure [dbo].[UpdateStaticPageContent]    Script Date: 5/4/2016 8:55:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		William Poulson
-- Create date: 4/29/2016
-- Description:	updates content for static pages 
-- =============================================
ALTER PROCEDURE [dbo].[UpdateStaticPageContent]
	-- Add the parameters for the stored procedure here
	@StaticPageID int,
	@Title varchar(150),
	@TextBody varchar(MAX),
	@UpdateTime datetime,
	@Name varchar(50),
	@ImageData varchar(max),
	@LinkName varchar(50)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE StaticPage
	SET Title = @Title, TextBody = @TextBody, UpdateTime = @UpdateTime, LinkName = @LinkName
		WHERE StaticPageID = @StaticPageID
			
END





