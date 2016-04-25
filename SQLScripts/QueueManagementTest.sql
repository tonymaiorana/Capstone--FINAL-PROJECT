DECLARE @ContentQueueID int
DECLARE @Allow bit

SET @ContentQueueID = 2
SET @Allow = 1


DECLARE @NewBlogPostID int
DECLARE @OrigBlogID int
SET @NewBlogPostID = (SELECT NewBlogPostID FROM ContentQueue c WHERE @ContentQueueID = c.ContentQueueID)
SET @OrigBlogID = (SELECT OrigBlogPostID FROM ContentQueue c WHERE @ContentQueueID = c.ContentQueueID)

IF @Allow = 1
	BEGIN
	DECLARE @QueueAction int
	SET @QueueAction = (SELECT QueueActionID FROM ContentQueue  WHERE @ContentQueueID = ContentQueueID);
	IF @QueueAction != 2
		BEGIN
			UPDATE BlogPost SET 
				IsDeleted = CASE WHEN (@QueueAction) = 3 THEN 1 ELSE 0 END,
				IsApproved = 1
			WHERE BlogPostID = @NewBlogPostID
		END
	ELSE
		BEGIN
		UPDATE BlogPost 
			SET 
				IsDeleted = 0 ,
				IsApproved = 1,
				[Title] = copy.Title,
				[CategoryID] = copy.CategoryID ,
				[TextBody] = copy.TextBody ,
				[PostTime] = copy.PostTime,
				[ExpirationTime] = copy.ExpirationTime,
				[UpdateTime] = copy.UpdateTime,
				[CreationTime] = copy.CreationTime,
				[UserID] = copy.UserID
			FROM (SELECT Title, TextBody, PostTime, ExpirationTime, UpdateTime, CreationTime, UserID, CategoryID 
					FROM BlogPost 
					WHERE BlogPostID = @NewBlogPostID
				) copy
		WHERE BlogPostID = @OrigBlogID

		IF @QueueAction = 2
			BEGIN
				DELETE FROM PostTag WHERE BlogPostID = @OrigBlogID
				DELETE FROM BlogImage Where BlogPostID = @OrigBlogID
				UPDATE PostTag SET BlogPostID = @OrigBlogID WHERE BlogPostID = @NewBlogPostID
				UPDATE BlogImage SET BlogPostID = @OrigBlogID WHERE BlogPostID = @NewBlogPostID
			END
		END
	END
ELSE
	BEGIN
		DELETE FROM PostTag WHERE BlogPostID = @NewBlogPostID
		DELETE FROM BlogImage Where BlogPostID = @NewBlogPostID
	END



DELETE FROM ContentQueue Where ContentQueueID = @ContentQueueID

IF @QueueAction != 1
	BEGIN
		DELETE FROM BlogPost Where BlogPostID = @NewBlogPostID 
		DELETE FROM PostTag WHERE BlogPostID = @NewBlogPostID
		DELETE FROM BlogImage Where BlogPostID = @NewBlogPostID
	END
