USE [CircularLogic]
GO
/****** Object:  StoredProcedure [dbo].[GetBlogPostByBlogPostID]    Script Date: 4/24/2016 2:26:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/24/2016>
-- Description:	<Description,,Get BlogPost by BlogPostID>
-- =============================================
CREATE PROCEDURE GetBlogPostByBlogPostID
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT c.CategoryName, bp.Title, bp.TextBody
	,bp.UserID, bp.PostTime, bp.UpdateTime, t.TagName
	FROM BlogPost bp
	INNER JOIN Category c
	 ON c.CategoryID = bp.CategoryID
	 INNER JOIN PostTag pt
	  ON pt.BlogPostID = bp.BlogPostID
	  LEFT JOIN Tag t
	   ON t.TagID = pt.TagID
	WHERE bp.BlogPostID = bp.BlogPostID
END
