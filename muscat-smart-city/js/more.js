var More = (function($, name, window) {
	'use strict';
	var Instances = [];
	var MoreSlidePlugin = function() {
		this.update = function() {}
		this.init = function() {}
		this.register = function() {}
		this.destroy = function() {}
	}
	var MoreSlide = function(container, options) {
		this.container = $(container);
		this.container.addClass('more-container');
		this.container.addClass('more-stage').children();
		this.options = $.extend({}, MoreSlide.defaultOptions, options);
		this.registeredPlugins = this.options.plugins;
		this.Plugins = {};
		this.dom = $(document);
		this.win = $(window);
		this.allowChange = true;
		this.Objs = [];
		this.current = this.defaultSlide = 0;
		this.isMain = false;
		this.width = this.win.width();
		this.height = this.win.height();
		this.slidesContainer = this.parentSlidesContainer = [];
		this.processes = {};
		$.each(MoreSlide.Obj, $.proxy(function(c, worker) {
			this.Objs.push({
				type: worker.type,
				update: $.proxy(worker.update, this)
			});
		}, this));
		if ($.proxy(this.options.init, this)()) {
			this.processes.updateAll = true;
			this.processUpdate();
			delete this.processes['updateAll'];
			this.registerEvents();
			this.trigger('ready');
			this.setActive(this.defaultSlide);
			if (this.options.bindArrows) {
				this.registerNavigation();
			}
		}
	}
	MoreSlide.prototype.queueProcess = function(process) {
		this.processes[process] = true;
	}
	MoreSlide.prototype.locateSlide = function(elem) {
		for (var i = 0; i < this.activeStack.length; i++) {
			if (elem.is(this.activeStack[i])) {
				return i;
			}
		}
		return -1;
	}
	MoreSlide.Obj = [{
		type: ['items', 'all'],
		update: function() {
			var slides = this.container.find('.more-slide');
			var main = this.container.find('.more-slide[data-more-group-id]');
			for (var i = 0; i < slides.length; i++) {
				this.slidesContainer.push(slides.eq(i));
			}
			this.parentSlidesContainer = [];
			for (var p = 0; p < main.length; p++) {
				this.parentSlidesContainer.push(main.eq(p));
			}
		}
	}, {
		type: ['plugins'],
		update: function() {
			this.registeredPlugins = this.options.plugins;
			$.each(this.registeredPlugins, $.proxy(function(key, value) {
				var obj = MoreSlide.plugins;
				this.Plugins[key[0].toLowerCase() + key.slice(1)] = new obj[value](this);
			}, this));
		}
	}, {
		type: ['items', 'all'],
		update: function() {
			this.slidesContainer.map($.proxy(function(slide) {
				this.trigger('item', {
					'item': slide
				});
			}, this));
		}
	}];
	MoreSlide.prototype.processUpdate = function() {
		var c = 0;
		var t = this.Objs.length;
		var type = $.proxy(function(i) {
			return this[i]
		}, this.processes);
		while (c < t) {
			if (this.processes.updateAll || $.grep(this.Objs[c].type, type).length) {
				this.Objs[c].update();
			}
			c++;
		}
		$.each(this.Plugins, function(key, value) {
			value.update(this.processes);
		});
		this.processes = {};
	}
	MoreSlide.plugins = {};
	MoreSlide.defaultOptions = {
		drag: true,
		wheel: false,
		speed: 1000,
		AutoPlayTime: 2000,
		throttle: true,
		randomize: false,
		dots: true,
		nested: false,
		bindArrows: false,
		label: false,
		paginationAtBottom: false,
		defaultAnim: 'slide',
		cycle: true,
		plugins: {
			Pagination: 'MorePagination',
			Effects: 'MoreEffect',
			Hash: 'MoreHash',
			Loader: 'MoreLoader',
			Touch: 'MoreTouch'
		},
		before: function() {},
		after: function() {},
		going: function() {},
		init: function() {
			return true;
		},
		done: function() {},
		onResize: function() {},
		buttons: {
			BACKWARD: function() {
				this.isMainMode(true);
				this.prev();
			},
			FORWARD: function() {
				this.isMainMode(true);
				this.next();
			},
			UP: function() {
				if (this.isMain) {
					this.current = this.container.find('[data-more-group-id]').index(this.activeSlide);
				}
				this.isMainMode(false);
				this.prev();
			},
			DOWN: function() {
				if (this.isMain) {
					this.current = this.container.find('[data-more-group-id]').index(this.activeSlide);
				}
				this.isMainMode(false);
				this.next();
			}
		}
	};
	MoreSlide.prototype.handlerInstance = function(callback, event) {
		return $.proxy(function(e) {
			if (e.relatedTarget !== this) {
				callback.apply(this, [].slice.call(arguments, 1));
			}
		}, this);
	}
	MoreSlide.prototype.registerEvents = function() {
		var Events = {
			to: this.to,
			add: this.add,
			remove: this.remove,
			next: this.next,
			prev: this.prev,
			'to.abs': this.toAbs
		};
		$.each(Events, $.proxy(function(event, callback) {
			this.container.on('more.action.' + event, this.handlerInstance(callback, 'more.' + event));
		}, this));
	}
	MoreSlide.prototype.isMainMode = function(mode) {
		this.isMain = mode;
		return this;
	}
	MoreSlide.prototype.add = function(content, pos) {
		var $content = $(content);
		$content.addClass('more-slide');
		if (typeof pos == "undefined") {
			pos = this.slides.length;
		}
		if (pos <= 0) {
			pos = 1;
		} else if (pos >= this.slides.length) {
			pos = this.slides.length;
		}
		if (0 == (pos - 1)) {
			this.container.children('.more-slide').eq(pos - 1).before($content);
		} else {
			this.container.children('.more-slide').eq(pos - 1).after($content);
		}
		this.refresh();
	}
	MoreSlide.prototype.remove = function(pos) {
		if (pos <= 0 || pos >= this.slides.length) {
			return false;
		}
		this.container.children('.more-slide').eq(pos - 1).remove();
		this.queueProcess("all");
		this.processUpdate();
		if (this.index == (pos - 1)) {
			this.refresh();
			this.setActive(0);
		}
	}
	MoreSlide.prototype.refresh = function() {
		this.index = $(this.activeSlide).index();
		this.queueProcess("all");
		this.processUpdate();
	}
	MoreSlide.prototype.setBound = function(offset) {
		var len = this.isMain ? this.parentSlidesContainer : this.slidesContainer;
		if (offset > len.length - 1) {
			offset = 0;
		} else if (offset < 0) {
			offset = len.length - 1;
		}
		return offset;
	}
	MoreSlide.prototype.setActive = function(offset) {
		offset = this.setBound(offset);
		this.trigger('change');
		if (!this.allowChange) {
			return false;
		}
		this.slidesContainer.map($.proxy(this.clear, this));
		this.trigger('inactive', {
			'slide': this.activeSlide,
			'index': this.current
		});
		this.current = offset;
		this.activeSlide = this.isMain ? this.parentSlidesContainer[offset] : this.slidesContainer[offset];
		if (this.activeSlide.parent('.more-stage').length) {
			this.lastParent = this.container.find('[data-more-group-id]').index(this.activeSlide);
		}
		this.activeSlide.removeClass('active').addClass('active');
		this.trigger('active', {
			'slide': this.activeSlide,
			'index': this.current
		});
		this.options.after(this.activeSlide);
	}
	MoreSlide.prototype.removeClasses = function(cls) {
		$(this).removeClass(function(index, css) {
			return (css.match(cls) || []).join(' ');
		});
	}
	MoreSlide.prototype.clear = function(slide) {
		['before(-\\d+)?', 'after(-\\d+)?', 'active'].map(this.removeClasses, slide);
	}
	MoreSlide.prototype.step = function(offset) {
		var current = this.isMain ? this.lastParent : this.current;
		offset = current + offset;
		this.setActive(offset);
	}
	MoreSlide.prototype.next = function() {
		this.trigger('next');
		this.step(1);
	}
	MoreSlide.prototype.prev = function() {
		this.trigger('prev');
		this.step(-1);
	}
	MoreSlide.prototype.to = function(offset) {
		this.isMain = false;
		this.allowChange = true;
		var type_;
		this.trigger('to', {
			'path': type_,
			nextElem: offset
		});
		this.setActive(offset);
	}
	MoreSlide.prototype.registerNavigation = function() {
		var NamedButtons = {
			39: 'FORWARD',
			37: 'BACKWARD',
			40: 'DOWN',
			38: 'UP'
		};
		this.dom.on('keydown', $.proxy(function(e) {
			var mapButton = NamedButtons[e.which];
			if (mapButton) {
				$.proxy(this.options.buttons[mapButton], this)();
			}
		}, this));
	}
	MoreSlide.prototype.trigger = function(name, data) {
		var m = this.isMain ? this.parentSlidesContainer.length : this.slidesContainer.length;
		var status = {
			slides: {
				slides: this.isMain ? this.parentSlidesContainer : this.slidesContainer,
				length: m,
				active: this.activeSlide,
				index: this.current,
				container: this.container
			}
		};
		var event = $.Event(['More', name].join('.').toLowerCase(), $.extend({
			relatedTarget: this
		}, status, data));
		return this.container.triggerHandler(event);
	}
	$.fn.More = function(options) {
		return this.each(function() {
			if (!$(this).data('More')) {
				var instance = new MoreSlide(this, options);
				Instances.push($(this));
				$(this).data('More', instance);
			}
		});
	}
	$.fn.More.Constructor = MoreSlide;
	var MoreEffect = function(More) {
		this.core = More;
		this.throttle = this.core.options.throttle;
		this.isPlaying = false;
		this.events = {
			'more.to': $.proxy(function(e) {
				if (e.nextElem == this.core.index)
					return false;
				this.register(e, e.path, e.nextElem, this.core.slidesContainer);
			}, this),
			'more.to.abs': $.proxy(function(e) {
				if (e.nextElem == this.core.index)
					return false;
				this.register(e, e.path, e.nextElem, this.core.slidesContainer);
			}, this),
			'more.next': $.proxy(function(e) {
				var d = e.slides.index;
				var m = this.core.isMain ? this.core.parentSlidesContainer.length : this.core.slidesContainer.length;
				if (this.core.isMain) {
					d = this.core.lastParent;
				}
				var i = d + 1;
				var dir = 'next';
				if (i > m - 1) {
					i = 0;
					dir = 'prev';
				}
				this.register(e, dir, i, this.core.isMain ? this.core.parentSlidesContainer : this.core.slidesContainer);
			}, this),
			'more.prev': $.proxy(function(e) {
				var d = e.slides.index;
				if (this.core.isMain) {
					d = this.core.lastParent;
				}
				var i = d - 1;
				var m = this.core.isMain ? this.core.parentSlidesContainer.length : this.core.slidesContainer.length;
				var dir = 'prev';
				if (i < 0) {
					i = m - 1;
					dir = 'next';
				}
				this.register(e, dir, i, this.core.isMain ? this.core.parentSlidesContainer : this.core.slidesContainer);
			}, this)
		};
		this.core.container.on(this.events);
	}
	MoreEffect.prototype = new MoreSlidePlugin();
	MoreEffect.dir = ['horizontal', 'vertical']
	MoreEffect.transitions = ['slide', 'cube', 'newspaper', 'push', 'slider'];
	var effects = {
		slide: {
			"horizontal": {
				"next": "slide-ltr",
				"prev": "slide-rtl"
			},
			"vertical": {
				"next": "slide-ttb",
				"prev": "slide-btt"
			}
		},
		cube: {
			"horizontal": {
				"next": "cube-ltr",
				"prev": "cube-rtl"
			},
			"vertical": {
				"next": "cube-ttb",
				"prev": "cube-btt"
			}
		},
		fade: {
			"horizontal": {
				"next": "fade-ltr",
				"prev": "fade-rtl"
			},
			"vertical": {
				"next": "fade",
				"prev": "fade"
			}
		},
		newspaper: {
			"horizontal": {
				"next": "newspaper",
				"prev": "newspaper"
			},
			"vertical": {
				"next": "newspaper",
				"prev": "newspaper"
			}
		},
		push: {
			"horizontal": {
				"next": "push-right",
				"prev": "push-left"
			},
			"vertical": {
				"next": "push-top",
				"prev": "push-bottom"
			}
		},
		slider: {
			"horizontal": {
				"next": "slider-right",
				"prev": "slider-left"
			},
			"vertical": {
				"next": "slider-bottom",
				"prev": "slider-top"
			}
		}
	};
	var animations = {
		'slide-ltr': {
			effect: 'slide',
			_in: 'more-slide-from-right',
			_out: 'more-slide-to-left'
		},
		'slide-rtl': {
			effect: 'slide',
			_in: 'more-slide-from-left',
			_out: 'more-slide-to-right'
		},
		'slide-ttb': {
			effect: 'slide',
			_in: 'more-slide-from-bottom',
			_out: 'more-slide-to-top'
		},
		'slide-btt': {
			effect: 'slide',
			_in: 'more-slide-from-top',
			_out: 'more-slide-to-bottom'
		},
		'cube-ltr': {
			effect: 'cube',
			_in: 'more-cube-rotate-left-in',
			_out: 'more-cube-rotate-left-out'
		},
		'cube-rtl': {
			effect: 'cube',
			_in: 'more-cube-rotate-right-in',
			_out: 'more-cube-rotate-right-out'
		},
		'cube-ttb': {
			effect: 'cube',
			_in: 'more-cube-rotate-top-in',
			_out: 'more-cube-rotate-top-out'
		},
		'cube-btt': {
			effect: 'cube',
			_in: 'more-cube-rotate-bottom-in',
			_out: 'more-cube-rotate-bottom-out'
		},
		'newspaper': {
			effect: 'newspaper',
			_in: 'more-cube-newspaper-in',
			_out: 'more-cube-newspaper-out'
		},
		'push-right': {
			effect: 'push',
			_in: 'more-slide-from-right',
			_out: 'more-push-from-right'
		},
		'push-left': {
			effect: 'push',
			_in: 'more-slide-from-left',
			_out: 'more-push-from-left'
		},
		'push-top': {
			effect: 'push',
			_in: 'more-slide-from-top',
			_out: 'more-push-from-top'
		},
		'push-bottom': {
			effect: 'push',
			_in: 'more-slide-from-bottom',
			_out: 'more-push-from-bottom'
		},
		'slider-right': {
			effect: 'slider',
			_in: 'more-slider-right-in',
			_out: 'more-slider-right-out'
		},
		'slider-left': {
			effect: 'slider',
			_in: 'more-slider-left-in',
			_out: 'more-slider-left-out'
		},
		'slider-top': {
			effect: 'slider',
			_in: 'more-slider-top-in',
			_out: 'more-slider-top-out'
		},
		'slider-bottom': {
			effect: 'slider',
			_in: 'more-slider-bottom-in',
			_out: 'more-slider-bottom-out'
		},
		'fade-right': {
			effect: 'fade',
			_in: 'more-slide-to-right',
			_out: 'more-fade'
		},
		'fade-left': {
			effect: 'fade',
			_in: 'more-slide-to-left',
			_out: 'more-fade'
		}
	};
	MoreEffect.prototype.register = function(e, t, offset, container) {
		if (!this.core.isMain) {
			container = this.core.slidesContainer;
		} else {
			container = this.core.parentSlidesContainer;
		}
		switch (t) {
			case 'next':
				var d = e.slides.index;
				if (this.isPlaying) {
					this.core.allowChange = false;
					return false;
				}
				if (this.core.isMain) {
					d = this.core.lastParent;
				}
				if (d <= container.length - 1) {
					this.core.allowChange = true;
					var outSlide = e.slides.active;
					var inSlide = container[offset];
					this.doEffect(inSlide, outSlide, 'next');
				}
				break;
			case 'prev':
				if (this.isPlaying) {
					this.core.allowChange = false;
					return false;
				}
				if (e.slides.index > 0) {
					this.core.allowChange = true;
					var outSlide = e.slides.active;
					var inSlide = container[offset];
					this.doEffect(inSlide, outSlide, 'prev');
				}
				break;
		}
	}
	MoreEffect.prototype.doEffect = function(inSlide, outSlide, easeType) {
		if (!this.core.options.randomize) {
			var dir = inSlide.data('more-slide-direction') || 'horizontal';
			var transition = inSlide.data('more-slide-transition') || this.core.options.defaultAnim;
			if ($.inArray(dir, MoreEffect.dir) === -1) {
				dir = 'vertical';
			}
			if ($.inArray(transition, MoreEffect.transitions) === -1) {
				transition = this.core.options.defaultAnim;
			}
		} else {
			var transition_index = Math.floor(Math.random() * MoreEffect.transitions.length - 1) + 1;
			transition = MoreEffect.transitions[transition_index];
			var dir_index = Math.floor(Math.random() * MoreEffect.dir.length - 1) + 1;
			var dir = MoreEffect.dir[dir_index];
		}
		transition = effects[transition];
		var animation = animations[transition[dir][easeType]];
		var inClass = animation._in;
		var outClass = animation._out;
		var animEnd = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
		this.isPlaying = true;
		inSlide.off(animEnd);
		outSlide.off(animEnd);
		inSlide.on(animEnd, function(e) {
			$(e.target).removeClass(inClass + ' more-transition-in');
		});
		outSlide.on(animEnd, $.proxy(function(e) {
			$(e.target).removeClass(outClass + ' more-transition-out');
			this.core.trigger('effect.complete', {
				slide: this.core.activeSlide
			});
			setTimeout($.proxy(function() {
				this.isPlaying = false;
				this.core.container.find('> .more-slide').removeClass('inactive');
				this.core.container.find('> .more-slide').not(this.core.activeSlide).addClass('inactive');
			}, this));
		}, this));
		outSlide.addClass('more-transition-out ' + outClass);
		inSlide.addClass('more-transition-in ' + inClass);
	}
	$.fn.More.Constructor.plugins.MoreEffect = MoreEffect;
	var MorePagination = function(More) {
		this.core = More;
		this.update();
		this.initEvents();
	}
	MorePagination.prototype = new MoreSlidePlugin();
	MorePagination.prototype.update = function() {
		var obj = this.core.container;
		this.labels = [];
		var css = {},
			label;
		if (obj.find('> .more_pagination').length) {
			obj.find('> .more_pagination').remove();
		}
		for (var i = 0, total = this.core.slidesContainer.length; i < total; i++) {
			this.labels.push(this.core.slidesContainer[i].attr('data-more-label'));
		}
		var pagination = $('<div class="more_pagination"></div>');
		for (var i = 0, total = this.core.slidesContainer.length; i < total; i++) {
			label = '';
			if (this.core.options.label && typeof this.labels[i] != "undefined") {
				label = this.labels[i];
			}
			pagination.append('<div class="more_dot"><span>' + label + '</span></div>');
		}
		obj.append(pagination);
		if (this.core.options.paginationAtBottom) {
			pagination.addClass('more_pagination_bottom');
			css['margin-left'] = '-' + pagination.outerWidth(true) / 2 + 'px';
		} else {
			css['margin-top'] = '-' + pagination.height() / 2 + 'px';
		}
		pagination.css(css);
		pagination.find('.more_dot').eq(this.core.index).addClass('active');
		this.pagination = pagination;
	}
	MorePagination.prototype.initEvents = function() {
		this.events = {
			'more.active': $.proxy(function(e) {
				this.pagination.find('.more_dot').removeClass('active');
				this.pagination.find('.more_dot').eq(this.core.index).addClass('active');
			}, this)
		};
		this.core.container.on(this.events);
		this.core.container.on('click', '.more_pagination .more_dot', $.proxy(function(e) {
			var obj = $(e.currentTarget);
			var c = obj.index();
			this.core.to(c);
			return false;
		}, this));
	}
	$.fn.More.Constructor.plugins.MorePagination = MorePagination;
	var MoreHash = function(More) {
		this.core = More;
		this.register();
	}
	MoreHash.prototype = new MoreSlidePlugin();
	MoreHash.prototype.register = function() {
		this.update();
		this.core.win.on('hashchange', $.proxy(function() {
			return false;
			this.setCurrentItem($.proxy(function(current) {
				var index = current.index();
				this.core.to(index);
			}, this));
		}, this));
		this.core.container.on('more.ready', $.proxy(function() {
			this.setCurrentItem(function(current) {
				if (current) {
					this.core.activeStack = this.core.slidesContainer;
					this.core.defaultSlide = this.core.locateSlide(current);
				}
			});
		}, this));
		if (this.core.Plugins['effect']) {
			this.core.container.on('more.effect.complete', $.proxy(function(e) {
				var item = e.slide;
				window.location.hash = item.attr('id');
			}, this));
		} else {
			this.core.container.on('more.active', $.proxy(function(e) {
				var item = e.slide;
				window.location.hash = item.attr('id');
			}, this));
		}
	}
	MoreHash.prototype.setCurrentItem = function(callback) {
		if (window.location.hash !== '') {
			var itemID = window.location.hash;
			var current = this.core.container.find(itemID);
			$.proxy(callback, this)(current);
		}
	}
	$.fn.More.Constructor.plugins.MoreHash = MoreHash;
	var MoreLoader = function(More) {
		this.core = More;
		this.init();
		this.register();
	}
	MoreLoader.prototype = new MoreSlidePlugin();
	MoreLoader.prototype.register = function() {
		var loaderProp = 'width';
		this.core.container.on('more.active', $.proxy(function(e) {
			var css = {};
			var percent = Math.ceil((e.index + 1) / e.slides.length * 100);
			if (loaderProp == 'width') {
				css['width'] = percent + '%';
			} else {
				css['height'] = percent + '%';
			}
			this.progress.css(css);
		}, this));
	}
	MoreLoader.prototype.init = function() {
		this.elem = $('<div class="more_loader"></div>');
		this.progress = $('<div class="more_progress"></div>');
		this.elem.append(this.progress);
		this.core.container.append(this.elem);
	}
	$.fn.More.Constructor.plugins.MoreLoader = MoreLoader;
	var MoreWheel = function(More) {
		this.isScrolling = false;
		this.core = More;
		this.core.container.on('mousewheel DOMMouseScroll MozMousePixelScroll', $.proxy(this.handle, this));
		if (this.core.Plugins['effect']) {
			this.core.container.on('more.effect.complete', $.proxy(function(e) {
				this.isScrolling = false;
			}, this));
		} else {
			this.core.container.on('more.active', $.proxy(function(e) {
				this.isScrolling = false;
			}, this));
		}
	}
	MoreWheel.prototype = new MoreSlidePlugin();
	MoreWheel.prototype.handle = function(event) {
		event.preventDefault();
		event.stopPropagation();
		var e, wheel, target, delta;
		e = window.event || event;
		wheel = (e.wheelDelta || -e.detail || e.originalEvent.detail);
		var delta = Math.max(-1, Math.min(1, wheel));
		target = $(e.target);
		if ((!this.isScrolling || !this.core.Plugins['effect'].isPlaying) && Math.abs(wheel) > 5) {
			var scrollNow = true;
			var $action;
			if (scrollNow) {
				if (isChrome()) {
					delta = Math.floor(wheel / 5);
				}
				if (e.originalEvent && e.originalEvent.detail) {
					if (delta > 0) {
						$action = 'next';
					} else {
						$action = 'prev';
					}
				} else if (delta < 0) {
					$action = 'next';
				} else {
					$action = 'prev';
				}
				if ($action == 'next') {
					if (this.core.options.cycle) {
						this.core.next();
					} else {
						if (this.core.slides[this.core.index + 1]) {
							this.isScrolling = true;
							this.core.next();
						} else {
							this.isScrolling = false;
						}
					}
				} else if ($action == 'prev') {
					if (this.core.options.cycle) {
						this.core.prev();
					} else {
						if (this.core.slides[this.core.index - 1]) {
							this.isScrolling = true;
							this.core.prev();
						} else {
							this.isScrolling = false;
						}
					}
				}
			} else {
				this.isScrolling = false;
			}
		}
	}
	$.fn.More.Constructor.plugins.MoreWheel = MoreWheel;
	var MoreTouch = function(More) {
		this.pos = {};
		this.delta = {};
		this.core = More;
		$.each(MoreEffect.dir, $.proxy(function(key, value) {
			var axis = this.locateAxis(value);
			this.core.container.on('touchstart touchmove touchend', $.proxy(this.eventTarget, this, axis));
		}, this));
	}
	MoreTouch.prototype = new MoreSlidePlugin();
	MoreTouch.events = {
		drag: {
			start: 'mousedown touchstart',
			move: 'mousemove touchmove',
			end: 'mouseup touchend'
		}
	};
	MoreTouch.prototype.locateAxis = function(type) {
		if (type == "horizontal") {
			return 'X';
		} else {
			return 'Y';
		}
	}
	MoreTouch.prototype.eventTarget = function(axis, e) {
		var event = e.originalEvent || window.event || e;
		var type = e.type;
		switch (type) {
			case 'mousedown':
			case 'touchstart':
				this.dragStart(event, axis);
				break;
			case 'mousemove':
			case 'touchmove':
				this.dragMove(event, axis);
				break;
			case 'mouseup':
			case 'touchend':
				this.dragEnd(event, axis);
				break;
		}
		e.preventDefault();
		e.stopPropagation();
	}
	MoreTouch.prototype.dragStart = function(e, axis) {
		if (e.touches.length == 1) {
			this.pos[axis] = e.touches[0]['page' + axis];
			this.delta[axis] = 0;
		}
	}
	MoreTouch.prototype.dragMove = function(e, axis) {
		if (e.touches.length == 1) {
			e.preventDefault();
			this.delta[axis] = e.touches[0]['page' + axis] - this.pos[axis];
		}
	}
	MoreTouch.prototype.dragEnd = function(e, axis) {
		Math.abs(this.delta[axis]) > 50 && (this.delta[axis] > 0 ? this.core.prev() : this.core.next());
	}
	$.fn.More.Constructor.plugins.MoreTouch = MoreTouch;
	var isChrome = function() {
		var isChromium = window.chrome,
			vendorName = window.navigator.vendor;
		if (isChromium !== null && vendorName === "Google Inc.") {
			return true;
		}
		return false;
	};
	var MoreTimeline = function(More) {
		this.core = More;
		this.init();
	}
	MoreTimeline.prototype = new MoreSlidePlugin();
	MoreTimeline.prototype.init = function() {
		this.build();
	}
	MoreTimeline.prototype.build = function() {
		var $slider = $('<div class="more-timeline-slider"></div>');
		var $ordered_list = $('<ol></ol>');
		$.each(this.core.slides, $.proxy(function(key) {
			var $elem = this.core.container.children('.more-slide').eq(key);
			$ordered_list.append('<li><a href="#">' + $elem.attr('data-more-label') + '</a></li>');
		}, this));
		$slider.append($ordered_list);
		this.core.container.append($slider);
	}
	$.fn.More.Constructor.plugins.MoreTimeline = MoreTimeline;
	var MoreAutoPlay = function(More) {
		this.handle = null;
		this.core = More;
		this.time = this.core.options.AutoPlayTime;
		this.init();
	}
	MoreAutoPlay.prototype = new MoreSlidePlugin();
	MoreAutoPlay.prototype.init = function() {
		this.handle = setInterval($.proxy(function() {
			if ((this.slides.length - 1) == this.index) {
				this.to(0);
				return;
			}
			this.next();
		}, this.core), this.time);
	}
	MoreAutoPlay.prototype.destroy = function() {
		clearInterval(this.handle);
		this.handle = null;
	}
	$.fn.More.Constructor.plugins.MoreAutoPlay = MoreAutoPlay;
	var MoreLazyLoad = function() {
		console.log('lazy load start');
	}
	MoreLazyLoad.prototype = new MoreSlidePlugin();
	$.fn.More.Constructor.plugins.MoreLazyLoad = MoreLazyLoad;
	return {
		get: function(selector) {
			return $(selector).data('More');
		},
		getAll: function() {
			return Instances;
		},
		del: function() {},
		destroyAll: function() {},
		update: function(options) {
			for (var i = 0; i < More.count(); i++) {}
		},
		count: function() {
			return Instances.length;
		}
	};
}(jQuery, 'More', window));