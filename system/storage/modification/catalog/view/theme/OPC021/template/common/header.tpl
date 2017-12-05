<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>
        <?php echo $title; ?>
    </title>
    <base href="<?php echo $base; ?>" />
    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>" />
    <?php } ?>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>" />
    <?php } ?>

        <script src="catalog/view/javascript/ocdev_smart_checkout/jquery-1.7.1.min.js" type="text/javascript"></script>
        <script type="text/javascript">var smch_old_jqury = jQuery.noConflict();</script>
        
    <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href='https://fonts.googleapis.com/css?family=PT+Sans:400,500,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Dosis:400,500,600,700' rel='stylesheet' type='text/css'>
    <link media="all" type="text/css" href="http://fonts.googleapis.com/css?family=Raleway:400,600,700" rel="stylesheet">
    <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="catalog/view/theme/<?php echo $curr_theme_path; ?>/stylesheet/TemplateTrip/bootstrap.min.css" rel="stylesheet" media="screen" />
    <link href="catalog/view/theme/<?php echo $curr_theme_path; ?>/stylesheet/stylesheet.css" rel="stylesheet" type="text/css" />
    <?php if($direction=='rtl') { ?>
    <link href="catalog/view/theme/<?php echo $curr_theme_path; ?>/stylesheet/TemplateTrip/rtl.css" rel="stylesheet" type="text/css" />
    <?php } ?>
    <link href="catalog/view/theme/<?php echo $curr_theme_path; ?>/stylesheet/TemplateTrip/animate.css" rel="stylesheet" type="text/css" />
    <link href="catalog/view/theme/<?php echo $curr_theme_path; ?>/stylesheet/TemplateTrip/lightbox.css" rel="stylesheet" type="text/css" />
    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>
    <link rel="stylesheet" href="catalog/view/javascript/jquery/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="catalog/view/javascript/jquery/owl-carousel/owl.theme.css">
    
    <link href="catalog/view/theme/<?php echo $curr_theme_path; ?>/stylesheet/slick.css" rel="stylesheet" type="text/css" />
    <link href="catalog/view/theme/<?php echo $curr_theme_path; ?>/stylesheet/slick-theme.css" rel="stylesheet" type="text/css" />
    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    
    <script src="catalog/view/javascript/slick.min.js" type="text/javascript"></script>
    <!-- TemplateTrip custom Theme JS -->
    <script src="catalog/view/javascript/TemplateTrip/addonScript.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/TemplateTrip/jquery.counterup.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/TemplateTrip/ttprogressbar.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/TemplateTrip/lightbox-2.6.min.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/TemplateTrip/inview.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/TemplateTrip/waypoints.min.js" type="text/javascript"></script>
    <script src="catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js" type="text/javascript"></script>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
    <?php } ?>
    <!-- gallary -->
    <script src="catalog/view/javascript/gallary/unitegallery.min.js" type="text/javascript"></script>
    <link href="catalog/view/theme/<?php echo $curr_theme_path; ?>/stylesheet/gallary/unite-gallery.css" rel="stylesheet" type="text/css" />
    <script src="catalog/view/javascript/gallary/ug-theme-compact.js" type="text/javascript"></script>
    <!-- gallary -->

        <?php if ( isset($popup_cart_data['status']) && $popup_cart_data['status'] ) { ?>
        <!-- popup_cart start -->
        <script src="catalog/view/javascript/popup_cart/jquery.magnific-popup.min.js" type="text/javascript"></script>
        <link href="catalog/view/javascript/popup_cart/magnific-popup.css" rel="stylesheet" media="screen" />
        <link href="catalog/view/theme/default/stylesheet/popup_cart/stylesheet.css" rel="stylesheet" media="screen" />
        <script type="text/javascript">
        $(function() {
          $( '#cart > button' ).removeAttr( 'data-toggle' ).attr( 'onclick', 'get_popup_cart(false,\'' + 'show' + '\');' );
          $.each( $("[onclick^='cart.add']"), function() {
            var product_id = $(this).attr('onclick').match(/[0-9]+/);
            $(this).attr( 'onclick', 'get_popup_cart(\'' + $(this).attr('onclick').match(/[0-9]+/) + '\',\'' + 'products' + '\');' );
          });
          var main_product_id = $('input[name=\'product_id\']').val();
          $('#button-cart').unbind('click').attr( 'onclick', 'get_popup_cart(\'' + main_product_id + '\',\'' + 'product' + '\');' );
        });
        function get_popup_cart( product_id, action ) {  
          quantity = typeof(quantity) != 'undefined' ? quantity : 1;
          if ( action == "products" ) {
            $.ajax({
              url: 'index.php?route=checkout/cart/add',
              type: 'post',
              data: 'product_id=' + product_id + '&quantity=' + quantity,
              dataType: 'json',
              success: function( json ) {
                $('.alert, .text-danger').remove();
                if ( json['redirect'] ) {
                  location = json['redirect'];
                }
                if ( json['success'] ) {
                  // $('html, body').animate({ scrollTop: 0 }, 'slow');
                  $.magnificPopup.open({
                    callbacks: {
                      ajaxContentAdded: function() {   
                        $('#success-message').html('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                      }
                    },
                    tLoading: '<img src="catalog/view/theme/default/stylesheet/popup_cart/ring-alt.svg" />',
                    items: {
                      src: 'index.php?route=module/popup_cart',
                      type: 'ajax'
                    }
                  });

                  $('#cart-total' ).html(json['total']);
                } 
              }
            });
          }
          if ( action == "product" ) {
            $.ajax({
              url: 'index.php?route=checkout/cart/add',
              type: 'post',
              data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
              dataType: 'json',
              beforeSend: function() {
                $('#button-cart').button('loading');
              },
              complete: function() {
                $('#button-cart').button('reset');
              },
              success: function( json ) {
                $('.alert, .text-danger').remove();
                $('.form-group').removeClass('has-error');

                if (json['error']) {
                  if (json['error']['option']) {
                    for (i in json['error']['option']) {
                      var element = $('#input-option' + i.replace('_', '-'));
                      
                      if (element.parent().hasClass('input-group')) {
                        element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                      } else {
                        element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
                      }
                    }
                  }
                  $('.text-danger').parent().addClass('has-error');
                }
                if ( json['success'] ) {
                  // $('html, body').animate({ scrollTop: 0 }, 'slow');
                  setTimeout(function () {
                  $('#popup-cart-inner .popup-center').prepend('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
                  }, 200);
                  $.magnificPopup.open({
                    items: {
                      src: 'index.php?route=module/popup_cart',
                      type: 'ajax'
                    }
                  });
                  
                  $('#cart-total').html( json['total'] );
                } 
              }
            });
          }
          if ( action == "show" ) {
            $.magnificPopup.open({
              items: {
                src: 'index.php?route=module/popup_cart',
                type: 'ajax'
              }
            });
          }
        }
        </script>
        <!-- popup_cart end -->
        <?php } ?>
      

        <?php
          $customer_groups = isset( $smch_form_data['customer_groups'] ) ? $smch_form_data['customer_groups'] : array();
          $stores = isset( $smch_form_data['stores'] ) ? $smch_form_data['stores'] : array();
        ?>
        <?php if ( isset( $smch_form_data['activate'] ) && !in_array( $smch_customer_group_id, $customer_groups ) && !in_array( $smch_store_id, $stores ) ) { ?>
        <!-- <?php echo $smch_form_data['front_module_name'] . ' : ' . $smch_form_data['front_module_version']; ?> -->
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ocdev_smart_checkout/stylesheet.css?v=<?php echo $smch_form_data['front_module_version']; ?>" />
        <script type="text/javascript" src="catalog/view/javascript/ocdev_smart_checkout/ocdev_smart_checkout.js?v=<?php echo $smch_form_data['front_module_version']; ?>"></script>
        <script type="text/javascript" src="catalog/view/javascript/ocdev_smart_checkout/inputmask.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/ocdev_smart_checkout/jquery.placeholder.js"></script>
        <script type="text/javascript" src="<?php echo (file_exists( $moment_js_dir . 'moment.js' ) ) ? $moment_js_dir . 'moment.js' : $moment_js_dir . 'moment.min.js' ;?>"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js"></script>
        <link href="catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen" />
        <?php echo html_entity_decode( $smch_form_data['google_analytics_script'], ENT_QUOTES, 'UTF-8' ); ?>
        <!-- <?php echo $smch_form_data['front_module_name'] . ' : ' . $smch_form_data['front_module_version']; ?> -->
        <?php } ?>
        
</head>
<body class="<?php echo $class; ?>">
    <header>
        <nav id="top">
            <div class="container">
                <div class="header-top-left">
                    <div id="logo">
                        <?php if ($logo) { ?>
                        <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
                        <?php } else { ?>
                        <h1>
                            <a href="<?php echo $home; ?>">
                                <?php echo $name; ?>
                            </a>
                        </h1>
                        <?php } ?>
                    </div>
                    <div class="header-phone pull-left"><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></div>
                </div>
                <?php if($header_top) { ?>
                <div class="header-top-cms">
                    <?php echo $header_top; ?>
                </div>
                <?php } ?>
            </div>

        </nav>
        <?php if($header_bottom) { ?>
        <div class="header-bottom-cms col-sm-12">
            <?php echo $header_bottom; ?>
        </div>
        <?php } ?>
    </header>
    <?php if ($categories) { ?>
    <div class="menu-container">
        <div class="container-fluid">
            <div id="logo">
                <?php if ($logo) { ?>
                <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="normal_logo" />
                <img class="small_logo" src="<?php echo IMG_PATH . 'catalog/logo-final-sm.png' ?>" alt="">
                </a>
                <?php } else { ?>
                <h1>
                    <a href="<?php echo $home; ?>">
                        <?php echo $name; ?>
                    </a>
                </h1>
                <?php } ?>
            </div>
            <nav id="menu" class="navbar">
                <div class="header-top-right">
                    <div id="top-links" class="nav pull-right">
                        <ul class="list-inline men2">
                            <li class="ttsearch">
                                <?php echo $search;?>
                            </li>
                            <li class="dropdown header_user_info hidden"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="ttuserheading"><?php echo $text_account; ?></span> <i class="fa fa-caret-down"></i></a>
                                <ul class="dropdown-menu dropdown-menu-right account-link-toggle">
                                    <?php if ($logged) { ?>
                                    <li><a href="<?php echo $account; ?>"><i class='fa fa-user'></i> <?php echo $text_account; ?></a></li>
                                    <li><a href="<?php echo $order; ?>"><i class='fa fa-calendar'></i> <?php echo $text_order; ?></a></li>
                                    <li><a href="<?php echo $transaction; ?>"><i class='fa fa-credit-card'></i> <?php echo $text_transaction; ?></a></li>
                                    <li><a href="<?php echo $download; ?>"><i class='fa fa-download'></i> <?php echo $text_download; ?></a></li>
                                    <li><a href="<?php echo $logout; ?>"><i class='fa fa-sign-out'></i> <?php echo $text_logout; ?></a></li>
                                    <?php } else { ?>
                                    <li><a href="<?php echo $register; ?>"><i class='fa fa-user'></i> <?php echo $text_register; ?></a></li>
                                    <li><a href="<?php echo $login; ?>"><i class='fa fa-sign-in'></i> <?php echo $text_login; ?></a></li>
                                    <?php } ?>
                                    <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class=""><?php echo $text_wishlist; ?></span></a></li>
                                    <li class="ttlanguage">
                                        <?php echo $language; ?>
                                    </li>
                                    <li class="ttcurrency">
                                        <?php echo $currency; ?>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <?php if ($logged) { ?>
                                <a href="<?php echo $account; ?>">
                                    <?php echo $text_account; ?>
                                </a>
                                <?php } else { ?>
                                <a href="<?php echo $login; ?>">
                                    <?php echo $text_login; ?>
                                </a>
                                <?php } ?>
                            </li>
                            <li class="hidden">
                                <?php echo $cart;?>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="navbar-header collapsed" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                </div>
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav">
                        <?php foreach ($categories as $category) { ?>
                        <?php if ($category['children']) { ?>
                        <li class="dropdown menuPunct">
                            <a href="<?php echo $category['href']; ?>">
                                <?php echo $category['name']; ?>
                            </a>
                            <div class="dropdown-menu">
                                <div class="dropdown-inner">
                                    <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                    <ul class="list-unstyled childs_1 <?php if($category['column']<=1) echo 'single-dropdown-menu'; else echo 'mega-dropdown-menu'; ?>">
                                        <?php foreach ($children as $child) { ?>
                                        <!-- 2 Level Sub Categories START -->
                                        <?php if ($child['childs']) { ?>
                                        <li class="dropdown">
                                            <img src="<?php  echo  IMG_PATH . $child['thumb'];?>" alt="<?php echo $child['name']; ?>">
                                            <a href="<?php echo $child['href']; ?>">
                                                <?php echo $child['name']; ?>
                                            </a>
                                            <div class="dropdown-menu">
                                                <div class="dropdown-inner">
                                                    <?php foreach (array_chunk($child['childs'], ceil(count($child['childs']) / $child['column'])) as $childs_col) { ?>
                                                    <ul class="list-unstyled childs_2">
                                                        <?php foreach ($childs_col as $childs_2) { ?>

                                                        <li>
                                                            <img src="IMG_PATH . <?php  echo  IMG_PATH . $child['thumb'];?>" alt="<?php echo $child['name']; ?>">
                                                            <a href="<?php echo $childs_2['href']; ?>">
                                                                <?php echo $childs_2['name']; ?>
                                                            </a>
                                                        </li>
                                                        <?php } ?>
                                                    </ul>
                                                    <?php } ?>
                                                </div>
                                            </div>
                                        </li>
                                        <?php } else { ?>
                                        <?php if($child['thumb']) { ?>
                                        <li>
                                            <div class="thumb-cat-img-wrapper" style="width: <?php echo $telephone2; ?>; height: <?php echo $telephone3; ?>">
                                                <img src="<?php  echo IMG_PATH . $child['thumb'];?>" alt="<?php echo $child['name']; ?>" class="img-responsive">
                                            </div>
                                            <a href="<?php echo $child['href']; ?>">
                                                <?php echo $child['name']; ?>
                                            </a>
                                        </li>
                                        <?php } else { ?>
                                        <li>
                                            <a href="<?php echo $child['href']; ?>">
                                                <?php echo $child['name']; ?>
                                            </a>
                                        </li>
                                        <?php } ?>
                                        <?php } ?>
                                        <!-- 2 Level Sub Categories END -->
                                        <?php } ?>
                                    </ul>
                                    <?php } ?>
                                </div>
                            </div>
                        </li>
                        <?php } else { ?>
                        <li class="menuPunct ">
                            <a href="<?php echo $category['href']; ?>">
                                <?php echo $category['name']; ?>
                            </a>
                        </li>
                        <?php } ?>
                        <?php } ?>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
    <?php } ?>