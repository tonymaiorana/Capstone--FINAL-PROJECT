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
-- Description:	Grabs a static page by id passed
-- =============================================
CREATE PROCEDURE GetStaticPageByStaticPageID
	-- Add the parameters for the stored procedure here
	@StaticPageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM StaticPage AS sp
	WHERE (@StaticPageID = sp.StaticPageID)
END
GO
