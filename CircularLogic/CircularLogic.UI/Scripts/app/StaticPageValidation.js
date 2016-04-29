$(document).ready(function () {
    $('#AddStaticPage')
        .validate({
            rules: {
                Title: {
                    required: true
                },
                HtmlContent: {
                    required: true
                },
            messages: {
                Title: "Enter the title of your page",
                HtmlContent: "Enter the content for the page"
            }
        }
    });
});