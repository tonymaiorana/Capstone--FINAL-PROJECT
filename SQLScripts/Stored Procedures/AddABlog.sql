USE [CircularLogic]
GO

/****** Object:  StoredProcedure [dbo].[AddABlog]    Script Date: 4/26/2016 12:49:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Tony Maiorana
-- Create date: 4/22/2016
-- Description:	Insert a new blog
-- =============================================
CREATE PROCEDURE [dbo].[AddABlog] 
	-- Add the parameters for the stored procedure here
		@CategoryID int,
		@UserID varchar(128),
		@Title varchar(150), 
		@TextBody varchar(max),
		@UpdateTime datetime,
		@CreationTime datetime,
		@IsApproved bit,
		@BlogID int output

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO dbo.BlogPost (CategoryID, UserID, Title, TextBody, UpdateTime, CreationTime, IsApproved)
	 VALUES(@CategoryID, @UserID, @Title, @TextBody, @UpdateTime, @CreationTime, @IsApproved);
		SET @BlogID = SCOPE_IDENTITY();

	IF @IsApproved != 1
		BEGIN
			INSERT INTO dbo.ContentQueue (NewBlogPostID, QueueActionID)
				VALUES(@BlogID, 1)
		END
END



GO

