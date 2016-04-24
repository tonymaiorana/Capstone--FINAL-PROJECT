USE [CircularLogic]
GO
/****** Object:  StoredProcedure [dbo].[GetAllBlogPostByTagID]    Script Date: 4/24/2016 6:30:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/24/2016>
-- Description:	<Description,,Get All BlogPost By TagID>
-- =============================================
ALTER PROCEDURE [dbo].[GetAllBlogPostByTagID]
	-- Add the parameters for the stored procedure here
	@TagID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT bp.BlogPostID
 FROM BlogPost bp
INNER JOIN Category c
 ON c.CategoryID = bp.CategoryID
INNER JOIN PostTag pt
 ON pt.BlogPostID = bp.BlogPostID
LEFT JOIN Tag t
 ON t.TagID = pt.TagID
WHERE @TagID = pt.TagID
END
