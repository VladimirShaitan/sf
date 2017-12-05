$(document).ready(function () {



    $("body").append("<div class='backtotop-img'><div class='goToTop ttbox'></div></div>");
    $("body").append("<div id='goToTop' title='Top' class='goToTop ttbox-img'></div>");
    $("#goToTop").hide();

    $(".ttsearch_button").click(function () {
        $('.ttsearchtoggle').parent().toggleClass('active');
        $('.ttsearchtoggle').toggle('fast', function () {});
        $('.ttsearchtoggle .input-lg').attr('autofocus', 'autofocus').focus();
        $(".account-link-toggle").slideUp("slow");
        $(".header-cart-toggle").slideUp("slow");
    });

    $("#top-links a.dropdown-toggle").click(function () {
        $(".account-link-toggle").slideToggle("2000");
        if ($("#form-currency")[0]) {
            $(".currency-toggle").css('display', 'none');
        }
        if ($("#form-language")[0]) {
            $(".language-toggle").css('display', 'none');
        }
        $(".header-cart-toggle").slideUp("slow");
        $('.ttsearchtoggle').parent().removeClass("active");
        $('.ttsearchtoggle').hide('fast');

    });

    $("#cart button.dropdown-toggle").click(function () {
        $(".header-cart-toggle").slideToggle("2000");
        $(".account-link-toggle").slideUp("slow");
        $('.ttsearchtoggle').parent().removeClass("active");
        $('.ttsearchtoggle').hide('fast');
    });

    $("#form-currency button.dropdown-toggle").click(function () {
        $(".currency-toggle").slideToggle("2000");
        $(".language-toggle").slideUp("slow");

    });

    $("#form-language button.dropdown-toggle").click(function () {
        $(".language-toggle").slideToggle("2000");
        $(".currency-toggle").slideUp("fast");
    });


    $(".option-filter .list-group-items a").click(function () {
        $(this).toggleClass('collapsed').next('.list-group-item').slideToggle();
    });

    $("ul.breadcrumb li:nth-last-child(1) a").addClass('last-breadcrumb').removeAttr('href');

    $("#column-left .products-list .product-thumb, #column-right .products-list .product-thumb").unwrap();

    $("#content > h1, .account-wishlist #content > h2, .account-address #content > h2, .account-download #content > h2").first().addClass("page-title");

    $("#column-left .product-thumb .button-group .btn-cart").removeAttr('data-original-title');
    $(".common-home .small_product .product-thumb .button-group .btn-cart").removeAttr('data-original-title');
    $(".product-list .product-thumb .button-group .btn-cart").removeAttr('data-original-title');


    $('select.form-control').wrap("<div class='select-wrapper'></div>");
    $(".common-home .ttsmartblog, .common-home #ttcmstestimonial").wrapAll("<div class='product-small-view'><div class='container'></div></div>");
    $("#ttcmsgallery .ttgallary_img .tticon-zoom").attr("data-lightbox", "example-1");

    // Carousel Counter
    colsCarousel = $('#column-right, #column-left').length;
    if (colsCarousel == 2) {
        ci = 2;
    } else if (colsCarousel == 1) {
        ci = 3;
    } else {
        ci = 4;
    }
    $("#content .products-carousel").owlCarousel({
        items: ci,
        itemsDesktop: [1200, 4],
        itemsDesktopSmall: [991, 3],
        itemsTablet: [767, 2],
        itemsMobile: [480, 1],
        navigation: true,
        pagination: false
    });
    $(".customNavigation .next").click(function () {
        $(this).parent().parent().find(".products-carousel").trigger('owl.next');
    })
    $(".customNavigation .prev").click(function () {
        $(this).parent().parent().find(".products-carousel").trigger('owl.prev');
    })
    $(".products-list .customNavigation").addClass('owl-navigation');
    // product Carousel
    /* Go to Top JS START */
    $(function () {
        $(window).scroll(function () {
            if ($(this).scrollTop() > 150) {
                $('.goToTop').fadeIn();
            } else {
                $('.goToTop').fadeOut();
            }
        });

        // scroll body to 0px on click
        $('.goToTop').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 1000);
            return false;
        });
    });
    /* Go to Top JS END */


    /* Counter-js Start */
    $('.counter-title').counterUp({
        delay: 10,
        time: 1000
    });
    /* Counter-js End */
    /*--------Start  Tab-ttcmsgallery-js------------------------------*/
    $('.tabs .tab-links a').on('click', function (e) {
        var currentAttrValue = $(this).attr('href');

        // Show/Hide Tabs
        $('.tabs ' + currentAttrValue).show().siblings().hide();

        // Change/remove current tab to active
        $(this).parent('li').addClass('active').siblings().removeClass('active');
        e.preventDefault();
    });

    /* Slider Load Spinner */
    $(window).load(function () {
        $(".slideshow-panel .ttloading-bg").removeClass("ttloader");
    });

    var simplebar = new Nanobar();
    simplebar.go(100);



    /* Testimonial js Start */
    var testimonialblock = $("#tttestimonial-carousel");
    testimonialblock.owlCarousel({
        //autoPlay : true,
        items: 1, //10 items above 1000px browser width
        itemsDesktop: [1200, 1],
        itemsDesktopSmall: [991, 1],
        itemsTablet: [767, 1],
        itemsMobile: [480, 1],
        navigation: true,
        pagination: false
    });
    $(".test_prev").click(function () {
        testimonialblock.trigger('owl.next');
    });
    $(".test_next").click(function () {
        testimonialblock.trigger('owl.prev');
    });
    /* Testimonial js over... */


    /* Homepage Parallax CMS Gallary js Start*/
    var ttcmsparallex = $("#ttcmsparallex-carousel");
    ttcmsparallex.owlCarousel({
        autoPlay: true,
        items: 1, //10 items above 1000px browser width
        itemsDesktop: [1200, 1],
        itemsDesktopSmall: [991, 1],
        itemsTablet: [767, 1],
        itemsMobile: [480, 1]
    });
    /* Homepage Parallax CMS Gallary js End*/
