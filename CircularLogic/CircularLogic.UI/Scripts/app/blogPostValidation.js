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
            "BlogPost.Image.Name": {
                
            },
            "BlogPost.Image.ImageData": {

            }

        },
        messages: {
            "BlogPost.Title": "Enter the title of your blog",
            Tag: {
                required: "Enter a tag to associate your post with",
                tag: "Please try entering a new tag...."
            },
            "BlogPost.Image.ImageData": "Please provide a link to an image",

            "BlogPost.Image.Name": "Please provide a name for the image"
        }
    });
});