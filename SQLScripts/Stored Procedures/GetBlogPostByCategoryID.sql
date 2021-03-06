USE [CircularLogic]
GO
/****** Object:  StoredProcedure [dbo].[GetAllBlogPostByCategoryID]    Script Date: 4/24/2016 6:31:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/24/2016>
-- Description:	<Description,,Get All BlogPost by CategoryID>
-- =============================================
CREATE PROCEDURE GetAllBlogPostByCategoryID 
	-- Add the parameters for the stored procedure here
	@CategoryID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM BlogPost bp
	INNER JOIN Category c
	 ON c.CategoryID = bp.CategoryID
	WHERE @CategoryID = bp.CategoryID
END
