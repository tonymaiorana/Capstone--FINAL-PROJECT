USE [CircularLogic]
GO
/****** Object:  StoredProcedure [dbo].[AddAStaticPage]    Script Date: 5/4/2016 9:34:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		William Poulson
-- Create date: 4/29/2016
-- Description:	Used for adding a new static page
-- =============================================
ALTER PROCEDURE [dbo].[AddAStaticPage] 
	-- Add the parameters for the stored procedure here
		@Title varchar(150), 
		@TextBody varchar(max),
		@UpdateTime datetime,
		@CreationTime datetime,
		@LinkName varchar(50),
		@StaticPageID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		INSERT INTO dbo.StaticPage (Title, TextBody, UpdateTime, CreationTime, LinkName)
	 VALUES(@Title, @TextBody, @UpdateTime, @CreationTime, @LinkName);
		SET @StaticPageID = SCOPE_IDENTITY();
END





