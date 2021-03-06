USE [CircularLogic]
GO
/****** Object:  StoredProcedure [dbo].[GetAllBlogs]    Script Date: 4/25/2016 6:40:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/24/2016>
-- Description:	<Description,,Get All Blogs>
-- =============================================
CREATE PROCEDURE GetAllBlogs
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT c.CategoryName, bp.BlogPostID, bp.Title, bp.UserID, bp.TextBody, bp.UpdateTime, bp.ExpirationTime, c.CategoryID, bp.CreationTime, bp.IsApproved, bp.PostTime FROM BlogPost bp
	INNER JOIN Category c
	 ON c.CategoryID = bp.CategoryID
	  WHERE bp.IsApproved = 1 AND bp.IsDeleted = 0
END

