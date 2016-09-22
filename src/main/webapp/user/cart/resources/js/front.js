if ($.cookie("theme_csspath")) {
    $('link#theme-stylesheet').attr("href", $.cookie("theme_csspath"));
}

$(function () {
    sliderHomepage();
    menuSliding();
    fullScreenContainer();
    utils();
});

/* -----------Slider homepage------------- */

function sliderHomepage() {
    if ($('#slider').length) {
	var owl = $("#slider");

	$("#slider").owlCarousel({
	    autoPlay: 3000,
	    items: 4, //10 items above 1000px browser width
	    itemsDesktopSmall: [900, 3], // betweem 900px and 601px
	    itemsTablet: [600, 3], //2 items between 600 and 0
	    itemsMobile: [500, 2] // itemsMobile disabled - inherit from itemsTablet option
	});
    }
}

/* ---------------Menu sliding--------------- */

function menuSliding() {
    $('.dropdown').on('show.bs.dropdown', function (e) {

	if ($(window).width() > 750) {
	    $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
	}
	else {
	    $(this).find('.dropdown-menu').first().stop(true, true).show();
	}
    });
    $('.dropdown').on('hide.bs.dropdown', function (e) {
	if ($(window).width() > 750) {
	    $(this).find('.dropdown-menu').first().stop(true, true).slideUp();
	}
	else {
	    $(this).find('.dropdown-menu').first().stop(true, true).hide();
	}
    });
}

/* -------------Full screen intro-------------- */

function fullScreenContainer() {
    var screenWidth = $(window).width() + "px";
    if ($(window).height() > 500) {
	var screenHeight = $(window).height() + "px";
    }
    else {
	var screenHeight = "500px";
    }
    $("#intro, #intro .item").css({
	width: screenWidth,
	height: screenHeight
    });
}
function utils() {

/* --------------tooltips------------- */

    $('[data-toggle="tooltip"]').tooltip();

/* ---------------click on the box activates the radio--------------- */

    $('#checkout').on('click', '.box.shipping-method, .box.payment-method', function (e) {
	var radio = $(this).find(':radio');
	radio.prop('checked', true);
    });

/* click on the box activates the link in it */

    $('.box.clickable').on('click', function (e) {

	window.location = $(this).find('a').attr('href');
    });
    
/* -------------external links in new window---------------- */

    $('.external').on('click', function (e) {

	e.preventDefault();
	window.open($(this).attr("href"));
    });

/* -----------animated scrolling-------------- */

    $('.scroll-to, .scroll-to-top').click(function (event) {

	var full_url = this.href;
	var parts = full_url.split("#");
	if (parts.length > 1) {

	    scrollTo(full_url);
	    event.preventDefault();
	}
    });
    function scrollTo(full_url) {
	var parts = full_url.split("#");
	var trgt = parts[1];
	var target_offset = $("#" + trgt).offset();
	var target_top = target_offset.top - 100;
	if (target_top < 0) {
	    target_top = 0;
	}

	$('html, body').animate({
	    scrollTop: target_top
	}, 1000);
    }
}
