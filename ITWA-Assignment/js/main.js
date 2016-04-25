var $j = jQuery.noConflict();
$j(document).ready(function() {
    "use strict";

    initFlexSlider();
    initToggle();
});

/*
**  Init flexslider for portfolio single
*/
function initFlexSlider() {
    "use strict";
    if ($j.isFunction($j.fn.flexslider)) {
        $j('.flexslider').flexslider({
            animationLoop: true,
            controlNav: false,
            useCSS: false,
            pauseOnAction: true,
            pauseOnHover: true,
            slideshow: true,
            animation: 'slides',
            prevText: "<i class='fa fa-chevron-circle-left'></i>",
            nextText: "<i class='fa fa-chevron-circle-right'></i>",
            animationSpeed: 600,
            slideshowSpeed: 8000,
        });

        $j('.flex-direction-nav a').click(function (e) {
            e.preventDefault();
            e.stopImmediatePropagation();
            e.stopPropagation();
        });
    }
}

/*
**  Init Toggle
*/
function initToggle() {
    "use strict";

    if ($j('.toggle-title').length) {
        $j(".toggle-title").click(function () {
            var parent = $j(this).parent('.toggle');
            if (parent.is(".toggle-active")) {
                parent.removeClass('toggle-active');
                $j(this).siblings('.toggle-content').slideUp("slow");
            } else {
                parent.addClass('toggle-active');
                $j(this).siblings('.toggle-content').slideDown("slow");

            }
        });
    }

}
