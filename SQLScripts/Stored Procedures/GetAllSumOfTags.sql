USE [CircularLogic]
GO
/****** Object:  StoredProcedure [dbo].[GetAllSumOfTags]    Script Date: 4/30/2016 9:18:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, Hannah>
-- Create date: <4/30/2016>
-- Description:	<Sum of all Tags>
-- =============================================
ALTER PROCEDURE [dbo].[GetAllSumOfTags] 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
SELECT        Tag.TagID, Tag.TagName, COUNT(PostTag.BlogPostID) AS Weight
FROM            Tag LEFT OUTER JOIN
                         PostTag ON Tag.TagID = PostTag.TagID
GROUP BY Tag.TagName, Tag.TagID
END
