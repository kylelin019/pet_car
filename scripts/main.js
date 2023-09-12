//first
$(document).ready(function () {
    $(".owl-carousel.first").owlCarousel({
        items: 1,
        loop: true,
        nav: true,
        dots: true,
        autoplay: true,
        autoplayTimeout: 2000,
        smartSpeed: 1500,
        autoplayHoverPause: true
    });
});
//second
const responsive = {
    0: {
        items: 1
    },
    320: {
        items: 1
    },
    560: {
        items: 2
    },
    960: {
        items: 3
    }
}

$(document).ready(function () {

    $nav = $('.nav');
    $toggleCollapse = $('.toggle-collapse');

    /** click event on toggle menu */
    $toggleCollapse.click(function () {
        $nav.toggleClass('collapse');
    })

    // owl-crousel for blog
    $(".owl-carousel.blog-post").owlCarousel({
        loop: true, // 循環播放
        autoplay: true, // 自動播放
        autoplayTimeout: 8000, // 自動播放間隔時間（毫秒）
        autoplayHoverPause: true, // 懸停時暫停自動播放
        rewind: true,
        dots: false,
        nav: true,
        navText: [$('.owl-navigation .owl-nav-prev'), $('.owl-navigation .owl-nav-next')],
        responsive: responsive
    });


    // click to scroll top
    $('.move-up span').click(function () {
        $('html, body').animate({
            scrollTop: 0
        }, 1000);
    })

    // AOS Instance
    AOS.init();

});

//ixed - header
window.addEventListener('scroll', function () {
    const header = document.querySelector('header');
    const headerHeight = header.clientHeight;

    if (window.scrollY > headerHeight) {
        header.classList.add('fixed-header');
    } else {
        header.classList.remove('fixed-header');
    }
});

