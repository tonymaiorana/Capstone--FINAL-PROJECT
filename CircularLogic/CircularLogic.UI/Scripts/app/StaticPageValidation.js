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
                }
            },
            messages: {
                Title: "Enter the title of your page",
                LinkName: "Enter text for the dropdown menu link",
                HtmlContent: "Enter the content for the page"
        }
    });
});