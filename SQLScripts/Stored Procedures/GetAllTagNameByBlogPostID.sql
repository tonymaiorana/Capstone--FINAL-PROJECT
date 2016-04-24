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
-- Description:	<Description,,Get All TagName by BlogPostID>
-- =============================================
CREATE PROCEDURE GetAllTagNameByBlogPostID 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TagName FROM Tag t
	LEFT JOIN PostTag pt ON pt.TagID = t.TagID
	INNER JOIN BlogPost bp ON pt.BlogPostID = bp.BlogPostID
	WHERE bp.BlogPostID = pt.BlogPostID
END
GO
