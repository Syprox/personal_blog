const tags = document.getElementById('tags');
const tags_items = tags.querySelector('.tags_items a');
const navShowHideBtn = document.getElementById('navShowHideBtn');
const nav = document.querySelector("nav");
const bg = document.getElementById("menu_bg");
const show_search_btn = document.getElementById("show_search_btn");
const search_form = document.getElementById("search_form");

tags.addEventListener('click', tagsShowHide);

function tagsShowHide() {
    if (tags.classList.contains('open')) {
        tags.classList.toggle('open');
    } else {
        tags.classList.toggle('open');
    }
}

function searchShowHide() {
    if (search_form.classList.contains('show')) {
        hideSearchForm();
    }
    else {
        showSearchForm();
    }
}

function showSearchForm() {
    closeMobilNav();
    bg.className = 'visible';
    search_form.className = 'show';

}

function hideSearchForm() {

    bg.className = 'hide';

    search_form.className = '';

}

navShowHideBtn.addEventListener('click', showHideNav);

function showHideNav() {
    if (nav.classList.contains('close')) {
        openMobileNav();
    } else {
        closeMobilNav();
    }
}

function openMobileNav() {
    hideSearchForm();
    bg.className = 'visible';
    nav.className = 'open';
    bg.addEventListener('click', closeMobilNav);
    disableScroll();
}

function closeMobilNav() {
    nav.className = 'close';
    bg.removeEventListener('click', closeMobilNav);
    enableScroll();
    bg.className = 'hide';
}

function show_search_btn_activate(s) {
    if (s.matches) {
        show_search_btn.addEventListener('click', searchShowHide);
    } else {
        show_search_btn.removeEventListener('click', searchShowHide);
    }
}
var s = window.matchMedia("(max-width: 480px)");
show_search_btn_activate(s);
s.addEventListener("change", function () {
    show_search_btn_activate(s);
});

//check the size of viewport and stop eventListener on tags button
function myFunction(x) {
    if (x.matches) { // If media query matches
        tags.removeEventListener('click', tagsShowHide);
        tags.classList.add('close');

    } else {
        tags.addEventListener('click', tagsShowHide);
        tags.classList.remove('close');
        if (nav.classList.contains('open')) {
            closeMobilNav();
        }
    }
}

// Create a MediaQueryList object
var x = window.matchMedia("(max-width: 768px)");

// Call listener function at run time
myFunction(x);

// Attach listener function on state changes
x.addEventListener("change", function () {
    myFunction(x);
});

/* вимикає анімацію під час зміни розміру вікна */
let resizeTimer;
window.addEventListener("resize", () => {
    document.body.classList.add("resize-animation-stopper");
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(() => {
        document.body.classList.remove("resize-animation-stopper");
    }, 400);
});

// left: 37, up: 38, right: 39, down: 40,
// spacebar: 32, pageup: 33, pagedown: 34, end: 35, home: 36
var keys = { 37: 1, 38: 1, 39: 1, 40: 1 };

function preventDefault(e) {
    e.preventDefault();
}

function preventDefaultForScrollKeys(e) {
    if (keys[e.keyCode]) {
        preventDefault(e);
        return false;
    }
}

// modern Chrome requires { passive: false } when adding event
var supportsPassive = false;
try {
    window.addEventListener("test", null, Object.defineProperty({}, "passive", {
        get: function () { supportsPassive = true; }
    }));
} catch (e) { }

var wheelOpt = supportsPassive ? { passive: false } : false;
var wheelEvent = "onwheel " in document.createElement("div") ? "wheel " : "mousewheel";

// call this to Disable
function disableScroll() {
    window.addEventListener("DOMMouseScroll", preventDefault, false); // older FF
    window.addEventListener(wheelEvent, preventDefault, wheelOpt); // modern desktop
    window.addEventListener("touchmove", preventDefault, wheelOpt); // mobile
    window.addEventListener("keydown", preventDefaultForScrollKeys, false);
}

// call this to Enable
function enableScroll() {
    window.removeEventListener("DOMMouseScroll", preventDefault, false);
    window.removeEventListener(wheelEvent, preventDefault, wheelOpt);
    window.removeEventListener("touchmove", preventDefault, wheelOpt);
    window.removeEventListener("keydown", preventDefaultForScrollKeys, false);
}
