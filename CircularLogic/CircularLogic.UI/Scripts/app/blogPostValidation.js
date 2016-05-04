$(document).ready(function () {
    $('#createBlogPost').validate({
        rules: {
            "BlogPost.Title": {
                required: true
            },
            "hiddenTagListA": {
                required: true
            },
            "BlogPost.HtmlContent": {
                required: true
            },
            "BlogPost.Image.Name": {
                required: true
            },
            "BlogPost.Image.ImageData": {
                required: true
            }

        },
        messages: {
            "BlogPost.Title": "Enter the title of your blog",
            "hiddenTagListA": "Enter a tag to associate your post with",
            "BlogPost.HtmlContent": "Enter the content for the page",
            "BlogPost.Image.ImageData": "Please provide a link to an image",
            "BlogPost.Image.Name": "Please provide a name for the image"
        }
    });
});