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
-- Author:		William Poulson
-- Create date: 4/29/2016
-- Description:	Used for adding a new static page
-- =============================================
CREATE PROCEDURE AddAStaticPage 
	-- Add the parameters for the stored procedure here
		@Title varchar(150), 
		@TextBody varchar(max),
		@UpdateTime datetime,
		@CreationTime datetime,
		@StaticPageID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		INSERT INTO dbo.StaticPage (Title, TextBody, UpdateTime, CreationTime)
	 VALUES(@Title, @TextBody, @UpdateTime, @CreationTime);
		SET @StaticPageID = SCOPE_IDENTITY();
END
GO
