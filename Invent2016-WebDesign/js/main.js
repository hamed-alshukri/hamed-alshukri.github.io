var $j = jQuery.noConflict();

$j(document).ready(function () {
    "use strict"

    initFlexSlider();
    circleHover();
    animateScroll();
})

function initFlexSlider() {
    "use strict";
    $j('.flexslider').flexslider({
        animationLoop: true,
        controlNav: false,
        useCSS: false,
        pauseOnAction: true,
        pauseOnHover: true,
        slideshow: true,
        animation: 'slides',
        prevText: "<img src='img/arrow-left.png' alt='Previous Slide' />",
        nextText: "<img src='img/arrow-right.png' alt='Next Slide' />",
        animationSpeed: 600,
        slideshowSpeed: 8000,
    });

    $j('.flex-direction-nav a').click(function (e) {
        e.preventDefault();
        e.stopImmediatePropagation();
        e.stopPropagation();
    });
}

function circleHover() {
    "use strict"
    var circle = "";

    $j('#overview-container .overview-icon').hover(
        function circleMouseEnter() {
            var circle = $j(this).attr('Id');
            $j("#inner-circle").addClass(circle + " hover");
            $j("#inner-circle img").attr('src', "img/icon-oman-hover.png");
        },
        function circleMouseExit() {
            var circle = $j(this).attr('Id');
            $j("#inner-circle").removeClass(circle + " hover");
            $j("#inner-circle img").attr('src', "img/icon-oman.png");
        });
}

function animateScroll() {
    "use strict";

    $j(document).on('click', '#back-to-top', function (e) {
        e.preventDefault();

        $j('body,html').animate({ scrollTop: 0 }, $j(window).scrollTop() / 3, 'swing');
    });
    $j(document).on('click', '.animate-scroll', function (e) {
        e.preventDefault();
        var elementClass = $j(this).attr('href');
        $j('body,html').animate({ scrollTop: $j(elementClass).offset().top }, 'slow', 'swing');
    });
}

