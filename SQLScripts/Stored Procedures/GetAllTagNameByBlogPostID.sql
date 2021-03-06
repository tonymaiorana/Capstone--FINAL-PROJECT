USE [CircularLogic]
GO
/****** Object:  StoredProcedure [dbo].[GetAllTagNameByBlogPostID]    Script Date: 4/24/2016 6:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/24/2016>
-- Description:	<Description,,Get All TagName by BlogPostID>
-- =============================================
CREATE PROCEDURE GetAllTagNameByBlogPostID 
	-- Add the parameters for the stored procedure here
	@BlogID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT t.TagID, t.TagName FROM Tag t
	LEFT JOIN PostTag pt ON pt.TagID = t.TagID
	WHERE @BlogID = pt.BlogPostID
END
