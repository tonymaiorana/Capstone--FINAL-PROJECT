-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/24/2016>
-- Description:	<Description,,Get All BlogPost By TagID>
-- =============================================
CREATE PROCEDURE GetAllBlogPostByTagID
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT c.CategoryName, bp.UserID, bp.Title, bp.TextBody, bp.PostTime, t.TagName
 FROM BlogPost bp
INNER JOIN Category c
 ON c.CategoryID = bp.CategoryID
INNER JOIN PostTag pt
 ON pt.BlogPostID = bp.BlogPostID
LEFT JOIN Tag t
 ON t.TagID = pt.TagID
WHERE t.tagID = pt.TagID
END
GO
