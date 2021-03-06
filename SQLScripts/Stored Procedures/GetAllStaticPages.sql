USE [CircularLogic]
GO
/****** Object:  StoredProcedure [dbo].[GetAllStaticPages]    Script Date: 5/1/2016 10:06:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author, Hannah>
-- Create date: <5/1/2016>
-- Description:	<Getting all static pages>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllStaticPages] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 SELECT        StaticPage.*
FROM            StaticPage
WHERE IsDeleted = 0
END
