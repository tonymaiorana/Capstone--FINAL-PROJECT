USE [CircularLogic]
GO

/****** Object:  StoredProcedure [dbo].[GetAdminQueue]    Script Date: 5/4/2016 11:38:47 PM ******/
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
		WHERE  bp.IsDeleted = 0 and bp.IsApproved != q.QueueActionID
END












GO


