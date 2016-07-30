var $j = jQuery.noConflict();

// call jRespond and add breakpoints
var jRes = jRespond([
	{
		label: 'handheld',
		enter: 0,
		exit: 767
	},{
		label: 'tablet',
		enter: 768,
		exit: 1024
	},{
		label: 'laptop',
		enter: 1025,
		exit: 1199
	},{
		label: 'desktop',
		enter: 1200,
		exit: 10000
	}
]);

$j(document).ready(function () {
	"use strict"

	initFlexSlider();
	circleHover();
	// animateScroll();
	//MoreSlider();
	initElementsAnimation();
	menuSelect();
	//menuShowHide();
	
	var modelwindow = $j('[data-remodal-id=modal]').remodal();
	$j("#redirect").click(function() {
		window.location.replace("http://bit.ly/29sJoOo");
	});
	$j("#cancel").click(function() {
		Cookies.set('muscat', 'done');
	});
	if ( Cookies.get('muscat') != 'done')
		modelwindow.open();

	/*$j("#nav").mmenu({
	   "navbars": [
		  {
			 "position": "top"
		  },
		  {
			 "position": "bottom",
			 "content": [
				"<a class='fa fa-envelope' href='#/'></a>",
				"<a class='fa fa-twitter' href='#/'></a>",
				"<a class='fa fa-facebook' href='#/'></a>"
			 ]
		  }
	   ]
	});*/
	
	
//	$j(function() {
		var $menu = $j('#nav'),
			$html = $j('html, body');

		/*$menu.mmenu({
			// Options
			dragOpen: {
				open: true
			},
			onClick: {
				preventDefault: true	
			},
		},{
			// Configurations
			classNames: {
				selected: "active"
			},
			offCanvas: {
				pageSelector: "#page"
			}
		});*/

		
		
//	The menu
	if ( $j.fn.mmenu )
	{
		var API = $j('#nav')
			.mmenu({
				extensions		: [ 'widescreen', 'theme-white', 'effect-menu-slide', 'pagedim-black' ],
				dividers		: {
					fixed 			: false
				},
				dragOpen: {
					open: true
				},
				onClick: {
					preventDefault: true	
				},
				/*navbar 			: {
					title			: 'mmenu'
				},*/
				navbars			: [
					{
						position	: 'bottom',
						content 	: ['<div>Designed by <a href="http://www.uniquecreativity.net">Unique Creativity<a></div>']
					}
				],

			}, {
				classNames: {
					selected: "active"
				},
				offCanvas: {
					pageSelector: "#page"
				}

			})
			.data( 'mmenu' );

		$j('#menu-toggle')
			.on( 'click',
				function( e )
				{
					e.preventDefault();
					if ( $html.hasClass( 'mm-opened' ) )
					{
						API.close();
						$j(this).toggleClass("is-active");
					}
					else
					{
						API.open();
						$j(this).toggleClass("is-active");
					}
				}
			);	
	}

		var $anchor = false;
		$menu.find( 'li > a' ).on(
			'click',
			function( e )
			{
				$anchor = $j(this);
			}
		);

		function menuDesktop() {
			var api = $menu.data( 'mmenu' );
			api.bind( 'closed',
				function()
				{
					if ( $anchor )
					{
						var href = $anchor.attr( 'href' );
						$anchor = false;

						//	if the clicked link is linked to an anchor, scroll the page to that anchor 
						if ( href.slice( 0, 1 ) == '#' )
						{
							window.location.hash = href;
						}
					}
				}
			);
		}

		function menuMobile() {
			var api = $menu.data( 'mmenu' );
			api.bind( 'closed',
				function()
				{
					if ( $anchor )
					{
						var href = $anchor.attr( 'href' );
						$anchor = false;

						//	if the clicked link is linked to an anchor, scroll the page to that anchor 
						if ( href.slice( 0, 1 ) == '#' )
						{
							$html.animate({
								scrollTop: $j( href ).offset().top-85
							});	
						}
					}
				}
			);
		}

	// register enter and exit functions for a single breakpoint
	jRes.addFunc({
		breakpoint: ['desktop','laptop'],
		enter: function() {
			menuDesktop();
			$j('#more').addClass('more more-container more-stage');
			$j('#more section').addClass('more-slide');
			MoreSlider();
			initVerticalAlignment();
			innerCirclePosition();
			//colHeight();
		},
		exit: function() {
			$j('#more').removeClass('more more-container more-stage');
			$j('#more section').removeClass('more-slide');
			exitVerticalAlignment();
		}
	});
	jRes.addFunc({
		breakpoint: ['tablet','handheld'],
		enter: function() {
			$j('#more').removeClass('more more-container more-stage');
			$j('#more section').removeClass('more-slide');
			menuMobile();
			goToHash();
		},
		exit: function() {
		}
	});

	//	});
});