$('.owl-carousel').owlCarousel({ 
    loop:true,
    margin:10,
    nav:true,
    responsive:{
        0:{
            items:1
        },
        600:{
            items:1
        },
        1000:{
            items:1
        },
        1920:{
            items: 1
        }
        
    }
})
    /*   blog  js start */
    var ttblog = $("#ttsmartblog-carousel");
    ttblog.owlCarousel({
        //autoPlay : true,
        items: 1, //10 items above 1000px browser width
        itemsDesktop: [1200, 1],
        itemsDesktopSmall: [991, 1],
        itemsTablet: [767, 1],
        itemsMobile: [480, 1],
        pagination: false
    });
    // Custom Navigation Events
    $(".blog_next").click(function () {
        ttblog.trigger('owl.next');
    })
    $(".blog_prev").click(function () {
        ttblog.trigger('owl.prev');
    })
    /*   blog  js End */


}); //document ready over...

/*****************start animation script*******************/
function hb_animated_contents() {
    $(".hb-animate-element:in-viewport").each(function (i) {
        var $this = $(this);
        if (!$this.hasClass('hb-in-viewport')) {
            setTimeout(function () {
                $this.addClass('hb-in-viewport');
            }, 180 * i);
        }
    });
}
$(window).scroll(function () {
    hb_animated_contents();
});
$(window).load(function () {
    hb_animated_contents();
});
/*****************end animation script*******************/
function footerToggle() {
    if ($(window).width() < 992) {
        $("footer .footer-column h5").addClass("toggle");
        $("footer .footer-column ul").css('display', 'none');
        $("footer .footer-column.active ul").css('display', 'block');
        $("footer .footer-column h5.toggle").unbind("click");
        $("footer .footer-column h5.toggle").click(function () {
            $(this).parent().toggleClass('active').find('ul.list-unstyled').slideToggle("slow");
        });
    } else {
        $("footer .footer-column h5").removeClass('toggle');
        $("footer .footer-column ul.list-unstyled").css('display', 'block');
    }
}
$(document).ready(function () {
    footerToggle();
});
$(window).resize(function () {
    footerToggle();
});


/* Category List - Tree View */
function categoryListTreeView() {
    $(".category-treeview li.category-li").find("ul").parent().prepend("<div class='list-tree'></div>").find("ul").css('display', 'none');

    $(".category-treeview li.category-li.category-active").find("ul").css('display', 'block');
    $(".category-treeview li.category-li.category-active").toggleClass('active');
}
$(document).ready(function () {
    categoryListTreeView();
});
/* Category List - TreeView Toggle */
function categoryListTreeViewToggle() {
    $(".category-treeview li.category-li .list-tree").click(function () {
        $(this).parent().toggleClass('active').find('ul').slideToggle();
    });
}
$(document).ready(function () {
    categoryListTreeViewToggle();
});
$(document).ready(function () {
    menuMore();
});

function menuToggle() {
    if ($(window).width() < 992) {
        $("#menu .navbar-collapse > ul > li.dropdown > i").remove(".fa.fa-angle-down");
        $("#menu .navbar-collapse > ul > li.dropdown > a").after("<i class='fa fa-angle-down'></i>");
        $("#menu .navbar-collapse > ul > li.dropdown.more-menu > i").remove(".fa.fa-angle-down");
        $("#menu .navbar-collapse > ul > li.dropdown.more-menu > span").after("<i class='fa fa-angle-down'></i>");
    } else {
        $("#menu .navbar-collapse > ul > li.dropdown > i").remove(".fa.fa-angle-down");
    }

    /* menu item toggle active */
    $("#menu .navbar-collapse> ul li.dropdown > i").click(function () {
        $(this).parent().toggleClass('active').find(".dropdown-menu").first().slideToggle();
    });
}
$(document).ready(function () {
    menuToggle();
});
$(window).resize(function () {
    menuToggle();
});
/* Animate effect on Review Links - Product Page */
$(".product-total-review, .product-write-review").click(function () {
    $('html, body').animate({
        scrollTop: $(".product-tabs").offset().top
    }, 1000);
});
/* Main Menu - MORE items */

function menuMore() {
    //$(function($){
    var max_items = 5;
    var liItems = $('.navbar-nav > li');
    var remainItems = liItems.slice(max_items, liItems.length);
    remainItems.wrapAll('<li class="dropdown more-menu"><div class="dropdown-menu"><div class="dropdown-inner"><ul class="list-unstyled childs_1">');
    $('.more-menu').prepend('<span>More</span>');
    //});
}
/* FilterBox - Responsive Content*/
function optionFilter() {
    if ($(window).width() <= 767) {
        $('#column-left .option-filter-box').appendTo('.row #content .category-list');
        $('#column-right .option-filter-box').appendTo('.row #content .category-list');
    } else {
        $('.row #content .category-list .option-filter-box').appendTo('#column-left .option-filter');
        $('.row #content .category-list .option-filter-box').appendTo('#column-right .option-filter');
    }
}
$(document).ready(function () {
    optionFilter();
});
$(window).resize(function () {
    optionFilter();
});
