USE [CircularLogic]
GO

/****** Object:  StoredProcedure [dbo].[GetBlogPostByBlogPostID]    Script Date: 4/25/2016 3:33:57 PM ******/
DROP PROCEDURE [dbo].[GetBlogPostByBlogPostID]
GO

/****** Object:  StoredProcedure [dbo].[GetBlogPostByBlogPostID]    Script Date: 4/25/2016 3:33:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/24/2016>
-- Description:	<Description,,Get BlogPost by BlogPostID>
-- =============================================
CREATE PROCEDURE [dbo].[GetBlogPostByBlogPostID]
	-- Add the parameters for the stored procedure here
	@BlogID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT        bp.BlogPostID, bp.ExpirationTime, bp.CreationTime, c.CategoryID, c.CategoryName, bp.Title, bp.TextBody, bp.UserID, bp.PostTime, bp.UpdateTime, bp.IsApproved, AspNetUsers.UserName
FROM            BlogPost AS bp INNER JOIN
                         Category AS c ON c.CategoryID = bp.CategoryID
						  INNER JOIN AspNetUsers ON bp.UserID = AspNetUsers.Id
WHERE        (@BlogID = bp.BlogPostID)
END


GO


