const tags = document.getElementById('tags');

tags.addEventListener('click', tagsShowHide);

function tagsShowHide() {
    tags.classList.toggle('open');
}