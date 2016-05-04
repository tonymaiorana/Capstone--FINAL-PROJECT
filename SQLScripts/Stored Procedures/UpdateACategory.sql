USE [CircularLogic]
GO

/****** Object:  StoredProcedure [dbo].[UpdateACategory]    Script Date: 5/4/2016 8:00:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author, TJ>
-- Create date: <Create 5/4/2016>
-- Description:	<Update a category for admin>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateACategory]
	-- Add the parameters for the stored procedure here
	@Color nchar(6),
	@CategoryID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Category SET Color = @Color WHERE CategoryID = @CategoryID;

END

GO
