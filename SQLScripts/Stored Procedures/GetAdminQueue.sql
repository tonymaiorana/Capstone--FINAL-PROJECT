USE [CircularLogic]
GO

/****** Object:  StoredProcedure [dbo].[GetAdminQueue]    Script Date: 4/26/2016 11:16:00 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAdminQueue] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM BlogPost bp
		INNER JOIN Category c ON c.CategoryID = bp.CategoryID
		INNER JOIN ContentQueue q ON bp.BlogPostID = q.NewBlogPostID
		WHERE bp.IsApproved = 0 AND bp.IsDeleted = 0
END

GO


