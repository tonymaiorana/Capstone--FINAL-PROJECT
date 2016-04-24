USE [CircularLogic]
GO
/****** Object:  StoredProcedure [dbo].[GetBlogPostByBlogPostID]    Script Date: 4/24/2016 6:25:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/24/2016>
-- Description:	<Description,,Get BlogPost by BlogPostID>
-- =============================================
ALTER PROCEDURE [dbo].[GetBlogPostByBlogPostID]
	-- Add the parameters for the stored procedure here
	@BlogID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT c.CategoryName, bp.Title, bp.TextBody
	,bp.UserID, bp.PostTime, bp.UpdateTime
	FROM BlogPost bp
	INNER JOIN Category c
	 ON c.CategoryID = bp.CategoryID
	WHERE @BlogID = bp.BlogPostID
END
