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
-- Description:	fetches the image associated with a static page
-- =============================================
CREATE PROCEDURE GetStaticImageByStaticPageID 
	-- Add the parameters for the stored procedure here
	@StaticPageID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT i.ImageData, i.ImageID, i.Name
	FROM [Image] AS i
	LEFT JOIN StaticImage AS si
	 ON si.ImageID = i.ImageID
	WHERE @StaticPageID = si.StaticPageID
END
GO
