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
-- Description:	updates image associated with a static page
-- =============================================
CREATE PROCEDURE UpdateStaticPageImage 
	-- Add the parameters for the stored procedure here
	@StaticPageID int,
	@Name varchar(50),
	@ImageData varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [Image]
		SET ImageData = @ImageData, Name = @Name
			WHERE ImageID = (SELECT si.ImageID FROM StaticImage si WHERE si.StaticPageID = @StaticPageID)
END
GO
