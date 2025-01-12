const greencorner = document.getElementById('greencorner');
const orangecorner = document.getElementById('orangecorner');
const violetcorner = document.getElementById('violetcorner');

greencorner.addEventListener('click', function () {
    document.documentElement.style.setProperty('--clr-link-base', 'hsl(96, 100%, 25%)')
});