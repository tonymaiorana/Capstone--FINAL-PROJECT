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
-- Description:	updates content for static pages 
-- =============================================
CREATE PROCEDURE UpdateStaticPageContent
	-- Add the parameters for the stored procedure here
	@StaticPageID int,
	@Title varchar(150),
	@TextBody varchar(MAX),
	@UpdateTime datetime,
	@Name varchar(50),
	@ImageData varchar(max)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE StaticPage
	SET Title = @Title, TextBody = @TextBody, UpdateTime = @UpdateTime
		WHERE StaticPageID = @StaticPageID
			
END
GO