$j(window).load(function(){
	"use strict"

	jRes.addFunc({
		breakpoint: ['desktop','laptop'],
		enter: function() {
			initVerticalAlignment();
			colHeight();
		},
		exit: function() {
			exitVerticalAlignment();
			exitColHeight();
		}
	});
	
});

$j(window).resize(function() {
	"use strict"

	/*jRes.addFunc({
		breakpoint: ['desktop','laptop'],
		enter: function() {
			initVerticalAlignment();
		},
		exit: function() {
		}
	});*/
});

function MoreSlider() {
	"use strict"

	var v = $j('#more').More({
		plugins: {
			Effect: 'MoreEffect',
			Hash: 'MoreHash',
			wheel: 'MoreWheel',
			Loader: 'MoreLoader',
			// Pagination: 'MorePagination',
			Touch: 'MoreTouch',
		},
		defaultAnim: 'cube',
		bindArrows: true,
		randomize: false,
		label: false,
		after: function() {},
		init: function() {
			//if (this.width < 1280) {
				$j('#more').addClass('more more-container more-stage');
				$j('#more section').addClass('more-slide');
				// $j('.mainWrapper').css('height', 'auto').css('overflow', 'visible');
				//return false;
			//}
			return true;
		}
	});

	$j(window).on('hashchange', $j.proxy(function() {
		v.data('More').Plugins["hash"].setCurrentItem($j.proxy(function(current) {
			var index = current.index();
			v.data('More').isMainMode(true).to(index);

			menuSelect();
		}, this));

		//menuShowHide();
	}, this));

	$j(".main-menu a").click(function() {
		v.data('More').Plugins["hash"].setCurrentItem($j.proxy(function() {
			removeAnimation();

		}, this));
	});

	v.on("more.effect.complete", function() {
		v.on("more.active", function() {
			return false;
		});
		removeAnimation();
	});

	$j("#next-slide").click(function() {
		v.data("More").isMainMode(false).next();
		return false;
	});

	$j("#prev-slide").click(function() {
		v.data("More").isMainMode(false).prev();
		return false;
	});

}
function removeAnimation() {
	$j(".more-slide").find(".one-half").removeClass("element-from-left-on");
	$j(".more-slide").find(".one-half").removeClass("element-from-right-on");
}

