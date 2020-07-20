///////////////////////////////////////////////////////////////////////////
// Loader
$(document).ready(function () {
    setTimeout(() => {
        $(".loading").fadeToggle(200);
    }, 500); // hide delay when page load


    (function ($) {
        $.getUrlParam = function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]);
            return null;
        }
    })(jQuery);

    var str = $.getUrlParam('r');

    if (str == null) {
        $('#home').addClass('active')
    } else if (str.search('discover') != -1) {
        $('#discover').addClass('active')
    } else if (str.search('sidebar') != -1) {
        $('#sidebar').addClass('active')
    } else if (str.search('search') != -1) {
        $('#search').addClass('active')
    }


});
///////////////////////////////////////////////////////////////////////////
// Go Back
$(".goBack").click(function () {
    window.history.back();
});

///////////////////////////////////////////////////////////////////////////
// Owl Carousel
$('.cardOverlayCarousel').owlCarousel({
    margin: 20,
    loop: true,
    stagePadding: 40,
    items: 1,
    dots: false,
});
$('.postCarousel').owlCarousel({
    margin: 20,
    loop: true,
    stagePadding: 40,
    items: 2,
    dots: false,
});
$('.basicCarousel').owlCarousel({
    margin: 20,
    loop: true,
    stagePadding: 40,
    items: 1,
    dots: false,
});
$('.sliderCarousel').owlCarousel({
    loop: false,
    items: 1,
    dots: true,
});
$('.buttonCarousel').owlCarousel({
    margin: 20,
    loop: true,
    stagePadding: 40,
    items: 4,
    dots: false,
})

///////////////////////////////////////////////////////////////////////////
// Sidebar 
$(".toggleSidebar").click(function () {
    $(".sidebarWrapper").fadeToggle(200);
    if ($("body").hasClass("sidebarActive")) {
        $("body").removeClass("sidebarActive");
    } else {
        $("body").addClass("sidebarActive");
    }
    if ($(".sidebarWrapper .sidebar").hasClass("is-active")) {
        $(".sidebarWrapper .sidebar").removeClass("is-active");
        $(".sidebarWrapper .sidebar").addClass("is-passive");
    } else {
        $(".sidebarWrapper .sidebar").addClass("is-active");
    }
});

$(".toggleSearchbox").click(function () {
    $(".searchBox").fadeToggle(200);

});
