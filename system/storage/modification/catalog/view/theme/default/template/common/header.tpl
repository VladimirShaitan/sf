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
    <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
    <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
    <link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
    <?php foreach ($styles as $style) { ?>
    <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
    <?php } ?>
    <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
    <?php } ?>
    <?php foreach ($scripts as $script) { ?>
    <script src="<?php echo $script; ?>" type="text/javascript"></script>
    <?php } ?>
    <?php foreach ($analytics as $analytic) { ?>
    <?php echo $analytic; ?>
    <?php } ?>

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
    <nav id="top">
        <div class="container">
            <?php echo $currency; ?>
            <?php echo $language; ?>
            <div id="top-links" class="nav pull-right">
                <ul class="list-inline">
                    <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>
                    <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
                        <ul class="dropdown-menu dropdown-menu-right">
                            <?php if ($logged) { ?>
                            <li>
                                <a href="<?php echo $account; ?>">
                                    <?php echo $text_account; ?>
                                </a>
                            </li>
                            <li>
                                <a href="<?php echo $order; ?>">
                                    <?php echo $text_order; ?>
                                </a>
                            </li>
                            <li>
                                <a href="<?php echo $transaction; ?>">
                                    <?php echo $text_transaction; ?>
                                </a>
                            </li>
                            <li>
                                <a href="<?php echo $download; ?>">
                                    <?php echo $text_download; ?>
                                </a>
                            </li>
                            <li>
                                <a href="<?php echo $logout; ?>">
                                    <?php echo $text_logout; ?>
                                </a>
                            </li>
                            <?php } else { ?>
                            <li>
                                <a href="<?php echo $register; ?>">
                                    <?php echo $text_register; ?>
                                </a>
                            </li>
                            <li>
                                <a href="<?php echo $login; ?>">
                                    <?php echo $text_login; ?>
                                </a>
                            </li>
                            <?php } ?>
                        </ul>
                    </li>
                    <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
                    <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
                    <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
                </ul>
            </div>
        </div>
    </nav>
    <header>
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
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
                </div>
                <div class="col-sm-5">
                    <?php echo $search; ?>
                </div>
                <div class="col-sm-3">
                    <?php echo $cart; ?>
                </div>
            </div>
        </div>
    </header>
    <?php if ($categories) { ?>
    <div class="container">
        <nav id="menu" class="navbar">
            <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
                <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
            </div>
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav">
                    <?php foreach ($categories as $category) { ?>
                    <?php if ($category['children']) { ?>
                    <li class="dropdown">
                        <a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown">
                            <?php echo $category['name']; ?>
                        </a>
                        <div class="dropdown-menu">
                            <div class="dropdown-inner">
                                <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                                <ul class="list-unstyled">
                                    <?php foreach ($children as $child) { ?>
                                    <li>
                                        <a href="<?php echo $child['href']; ?>">
                                            <?php echo $child['name']; ?>
                                        </a>
                                    </li>
                                    <?php } ?>
                                </ul>
                                <?php } ?>
                            </div>
                            <a href="<?php echo $category['href']; ?>" class="see-all">
                                <?php echo $text_all; ?>
                                <?php echo $category['name']; ?>
                            </a>
                        </div>
                    </li>
                    <?php } else { ?>
                    <li>
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
    <?php } ?> 