function menuSelect() {
	$j(".main-menu li").removeClass("mm-selected");
	$j(".main-menu li[data-more-index='"+window.location.hash+"']").addClass("mm-selected");
}
/*function menuShowHide() {
	var windowHash = window.location.hash;
	if(windowHash === '#slider' || windowHash === '#overview') {
		$j('#menu li').css('display', 'none');
		$j('#menu li#logo').css('display', 'inline-block');
	} else {
		$j('#menu li').css('display', 'inline-block');
	}

}*/
function initFlexSlider() {
	"use strict"

	$j('.flexslider').flexslider({
		animationLoop: true,
		controlNav: false,
		useCSS: false,
		pauseOnAction: true,
		pauseOnHover: true,
		slideshow: true,
		animation: 'slides',
		prevText: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40" width="40"><g id="prev-slider"><use xlink:href="#slide-arrow-left-circle" fill="white"/><use xlink:href="#slide-arrow-left" fill="transparent"/></g></svg>',
		nextText: '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 40 40" width="40"><g id="next-slider"><use xlink:href="#slide-arrow-right-circle" fill="white"/><use xlink:href="#slide-arrow-right" fill="transparent"/></g></svg>',
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

	$j('#overview .overview-icon').hover(
		function circleMouseEnter() {
			var circle = $j(this).attr('Id');
			$j("#inner-circle").addClass(circle + " hover");
		},
		function circleMouseExit() {
			var circle = $j(this).attr('Id');
			$j("#inner-circle").removeClass(circle + " hover");
		});
}

/*function animateScroll() {
	"use strict";

	$j(document).on('click', '#back-to-top', function (e) {
		e.preventDefault();

		$j('body,html').animate({ scrollTop: 0 }, $j(window).scrollTop() / 3, 'swing');
	});
	$j(document).on('click', '.animate-scroll', function (e) {
		e.preventDefault();
		var elementClass = $j(this).attr('href');
		$j('body,html').animate({ scrollTop: $j(elementClass).offset().top }, 2000, 'swing');
	});
}*/

/*
**  Init Element Animations
*/
$j(window).on('hashchange', function(){
 initElementsAnimation();
});
function initElementsAnimation(){
	"use strict";

	if($j(".element-from-left").length){
		$j('.element-from-left').each(function(){
			var $this = $j(this);
			if (window.location.hash !== '') {
				var itemID = window.location.hash;
				// var parent = $j(this).parent(itemID);
				// if($j(itemID).is('.inactive')){
					// $j(itemID).find($this).removeClass('element-from-left-on');
				// } else {
						// $j(itemID).find('.one-half').removeClass('element-from-left-on');
					// if ($this.parent('.more-slide').attr('id') == window.location.hash) {
						$j(itemID).find($this).addClass('element-from-left-on');
					// }
				// }
			}
		});
	}

	if($j(".element-from-right").length){
		$j('.element-from-right').each(function(){
			var $this = $j(this);
			if (window.location.hash !== '') {
				var itemID = window.location.hash;
				// var parent = $j(this).parent(itemID);
				// if($j(itemID).is('.inactive')){
					// $j(itemID).find($this).removeClass('element-from-right-on');
				// } else {
					$j(itemID).find($this).addClass('element-from-right-on');
				// }
			}
		});
	}


	/*if($j(".element-from-fade").length){
		$j('.element-from-fade').each(function(){
			var $this = $j(this);

			$this.appear(function() {
				$this.addClass('element-from-fade-on');
			},{accX: 0, accY: -200});
		});
	}

	if($j(".element-from-left").length){
		$j('.element-from-left').each(function(){
			var $this = $j(this);

			$this.appear(function() {
				$this.addClass('element-from-left-on');
			},{accX: 0, accY: -200});
		});
	}

	if($j(".element-from-right").length){
		$j('.element-from-right').each(function(){
			var $this = $j(this);

			$this.appear(function() {
				$this.addClass('element-from-right-on');
			},{accX: 0, accY: -200});
		});
	}

	if($j(".element-from-top").length){
		$j('.element-from-top').each(function(){
			var $this = $j(this);

			$this.appear(function() {
				$this.addClass('element-from-top-on');
			},{accX: 0, accY: -200});
		});
	}

	if($j(".element-from-bottom").length){
		$j('.element-from-bottom').each(function(){
			var $this = $j(this);

			$this.appear(function() {
				$this.addClass('element-from-bottom-on');
			},{accX: 0, accY: -200});
		});
	}

	if($j(".element-transform").length){
		$j('.element-transform').each(function(){
			var $this = $j(this);

			$this.appear(function() {
				$this.addClass('element-transform-on');
			},{accX: 0, accY: -200});
		});
	}*/
}

/*
**  Init Vertical Alignment
*/
function initVerticalAlignment(){
	$j('.content-section .middle-container, #home .middle-container, #outer-circle, #navigation-arrows').each(function(){
		var $this = $j(this);
		$this.css({
			position:'absolute',
			left: ($j(window).width() - $this.outerWidth())/2,
			top: ($j(window).height() - $this.outerHeight())/1.75
		});
	});

}

function exitVerticalAlignment(){
	$j('.content-section .middle-container, #home .middle-container, #outer-circle, #navigation-arrows').each(function(){
		var $this = $j(this);
		$this.css({
			position:'',
			left: '',
			top: ''
		});
	});
}

function innerCirclePosition() {
	$j('#inner-circle').each(function(){
		var $this = $j(this);
		$this.css({
			position:'absolute',
			left: ($j('#outer-circle').width() - $this.outerWidth())/2,
			top: ($j('#outer-circle').height() - $this.outerHeight())/2
		});
	});

}
function colHeight() {
	$j(".content-section").each(function() {
		var sectionHeight = $j(this).find(".middle-container").outerHeight();
		var textCol = $j(this).find(".element-from-left");
		var figCol = $j(this).find(".element-from-right");
		var textColMargin = sectionHeight - $j(textCol).outerHeight();
		var figColMargin = sectionHeight - $j(figCol).outerHeight();
		
		$j(textCol).css({marginTop: textColMargin/2-15, marginBottom: textColMargin/2})
		$j(figCol).css({marginTop: figColMargin/2-15, marginBottom: figColMargin/2})
	});
}

function exitColHeight() {
	$j(".content-section").each(function() {
		var textCol = $j(this).find(".element-from-left");
		var figCol = $j(this).find(".element-from-right");
		
		$j(textCol).css({margin: "0"})
		$j(figCol).css({margin: "0"})
	});
}

function goToHash(){
	"use strict";

	$j("#logo, .overview-icon a").click(function(e) {
		e.preventDefault();
		
		var href = $j(this).attr( 'href' );
		$j('body,html').animate({
			scrollTop: $j( href ).offset().top-85
		});	
	});
}
