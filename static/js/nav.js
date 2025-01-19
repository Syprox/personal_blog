const tags = document.getElementById('tags');
const navShowHideBtn = document.getElementById('navShowHideBtn');

tags.addEventListener('click', tagsShowHide);

function tagsShowHide() {
    tags.classList.toggle('open');
}

navShowHideBtn.addEventListener('click', showHideNav);

function showHideNav() {
    const nav = document.querySelector("nav");
    if (nav.style.display == 'none') {
        nav.style.display = 'flex';
    }
    else {
        nav.style.display = 'none';
    }
}

//check the size of viewport and stop eventListener on tags button
function myFunction(x) {
    if (x.matches) { // If media query matches
        tags.removeEventListener('click', tagsShowHide);
    } else {
        tags.addEventListener('click', tagsShowHide);
    }
}

// Create a MediaQueryList object
var x = window.matchMedia("(max-width: 768px)")

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