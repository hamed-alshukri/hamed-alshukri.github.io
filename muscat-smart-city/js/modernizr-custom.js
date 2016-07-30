/*! modernizr 3.3.1 (Custom Build) | MIT *
 * https://modernizr.com/download/?-backgroundsize-bgsizecover-borderradius-boxsizing-cssanimations-csspointerevents-csstransforms-csstransforms3d-csstransitions-fontface-inputtypes-mediaqueries-nthchild-rgba-svg-prefixed-setclasses !*/
!function(e,t,n){function r(e,t){return typeof e===t}function s(){var e,t,n,s,i,o,a;for(var d in x)if(x.hasOwnProperty(d)){if(e=[],t=x[d],t.name&&(e.push(t.name.toLowerCase()),t.options&&t.options.aliases&&t.options.aliases.length))for(n=0;n<t.options.aliases.length;n++)e.push(t.options.aliases[n].toLowerCase());for(s=r(t.fn,"function")?t.fn():t.fn,i=0;i<e.length;i++)o=e[i],a=o.split("."),1===a.length?Modernizr[a[0]]=s:(!Modernizr[a[0]]||Modernizr[a[0]]instanceof Boolean||(Modernizr[a[0]]=new Boolean(Modernizr[a[0]])),Modernizr[a[0]][a[1]]=s),y.push((s?"":"no-")+a.join("-"))}}function i(e){var t=w.className,n=Modernizr._config.classPrefix||"";if(C&&(t=t.baseVal),Modernizr._config.enableJSClass){var r=new RegExp("(^|\\s)"+n+"no-js(\\s|$)");t=t.replace(r,"$1"+n+"js$2")}Modernizr._config.enableClasses&&(t+=" "+n+e.join(" "+n),C?w.className.baseVal=t:w.className=t)}function o(e){return e.replace(/([a-z])-([a-z])/g,function(e,t,n){return t+n.toUpperCase()}).replace(/^-/,"")}function a(){return"function"!=typeof t.createElement?t.createElement(arguments[0]):C?t.createElementNS.call(t,"http://www.w3.org/2000/svg",arguments[0]):t.createElement.apply(t,arguments)}function d(e,t){return!!~(""+e).indexOf(t)}function l(e,t){return function(){return e.apply(t,arguments)}}function u(e,t,n){var s;for(var i in e)if(e[i]in t)return n===!1?e[i]:(s=t[e[i]],r(s,"function")?l(s,n||t):s);return!1}function f(){var e=t.body;return e||(e=a(C?"svg":"body"),e.fake=!0),e}function c(e,n,r,s){var i,o,d,l,u="modernizr",c=a("div"),p=f();if(parseInt(r,10))for(;r--;)d=a("div"),d.id=s?s[r]:u+(r+1),c.appendChild(d);return i=a("style"),i.type="text/css",i.id="s"+u,(p.fake?p:c).appendChild(i),p.appendChild(c),i.styleSheet?i.styleSheet.cssText=e:i.appendChild(t.createTextNode(e)),c.id=u,p.fake&&(p.style.background="",p.style.overflow="hidden",l=w.style.overflow,w.style.overflow="hidden",w.appendChild(p)),o=n(c,e),p.fake?(p.parentNode.removeChild(p),w.style.overflow=l,w.offsetHeight):c.parentNode.removeChild(c),!!o}function p(e){return e.replace(/([A-Z])/g,function(e,t){return"-"+t.toLowerCase()}).replace(/^ms-/,"-ms-")}function m(t,r){var s=t.length;if("CSS"in e&&"supports"in e.CSS){for(;s--;)if(e.CSS.supports(p(t[s]),r))return!0;return!1}if("CSSSupportsRule"in e){for(var i=[];s--;)i.push("("+p(t[s])+":"+r+")");return i=i.join(" or "),c("@supports ("+i+") { #modernizr { position: absolute; } }",function(e){return"absolute"==getComputedStyle(e,null).position})}return n}function g(e,t,s,i){function l(){f&&(delete q.style,delete q.modElem)}if(i=r(i,"undefined")?!1:i,!r(s,"undefined")){var u=m(e,s);if(!r(u,"undefined"))return u}for(var f,c,p,g,h,v=["modernizr","tspan","samp"];!q.style&&v.length;)f=!0,q.modElem=a(v.shift()),q.style=q.modElem.style;for(p=e.length,c=0;p>c;c++)if(g=e[c],h=q.style[g],d(g,"-")&&(g=o(g)),q.style[g]!==n){if(i||r(s,"undefined"))return l(),"pfx"==t?g:!0;try{q.style[g]=s}catch(y){}if(q.style[g]!=h)return l(),"pfx"==t?g:!0}return l(),!1}function h(e,t,n,s,i){var o=e.charAt(0).toUpperCase()+e.slice(1),a=(e+" "+N.join(o+" ")+o).split(" ");return r(t,"string")||r(t,"undefined")?g(a,t,s,i):(a=(e+" "+A.join(o+" ")+o).split(" "),u(a,t,n))}function v(e,t,r){return h(e,n,n,t,r)}var y=[],x=[],b={_version:"3.3.1",_config:{classPrefix:"",enableClasses:!0,enableJSClass:!0,usePrefixes:!0},_q:[],on:function(e,t){var n=this;setTimeout(function(){t(n[e])},0)},addTest:function(e,t,n){x.push({name:e,fn:t,options:n})},addAsyncTest:function(e){x.push({name:null,fn:e})}},Modernizr=function(){};Modernizr.prototype=b,Modernizr=new Modernizr,Modernizr.addTest("svg",!!t.createElementNS&&!!t.createElementNS("http://www.w3.org/2000/svg","svg").createSVGRect);var w=t.documentElement,C="svg"===w.nodeName.toLowerCase();Modernizr.addTest("csspointerevents",function(){var e=a("a").style;return e.cssText="pointer-events:auto","auto"===e.pointerEvents}),Modernizr.addTest("rgba",function(){var e=a("a").style;return e.cssText="background-color:rgba(150,255,150,.5)",(""+e.backgroundColor).indexOf("rgba")>-1});var S=a("input"),T="search tel url email datetime date month week time datetime-local number range color".split(" "),_={};Modernizr.inputtypes=function(e){for(var r,s,i,o=e.length,a="1)",d=0;o>d;d++)S.setAttribute("type",r=e[d]),i="text"!==S.type&&"style"in S,i&&(S.value=a,S.style.cssText="position:absolute;visibility:hidden;",/^range$/.test(r)&&S.style.WebkitAppearance!==n?(w.appendChild(S),s=t.defaultView,i=s.getComputedStyle&&"textfield"!==s.getComputedStyle(S,null).WebkitAppearance&&0!==S.offsetHeight,w.removeChild(S)):/^(search|tel)$/.test(r)||(i=/^(url|email)$/.test(r)?S.checkValidity&&S.checkValidity()===!1:S.value!=a)),_[e[d]]=!!i;return _}(T);var z="CSS"in e&&"supports"in e.CSS,k="supportsCSS"in e;Modernizr.addTest("supports",z||k);var E="Moz O ms Webkit",N=b._config.usePrefixes?E.split(" "):[];b._cssomPrefixes=N;var R=function(t){var r,s=prefixes.length,i=e.CSSRule;if("undefined"==typeof i)return n;if(!t)return!1;if(t=t.replace(/^@/,""),r=t.replace(/-/g,"_").toUpperCase()+"_RULE",r in i)return"@"+t;for(var o=0;s>o;o++){var a=prefixes[o],d=a.toUpperCase()+"_"+r;if(d in i)return"@-"+a.toLowerCase()+"-"+t}return!1};b.atRule=R;var A=b._config.usePrefixes?E.toLowerCase().split(" "):[];b._domPrefixes=A;var P=b.testStyles=c,O=function(){var e=navigator.userAgent,t=e.match(/applewebkit\/([0-9]+)/gi)&&parseFloat(RegExp.$1),n=e.match(/w(eb)?osbrowser/gi),r=e.match(/windows phone/gi)&&e.match(/iemobile\/([0-9])+/gi)&&parseFloat(RegExp.$1)>=9,s=533>t&&e.match(/android/gi);return n||s||r}();O?Modernizr.addTest("fontface",!1):P('@font-face {font-family:"font";src:url("https://")}',function(e,n){var r=t.getElementById("smodernizr"),s=r.sheet||r.styleSheet,i=s?s.cssRules&&s.cssRules[0]?s.cssRules[0].cssText:s.cssText||"":"",o=/src/i.test(i)&&0===i.indexOf(n.split(" ")[0]);Modernizr.addTest("fontface",o)}),P("#modernizr div {width:1px} #modernizr div:nth-child(2n) {width:2px;}",function(e){for(var t=e.getElementsByTagName("div"),n=!0,r=0;5>r;r++)n=n&&t[r].offsetWidth===r%2+1;Modernizr.addTest("nthchild",n)},5);var $=function(){var t=e.matchMedia||e.msMatchMedia;return t?function(e){var n=t(e);return n&&n.matches||!1}:function(t){var n=!1;return c("@media "+t+" { #modernizr { position: absolute; } }",function(t){n="absolute"==(e.getComputedStyle?e.getComputedStyle(t,null):t.currentStyle).position}),n}}();b.mq=$,Modernizr.addTest("mediaqueries",$("only all"));var j={elem:a("modernizr")};Modernizr._q.push(function(){delete j.elem});var q={style:j.elem.style};Modernizr._q.unshift(function(){delete q.style}),b.testAllProps=h;b.prefixed=function(e,t,n){return 0===e.indexOf("@")?R(e):(-1!=e.indexOf("-")&&(e=o(e)),t?h(e,t,n):h(e,"pfx"))};b.testAllProps=v,Modernizr.addTest("cssanimations",v("animationName","a",!0)),Modernizr.addTest("backgroundsize",v("backgroundSize","100%",!0)),Modernizr.addTest("bgsizecover",v("backgroundSize","cover")),Modernizr.addTest("borderradius",v("borderRadius","0px",!0)),Modernizr.addTest("boxsizing",v("boxSizing","border-box",!0)&&(t.documentMode===n||t.documentMode>7)),Modernizr.addTest("csstransforms",function(){return-1===navigator.userAgent.indexOf("Android 2.")&&v("transform","scale(1)",!0)}),Modernizr.addTest("csstransforms3d",function(){var e=!!v("perspective","1px",!0),t=Modernizr._config.usePrefixes;if(e&&(!t||"webkitPerspective"in w.style)){var n,r="#modernizr{width:0;height:0}";Modernizr.supports?n="@supports (perspective: 1px)":(n="@media (transform-3d)",t&&(n+=",(-webkit-transform-3d)")),n+="{#modernizr{width:7px;height:18px;margin:0;padding:0;border:0}}",P(r+n,function(t){e=7===t.offsetWidth&&18===t.offsetHeight})}return e}),Modernizr.addTest("csstransitions",v("transition","all",!0)),s(),i(y),delete b.addTest,delete b.addAsyncTest;for(var L=0;L<Modernizr._q.length;L++)Modernizr._q[L]();e.Modernizr=Modernizr}(window,document);