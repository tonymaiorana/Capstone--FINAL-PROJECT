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
-- Description:	<Description,,Get Blog Image By BlogID>
-- =============================================
CREATE PROCEDURE GetBlogImageByBlogID
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT i.ImageData FROM [Image] i
	LEFT JOIN BlogImage bi
	 ON bi.ImageID = i.ImageID
	 INNER JOIN BlogPost bp
	  ON bp.BlogPostID = bi.BlogPostID
	WHERE bp.BlogPostID = bi.BlogPostID
END
GO
