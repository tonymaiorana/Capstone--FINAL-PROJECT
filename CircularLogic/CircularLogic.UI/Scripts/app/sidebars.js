
/*Menu-toggle*/
$("#menu-toggle-left").click(function (e) {
    e.preventDefault();
    $("#wrapper").toggleClass("active-left");
});

$("#menu-toggle-right").click(function (e) {
    e.preventDefault();
    $("#wrapper").toggleClass("active-right");
});