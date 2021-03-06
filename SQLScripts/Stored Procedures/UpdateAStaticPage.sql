USE [CircularLogic]
GO
/****** Object:  StoredProcedure [dbo].[UpdateAStaticPage]    Script Date: 5/4/2016 8:55:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, Hannah>
-- Create date: <Create 5/3/2016>
-- Description:	<Description, Updating a static page>
-- =============================================
ALTER PROCEDURE [dbo].[UpdateAStaticPage]
	-- Add the parameters for the stored procedure here
                @StaticPageID int,
                @Title varchar(150),
                @TextBody varchar(max),
                @UpdateTime datetime,
				@LinkName varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE       StaticPage
SET                Title = @Title, TextBody = @TextBody, UpdateTime = @UPDATETIME, LinkName = @LinkName
WHERE        (StaticPageID = @StaticPageID)
END

