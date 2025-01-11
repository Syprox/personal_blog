const theme_toggle = document.querySelector('#theme_toggle_btn');

theme_toggle.addEventListener('click', () => {
    document.body.classList.toggle('dark-theme');
    document.body.classList.toggle('light-theme');
    if (document.body.classList.contains('dark-theme')) {
        document.documentElement.style.setProperty('color-scheme', 'dark');
    } else {
        document.documentElement.style.setProperty('color-scheme', 'light');
    }
}); 