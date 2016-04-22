$(document).ready(function () {
    $('#createBlogPost').validate({
        rules: {
            Title: {
                required: true
            },
            Tag: {
                required: true,
                tag: true
            },
            IsApproved: {
                required: true
            },

            messages: {
                Title: "Enter the title of your blog",
                Tag: {
                    required: "Enter a tag to associate your post with",
                    tag: "Please try entering a new tag...."
                },
                IsApproved: "Your post must be approved first, before publishing"
            }
        }
    });
});