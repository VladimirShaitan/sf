<footer>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <p><?php echo $powered; ?></p>
  </div>
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->


        <?php
          $customer_groups = isset( $smch_form_data['customer_groups'] ) ? $smch_form_data['customer_groups'] : array();
          $stores = isset( $smch_form_data['stores'] ) ? $smch_form_data['stores'] : array();
         // global $request;
        ?>
        <?php if ( isset( $smch_form_data['activate'] ) && !in_array( $smch_customer_group_id, $customer_groups ) && !in_array( $smch_store_id, $stores ) ) { ?>
        <!-- <?php echo $smch_form_data['front_module_name'] . ' : ' . $smch_form_data['front_module_version']; ?> -->
        <script type="text/javascript">
          $(function() {
          $('body')
          .after("<input name='smch_product_ids' value='' type='hidden' style='display:none;' />");
          
          var smch_product_ids_array = [];
          
          $.each($("[onclick^='<?php echo $smch_form_data['add_function_selector']; ?>']"), function() {
            var product_id = $(this).attr('onclick').match(/[0-9]+/),
                smch_product_id = smch_product_ids_array;
            
            smch_product_ids_array.push( product_id );

            $("input[name='smch_product_ids']")
            .attr( 'value', smch_product_id );
          });
          
          var urls  = "";
            urls += "index.php?route=module/ocdev_smart_checkout/getProducts";
            <?php if ( isset( $request_route ) ) { ?>
            urls += "&routing=<?php echo ( isset( $request_route ) ) ? $request_route : ''; ?>";
            <?php } ?>
            <?php if ( isset( $request_product_id ) ) { ?>
            urls += "&product_id=<?php echo ( isset( $request_product_id ) ) ? $request_product_id : ''; ?>";
            <?php } ?>
            urls += "&smch_product_ids=" + $("input[name='smch_product_ids']").val();

            $.ajax({
              type: 'post',
              url:   urls,
              dataType: 'json',
              success: function(json) {
				console.log(json['products']);
                $.each( json['products'], function(i,value) {
                  $("[onclick^='"+json['add_function_selector']+"']").each(function() {
                    var product_id = $(this).attr('onclick').match(/[0-9]+/);
                    if ( product_id == value ) {
                      $(this)
                      .before( "<div class='button-group'><button class='smch_call_button'><i class='fa fa-lightbulb-o'></i> " + json['text_call_button'] + "</button></div>" )
                      .prev()
                      .attr( 'onclick', 'getOCwizardModal_smch(\'' + $(this).attr('onclick').match(/[0-9]+/) + '\')' );
                    }
                  });
                });
				console.log(json['product']);
				$.each( json['product'], function(i,value) {
                  var product_id_in_page = $("input[name='product_id']").val();
                  if ( product_id_in_page == value ) {
                    $('#'+json['add_id_selector']).before( "<button id='request_a_quote' class='btn btn-primary btn-lg product-btn-cart'>" + json['text_call_button'] + "</button>" )
                    .prev()
                    .attr( 'onclick', 'getOCwizardModal_smch(\'' + product_id_in_page + '\')' );
                  }
                });
               
              }
            });
          });
        </script>
        <!-- <?php echo $smch_form_data['front_module_name'] . ' : ' . $smch_form_data['front_module_version']; ?> -->
        <?php } ?>
        
</body></html>