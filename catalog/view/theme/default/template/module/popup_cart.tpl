<div id="popup-wrapper">
<div id="popup-cart-inner">
<?php if ($products) { ?>
  <div class="popup-heading"><?php echo $heading_title; ?></div>
  <div class="popup-center">
    <?php if ($attention) { ?>
    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } else { ?>
    <div id="success-message"></div>
    <?php } ?>
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <table class="table-products-cart">
      <tbody>
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="remove">
            <button type="button" onclick="update( this, 'remove' );"></button>
            <input name="product_key" value="<?php echo $product['key']; ?>" style="display: none;" hidden />
            <input name="product_id_q" value="<?php echo $product['product_id']; ?>" style="display: none;" hidden />               
          </td>
          <td class="image">
            <?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?>
          </td>
          <td class="name">
            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if (!$product['stock']) { ?>
            <span class="text-danger">***</span>
            <?php } ?>
            <?php if ($product['option']) { ?>
            <?php foreach ($product['option'] as $option) { ?>
            <br />
            <?php echo $option['name']; ?>: <?php echo $option['value']; ?>
            <?php } ?>
            <?php } ?>
<!--
            <?php if ($product['reward']) { ?>
            <br />
            <?php echo $product['reward']; ?>
            <?php } ?>
            <?php if ($product['recurring']) { ?>
            <br />
            <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
            <?php } ?>
-->
          </td>
          <td class="qt">
            <div class="number">
              <input name="product_id_q" value="<?php echo $product['product_id']; ?>" style="display: none;" type="hidden" />
              <input name="product_id" value="<?php echo $product['key']; ?>" style="display: none;" type="hidden" />
              <div class="frame-change-count">
                <div class="btn-plus">
                  <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()+1); update( this, 'update' );">
                    <span class="icon-plus"></span>
                  </button>
                </div>
                <div class="btn-minus">
                  <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()-1); update( this, 'update' );">
                    <span class="icon-minus"></span>
                  </button>
                </div>
              </div>
              <input type="text" name="quantity" value="<?php echo $product['quantity']; ?>" class="plus-minus" onchange="update_manual( this, '<?php echo $product['key']; ?>' ); return validate(this);" onkeyup="update_manual( this, '<?php echo $product['key']; ?>' ); return validate(this);" />
            </div>
          </td>
          <td class="totals hidden"><?php echo $product['total']; ?></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $vouchers) { ?>
        <tr>
          <td></td>
          <td class="text-left"><?php echo $vouchers['description']; ?></td>
          <td class="text-left"></td>
          <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
            <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
            <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
          <td class="text-right"><?php echo $vouchers['amount']; ?></td>
          <td class="text-right"><?php echo $vouchers['amount']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
    </table>
    <div class="mobile-products-cart">
    <?php foreach ($products as $product) { ?>
      <div>
        <div class="remove">
          <button type="button" onclick="update( this, 'remove' );"></button>
          <input name="product_key" value="<?php echo $product['key']; ?>" style="display: none;" hidden />
          <input name="product_id_q" value="<?php echo $product['product_id']; ?>" style="display: none;" hidden />               
        </div>
        <div class="image">
          <?php if ($product['thumb']) { ?>
          <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
          <?php } ?>
        </div>
        <div class="name">
          <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
          <?php if (!$product['stock']) { ?>
          <span class="text-danger">***</span>
          <?php } ?>
          <?php if ($product['option']) { ?>
          <?php foreach ($product['option'] as $option) { ?>
          <br />
          <?php echo $option['name']; ?>: <?php echo $option['value']; ?>
          <?php } ?>
          <?php } ?>
          <?php if ($product['reward']) { ?>
          <br />
          <?php echo $product['reward']; ?>
          <?php } ?>
          <?php if ($product['recurring']) { ?>
          <br />
          <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
          <?php } ?>
        </div>
        <div class="qt">
          <div class="number">
            <input name="product_id_q" value="<?php echo $product['product_id']; ?>" style="display: none;" type="hidden" />
            <input name="product_id" value="<?php echo $product['key']; ?>" style="display: none;" type="hidden" />
            <div class="frame-change-count">
              <div class="btn-plus">
                <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()+1); update( this, 'update' );">
                  <span class="icon-plus"></span>
                </button>
              </div>
              <div class="btn-minus">
                <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()-1); update( this, 'update' );">
                  <span class="icon-minus"></span>
                </button>
              </div>
            </div>
            <input type="text" name="quantity" value="<?php echo $product['quantity']; ?>" class="plus-minus" onchange="update_manual( this, '<?php echo $product['key']; ?>' ); return validate(this);" onkeyup="update_manual( this, '<?php echo $product['key']; ?>' ); return validate(this);" />
          </div>
        </div>
        <div class="totals">
          <?php echo $product['total']; ?>
        </div>
      </div>
      <?php } ?>
    </div>
    <div class="all-total hidden">
      <?php foreach ($totals as $total) { ?>
        <div class="totals-left"><?php echo $total['title']; ?>:</div>
        <div class="totals-right"><?php echo $total['text']; ?></div>
        <div class="clear-total"></div>
      <?php } ?>
    </div>    
  </div>
  <div class="popup-footer">
    <button onclick="$.magnificPopup.close();"><?php echo $button_shopping; ?></button>
    <a href="<?php echo $checkout_link; ?>"><?php echo $button_checkout; ?></a>
  </div>
