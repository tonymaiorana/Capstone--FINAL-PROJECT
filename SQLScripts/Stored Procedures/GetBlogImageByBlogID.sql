USE [CircularLogic]
GO
/****** Object:  StoredProcedure [dbo].[GetBlogImageByBlogID]    Script Date: 4/24/2016 6:27:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/24/2016>
-- Description:	<Description,,Get Blog Image By BlogID>
-- =============================================
CREATE PROCEDURE GetBlogImageByBlogID
	-- Add the parameters for the stored procedure here
	@BlogID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT i.ImageData, i.ImageID, i.Name FROM [Image] i
	LEFT JOIN BlogImage bi
	 ON bi.ImageID = i.ImageID
	WHERE @BlogID = bi.BlogPostID
END
