function ButtonWithWarning(thisObj, actionURL, warningMessage, snarlTitle, snarlMessage, dataObj) {

    bootbox.confirm(warningMessage, function(result) {
        if (result === true) {
            $.ajax({
                    type: "POST",
                    url: actionURL,
                    data: dataObj,
                    async: true
                }).done(function() {
                    Snarl.addNotification({
                        title: snarlTitle,
                        text: snarlMessage
                    });
                    thisObj.closest('tr').remove();
                })
                .fail(function(jqXhr, status, err) {
                    alert((status + ' - ' + err));
                });
        };
    });
}

function setCheckBoxes(buttonID, checkBoxClass) {
    $(buttonID).on('click', function () {
        var allowedBlogPosts = [];
        var deniedBlogPosts = [];
        var rowsChanged = [];
        $('input.' + checkBoxClass + '.allow').each(function () {
            if (this.checked) {
                allowedBlogPosts.push($(this).closest('tr').find('input.hidden').val());
                rowsChanged.push($(this).closest('tr'));
            };
        });
        $('input.' + checkBoxClass + '.deny').each(function () {
            if (this.checked) {
                deniedBlogPosts.push($(this).closest('tr').find('input.hidden').val());
                rowsChanged.push($(this).closest('tr'));
            };
        });
        var AllowDeny = {
            allowedBP: allowedBlogPosts,
            deniedBP: deniedBlogPosts
        };
        $.post('/api/adminAPI', AllowDeny)
            .done(function () {
                Snarl.addNotification({
                    title: 'Success',
                    text: 'The your queue has been successfully updated'
                });
                rowsChanged.forEach(function (item) {
                    item.remove();
                });
            })
            .fail(function (jqXhr, status, err) {
                alert((status + ' - ' + err));
            });
    });
};

$(document).ready(function () {

    setCheckBoxes('#newQueue', 'newCB');
    setCheckBoxes('#editQueue', 'editCB');
    setCheckBoxes('#deleteQueue', 'deleteCB');

    $('.catDelete').click(function () {
        var OtherPost = {
            id: this.id,
            type: 'DELETE'
        };
        ButtonWithWarning($(this), "/api/categoryAPI" , "Are you sure you would like to delete this category?", 'Category Removed', 'The category has been successfully removed!', OtherPost);
    });
    
    $('.catDelete').click(function () {
        var OtherPost = {
            id: this.id,
            type: 'DELETE'
        };
        ButtonWithWarning($(this), "/api/categoryAPI" , "Are you sure you would like to delete this category?", 'Category Removed', 'The category has been successfully removed!', OtherPost);
    });

    $('.deleteBlog').click(function() {
        
        ButtonWithWarning($(this), "/api/AdminAPI/DeleteBlogPost/"+this.id,
            "Are you sure you would like to delete this blog?",
            "Blog Removed", "The Blog has been successfully removed", null);
    });


    $('.deleteBlogReq').click(function () {
        ButtonWithWarning($(this), "/api/AdminAPI/RequestDeleteBlogPost/" + this.id,
            "Are you sure you would like to delete this blog?",
            "Blog Removed", "The Blog has been successfully removed", null);
    });

    $('.deleteQueuedAction').click(function () {
        ButtonWithWarning($(this), "/api/AdminAPI/DeleteQueuedAction/" + this.id,
            "Are you sure you would like to delete this action?",
            "Action Removed", "The Action has been successfully removed", null);
    });

    $('input.newCB').on('change', function () {
        $(this).closest('tr').find('input.newCB').not(this).prop('checked', false);
    });

    $('input.editCB').on('change', function () {
        $(this).closest('tr').find('input.editCB').not(this).prop('checked', false);
    });

    $('input.deleteCB').on('change', function () {
        $(this).closest('tr').find('input.deleteCB').not(this).prop('checked', false);
    });
});