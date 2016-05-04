$(document).ready(function () {
    $('#addStaticPage')
        .validate({
            rules: {
                Title: {
                    required: true
                },
                LinkName: {
                    required: true
                },
                HtmlContent: {
                    required: true
                },
                "Image.Name": {
                    required: true
                },
                "Image.ImageData": {
                    required: true
                }
            },
            messages: {
                Title: "Enter the title of your page",
                LinkName: "Enter text for the dropdown menu link",
                HtmlContent: "Enter the content for the page",
                "Image.ImageData": "Please provide a link to an image",
                "Image.Name": "Please provide a name for the image"
        }
    });
});