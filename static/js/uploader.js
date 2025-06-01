if (document.querySelector('.youtube')) {

    var youtube = document.querySelectorAll(".youtube");

    for (var i = 0; i < youtube.length; i++) {

        var source = "https://img.youtube.com/vi/" + youtube[i].dataset.embed + "/maxresdefault.jpg";

        var image = new Image();
        image.src = source;
        image.addEventListener("load", function () {
            youtube[i].appendChild(image);
        }(i));

        youtube[i].addEventListener("click", function () {

            var iframe = document.createElement("iframe");

            iframe.setAttribute("frameborder", "0");
            iframe.setAttribute("title", "YouTube video player");
            iframe.setAttribute("allow", "accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share");
            iframe.setAttribute("referrerpolicy", "strict-origin-when-cross-origin");
            iframe.setAttribute("allowfullscreen", "");
            iframe.setAttribute("src", "https://www.youtube.com/embed/" + this.dataset.embed);

            this.innerHTML = "";
            this.appendChild(iframe);
        });
    };

};