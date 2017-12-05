<footer>   
    <?php if ($footer_top) { ?>
    <div class="footer-top-cms col-sm-12">
        <?php echo $footer_top; ?>
    </div>
    <?php } ?>

    <div class="container-fluid">
        <div class="row">
            <?php if($footer_left) { ?>
            <div class="footer-column footer-left-cms col-sm-3">
                <?php echo $footer_left; ?>
            </div>
            <?php } ?>

            <div class="col-sm-3 col-xs-4 copyright" style="line-height: initial;">
                <?php if($copyright){ ?>
                <?php echo $copyright; ?> <br>
                <?php } ?>
                <?php if($address){ ?>
                <?php if($geocode){ ?>
                <a class="link_footer" href="<?php echo $geocode; ?>" target="_blank">
                    <?php echo $address; ?>
                </a>
                <?php } else { ?>
                <?php echo $address; ?>
                <?php } ?>
                <?php } ?>
                <br>
                <?php if($telephone){ ?> 
                <?php echo $text_telephone; ?>:
                <a class="link_footer" href="tel:<?php echo $telephone; ?>">
                    <?php echo $telephone; ?>
                </a>
                <?php } ?>
                <?php if($fax){ ?> |
                <a class="link_footer" href="tel:<?php echo $fax; ?>"><?php echo $fax; ?></a>
                <?php } ?>
            </div>
            <?php if ($informations) { ?>
            <div class="col-sm-6 col-xs-8 text-right footer-menu">

                <ul class="list-inline">
                    <?php foreach ($informations as $information) { ?>
                    <li class="footer_menu_item">
                        <a href="<?php echo $information['href']; ?>">
                            <?php echo $information['title']; ?>
                        </a>
                    </li>
                    <?php } ?>
                </ul>
            </div>
            <?php } ?> 
            <div class="col-sm-3 col-xs-12 footer_social">
                <ul class="list-inline social text-right">
                    <?php if($linkedin){ ?>
                    <li><a href="<?php echo $linkedin; ?>"><i class="fa fa-linkedin"></i></a></li>
                    <?php } ?>
                    <?php if($inst){ ?>
                    <li><a href="<?php echo $inst ?>"><i class="fa fa-instagram"></i></a></li>
                    <?php } ?>
                    <?php if($twitter){ ?>
                    <li><a href="<?php echo $twitter ?>"><i class="fa fa-twitter"></i></a></li>
                    <?php } ?>
                    <?php if($facebook){ ?>
                    <li><a href="<?php echo $facebook ?>"><i class="fa fa-facebook"></i></a></li>
                    <?php } ?>
                    <?php if($gplus){ ?>
                    <li><a href="<?php echo $gplus ?>"><i class="fa fa-google-plus"></i></a></li>
                    <?php } ?>
                    <?php if($pin){ ?>
                    <li><a href="<?php echo $pin ?>"><i class="fa fa-pinterest-p"></i></a></li>
                    <?php } ?>
                </ul>
            </div>
        </div>

    </div>

</footer>


    <script>
    {
        let sh_link = document.querySelectorAll('.share-btns li a');
        for(let i = 0; i <= sh_link.length-1; i++){
            sh_link[i].href = sh_link[i].href + window.location.href;
        }
        
    }
                    
    </script>  

<script type="text/javascript">
    $('.multiple-items').slick({
        infinite: true,
        slidesToShow: 5,
        slidesToScroll: 1,
        responsive: [{
                breakpoint: 1200,
                settings: {
                    slidesToShow: 4, 
                }
            }

        ]
    });

    $('.multiple-cats').slick({
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows: false, 
        responsive: [{
                breakpoint: 1200,
                settings: {
                    slidesToShow: 2, 
                }
            }

        ]
    });
    
    $('.multiple-cats-collect').slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        arrows: false, 
        responsive: [{
                breakpoint: 1200,
                settings: {
                    slidesToShow: 3, 
                }
            }

        ]
    });
    
    jQuery(document).ready(function() {
        jQuery("#gallery").unitegallery();
    });    
</script>
<script>

$(document).ready(function() {
	$('.zoom-gallery').magnificPopup({
		delegate: 'a',
		type: 'image',
		closeOnContentClick: false,
		closeBtnInside: false,
		mainClass: 'mfp-with-zoom mfp-img-mobile',
		image: {
			verticalFit: true,
			titleSrc: function(item) {
				return item.el.attr('title') + ' &middot; <a class="image-source-link" href="'+item.el.attr('data-source')+'" target="_blank">image source</a>';
			}
		},
		gallery: {
			enabled: true
		},
		zoom: {
			enabled: true,
			duration: 300, // don't foget to change the duration also in CSS
			opener: function(element) {
				return element.find('img');
			}
		}
		
	});
});
</script>

</body>

</html>