<?php } else { ?>
  <div class="popup-heading"><?php echo $heading_title_empty; ?></div>
  <div class="popup-center empty-cart"><?php echo $empty; ?></div>
  <div class="popup-footer">
    <button onclick="$.magnificPopup.close();"><?php echo $button_shopping; ?></button>
  </div>
<?php } ?>
</div>
<script type="text/javascript">
function masked(element, status) {
  if (status == true) {
    $('<div/>')
    .attr({ 'class':'masked' })
    .prependTo(element);
    $('<div class="masked_loading" />').insertAfter($('.masked'));
  } else {
    $('.masked').remove();
    $('.masked_loading').remove();
  }
}

function validate( input ) {
  input.value = input.value.replace( /[^\d,]/g, '' );
}

function update( target, status ) {
  masked('#popup-cart-inner', true);
  var input_val    = $( target ).parent().parent().parent().children( 'input[name=quantity]' ).val(),
      quantity     = parseInt( input_val ),
      product_id   = $( target ).parent().parent().parent().children( 'input[name=product_id]' ).val(),
      product_id_q = $( target ).parent().parent().parent().children( 'input[name=product_id_q]' ).val(),
      product_key  = $( target ).next().val(),
      urls         = null;

  if ( quantity <= 0 ) {
    masked('#popup-cart-inner', false);
    quantity = $( target ).parent().parent().parent().children( 'input[name=quantity]' ).val( 1 );
    return;
  }

  if ( status == 'update' ) {
    urls = 'index.php?route=module/popup_cart&update=' + product_id + '&quantity=' + quantity;
  } else if ( status == 'add' ) {
    urls = 'index.php?route=module/popup_cart&add=' + target + '&quantity=1';
  } else {
    urls = 'index.php?route=module/popup_cart&remove=' + product_key;
  }
      
  $.ajax({
    url: urls,
    type: 'get',
    dataType: 'html',
    success: function( data ) {
      $.ajax({
        url: 'index.php?route=module/popup_cart/status_cart',
        type: 'get',
        dataType: 'json',
        success: function( json ) {
          masked('#popup-cart-inner', false);
          if (json['total']) {
            setTimeout(function () {
              $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
            }, 100);
            $('#cart > ul').load('index.php?route=common/cart/info ul li');
          }
          $('#popup-cart-inner').html( $( data ).find( '#popup-cart-inner > *' ) );
        } 
      });
    } 
  });
}
function update_manual( target, product_id ) {
  masked('#popup-cart-inner', true);
  var input_val = $( target ).val(),
      quantity  = parseInt( input_val );
    
  if ( quantity <= 0 ) {
    masked('#popup-cart-inner', false);
    quantity = $( target ).val( 1 );
    return;
  }
  
  $.ajax({
    url: 'index.php?route=module/popup_cart&update=' + product_id + '&quantity=' + quantity,
    type: 'get',
    dataType: 'html',
    success: function( data ) {
      $.ajax({
        url: 'index.php?route=module/popup_cart/status_cart',
        type: 'get',
        dataType: 'json',
        success: function( json ) {
          masked('#popup-cart-inner', false);
          if (json['total']) {
            setTimeout(function () {
              $('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
            }, 100);
            $('#cart > ul').load('index.php?route=common/cart/info ul li');
          }
          $('#popup-cart-inner').html( $( data ).find( '#popup-cart-inner > *' ) );
        } 
      });
    } 
  });
}
</script>
</div>