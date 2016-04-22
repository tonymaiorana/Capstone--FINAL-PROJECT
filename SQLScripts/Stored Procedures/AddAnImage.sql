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
-- Author:		<Author,,Tony Maiorana>
-- Create date: <Create Date,,4/22/2016>
-- Description:	<Description,,Add An Image>
-- =============================================
CREATE PROCEDURE AddAnImage 
	-- Add the parameters for the stored procedure here
	@Name varchar(50),
	@ImageData varchar(max),
	@ImageID int output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO dbo.Image (Name, ImageData) VALUES(@Name, @ImageData)
	SET @ImageID = SCOPE_IDENTITY();
END
GO
