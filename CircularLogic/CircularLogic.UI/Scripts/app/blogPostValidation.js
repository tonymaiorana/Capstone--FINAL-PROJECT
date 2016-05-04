$(document).ready(function () {
    $('#createBlogPost').validate({
        rules: {
            "BlogPost.Title": {
                required: true
            },
            Tag: {
                required: true,
                tag: true
            },
            HtmlContent: {
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
            Tag: {
                required: "Enter a tag to associate your post with",
                tag: "Please try entering a new tag...."
            },
            HtmlContent: "Enter the content for the page",
            "BlogPost.Image.ImageData": "Please provide a link to an image",
            "BlogPost.Image.Name": "Please provide a name for the image"
        }
    });
});