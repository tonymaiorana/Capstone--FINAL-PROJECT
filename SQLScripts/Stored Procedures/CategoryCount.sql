USE [CircularLogic]
GO

/****** Object:  StoredProcedure [dbo].[CategoryCount]    Script Date: 4/25/2016 3:12:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CategoryCount] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT c.*, count(b.CategoryID) AS TotalMentions FROM Category c
	Left JOIN BlogPost b on b.CategoryID = c.CategoryID
	GROUP BY c.CategoryID, c.CategoryName
	ORDER BY TotalMentions desc
END


GO


