//jQuery.ajaxSetup({ async: false });
var Category = {
    Name: "",
    Color: ""
};
var pIc;
function setTextColor(picker) {
    $('#colorPreview').css('background-color', '#' + picker.toString());
    //document.getElementById('#colorPreview').style.backgroundColor = '#' + picker.toString();
    Category.Color = picker.toString();
    pIc = picker;
}

$(document).ready(function () {
    $('#addCatBtn').click(function () {
        var catName = $('#catName').val();
        Category.Name = catName;
        var OtherPost = {
            id: 0,
            type: 'ADD',
            Category: Category
        };
        $.ajax({
            type:'POST',
            url: '/api/categoryAPI',
            data: OtherPost,
            async: true
        })
            //$.post('/api/categoryAPI', OtherPost)
                .done(function () {
                    //jQuery.ajaxSetup({ async: true });
                    $('#loadCatModal').click(function () {
                        $('#catName').val("");
                        $('#addCatModalHolder').empty();
                    });
                })
                .success(function () {
                    Snarl.addNotification({
                        title: 'Category Added',
                        text: 'The category ' + catName + 'has been successfully added'
                    });
                })
                .fail(function (jqXhr, status, err) {
                    alert((status + ' - ' + err));
                });
    });
});
