<?php echo $header; ?>


<div class="container-fluid product-product">
<!--
  <script type="text/javascript">(function() {
  if (window.pluso)if (typeof window.pluso.start == "function") return;
  if (window.ifpluso==undefined) { window.ifpluso = 1;
    var d = document, s = d.createElement('script'), g = 'getElementsByTagName';
    s.type = 'text/javascript'; s.charset='UTF-8'; s.async = true;
    s.src = ('https:' == window.location.protocol ? 'https' : 'http')  + '://share.pluso.ru/pluso-like.js';
    var h=d[g]('body')[0];
    h.appendChild(s);
  }})();</script>
<div class="pluso" data-background="#ebebeb" data-options="big,square,line,horizontal,counter,theme=04" data-services="google,linkedin,pinterest,facebook,twitter"></div>
-->


    <div class="row">
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>">
            
				
				<?php echo $content_top; ?>
				
				<?php if( ! empty( $breadcrumbs ) && is_array( $breadcrumbs ) ) { ?>
					<ul style="display:none;">
						<?php foreach( $breadcrumbs as $breadcrumb ) { ?>
							<?php if( NULL != ( $smk_title = strip_tags( $breadcrumb['text'] ) ) ) { ?>
								<li itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
									<a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo strip_tags( $breadcrumb['text'] ); ?></span></a>
								</li>
							<?php } ?>
						<?php } ?>
					</ul>
				<?php } ?>
			
			
				
				<?php if( ! empty( $smp_is_product ) ) { ?>
					<span itemscope itemtype="http://schema.org/Product">
						<meta itemprop="name" content="<?php echo htmlspecialchars( str_replace( '&amp;', '&', $heading_title ), ENT_QUOTES ); ?>">

						<?php if( ! empty( $breadcrumb ) ) { ?>
							<meta itemprop="url" content="<?php echo htmlspecialchars( $breadcrumb['href'], ENT_QUOTES ); ?>">
						<?php } ?>

						<?php if( ! empty( $model ) ) { ?>
							<meta itemprop="model" content="<?php echo htmlspecialchars( $model, ENT_QUOTES ); ?>">
						<?php } ?>

						<?php if( ! empty( $manufacturer ) ) { ?>
							<meta itemprop="manufacturer" content="<?php echo htmlspecialchars( $manufacturer, ENT_QUOTES ); ?>">
						<?php } ?>

						<span itemscope itemprop="offers" itemtype="http://schema.org/Offer">
							<meta itemprop="price" content="<?php if( ! empty( $special ) ) { echo preg_replace( '/[^0-9.]/', '', str_replace( ',', '.', $special ) ); } else { echo preg_replace( '/[^0-9.]/', '', str_replace( ',', '.', $price ) ); } ?>">
							<meta itemprop="priceCurrency" content="<?php echo $smp_currency; ?>">
							<link itemprop="availability" href="http://schema.org/<?php if( $smp_in_stock ) { ?>InStock<?php } else { ?>OutOfStock<?php } ?>">
						</span>

						<?php if( $review_status && $smp_reviews ) { ?>
							<span itemscope itemprop="aggregateRating" itemtype="http://schema.org/AggregateRating">
								<meta itemprop="reviewCount" content="<?php echo $smp_reviews; ?>">
								<meta itemprop="ratingValue" content="<?php echo $rating; ?>">
								<meta itemprop="bestRating" content="5">
								<meta itemprop="worstRating" content="1">
							</span>
						<?php } ?>

						<?php if( $thumb ) { ?>
							<meta itemprop="image" content="<?php echo $thumb; ?>">
						<?php } ?>

						<?php foreach( $images as $image ) { ?>
							<meta itemprop="image" content="<?php echo $image['popup']; ?>">
						<?php } ?>
					</span>
				<?php } ?>
			
			

				<?php if(!$config_file_block_positions or ($config_file_block_positions == 'file_block_position_top' and $file_to_product and !$config_file_block_custom_positions_block)) echo $file_to_product;  ?>
			
            <!-- Product row START -->
            <div class="row">

                <div class="col-xs-12 col-sm-3  product-details">
                    <div class="bread text-center">
                        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                        <a href="<?php echo $breadcrumb['href']; ?>">
                            <?php echo $breadcrumb['text']; ?> / </a>
                        <?php } ?>
                    </div>
                    <h1 class="product-name">
                        <?php echo $heading_title; ?>
                    </h1>
                    <div class="btns_wrapper_product">
                        <span id="btn-cart-wrapper"></span>
                        <?php if($show_buy === 'true') { ?>
                        <button class="btn btn-primary btn-lg product-btn-cart" type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>"><i class="fa fa-shopping-cart"></i><?php echo $button_cart; ?></button>
                        <?php } ?>

                    </div>
                    <!-- accordion tabs -->

                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                       <?php if($description || $tags){ ?>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                        <?php echo $tab_description; ?>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body">
                                    <?php echo $description; ?>
                                    <?php if ($tags) { ?>
                                    <p>
                                        <?php echo $text_tags; ?>
                                        <?php for ($i = 0; $i < count($tags); $i++) { ?>
                                        <?php if ($i < (count($tags) - 1)) { ?>
                                        <a href="<?php echo $tags[$i]['href']; ?>">
                                            <?php echo $tags[$i]['tag']; ?>
                                        </a>,
                                        <?php } else { ?>
                                        <a href="<?php echo $tags[$i]['href']; ?>">
                                            <?php echo $tags[$i]['tag']; ?>
                                        </a>
                                        <?php } ?>
                                        <?php } ?>
                                    </p>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                        <?php } ?>
<!--
                        <?php if ($manufacturer || $reward || $model || $stock) { ?>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="othHeading">
                                <h4 class="panel-title">
                                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOth" aria-expanded="true" aria-controls="collapseOth">
                                      Other info
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOth" class="panel-collapse collapse" role="tabpanel" aria-labelledby="othHeading">
                                <div class="panel-body">
                                    <table class="product-info">
                                        <?php if ($manufacturer) { ?>
                                        <tr>
                                            <td>
                                                <?php echo $text_manufacturer; ?>
                                            </td>
                                            <td class="product-info-value">
                                                <a href="<?php echo $manufacturers; ?>">
                                                    <?php echo $manufacturer; ?>
                                                </a>
                                            </td>
                                        </tr>
                                        <?php } ?>
                                        <tr>
                                            <td>
                                                <?php echo $text_model; ?>
                                            </td>
                                            <td class="product-info-value">
                                                <?php echo $model; ?>
                                            </td>
                                        </tr>
                                        <?php if ($reward) { ?>
                                        <tr>
                                            <td>
                                                <?php echo $text_reward; ?>
                                            </td>
                                            <td class="product-info-value">
                                                <?php echo $reward; ?>
                                            </td>
                                        </tr>
                                        <?php } ?>
                                        <tr>
                                            <td>
                                                <?php echo $text_stock; ?>
                                            </td>
                                            <td class="product-info-value">
                                                <?php echo $stock; ?>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
<?php } ?>
-->
                       
                       
                        <?php if ($attribute_groups) { ?>

                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTwo">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                        <?php echo $tab_attribute; ?>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                <div class="panel-body">
                                    <table class="product-info">
                                        <?php if ($manufacturer) { ?>
                                        <tr>
                                            <td>
                                                <?php echo $text_manufacturer; ?>
                                            </td>
                                            <td class="product-info-value">
                                                <a href="<?php echo $manufacturers; ?>">
                                                    <?php echo $manufacturer; ?>
                                                </a>
                                            </td>
                                        </tr>
                                        <?php } ?>
                                        <tr>
                                            <td>
                                                <?php echo $text_model; ?>
                                            </td>
                                            <td class="product-info-value">
                                                <?php echo $model; ?>
                                            </td>
                                        </tr> 
                                        <?php if ($reward) { ?>
                                        <tr>
                                            <td>
                                                <?php echo $text_reward; ?>
                                            </td>
                                            <td class="product-info-value">
                                                <?php echo $reward; ?>
                                            </td>
                                        </tr>
                                        <?php } ?>
                                        <tr>
                                            <td>
                                                <?php echo $text_stock; ?>
                                            </td>
                                            <td class="product-info-value">
                                                <?php echo $stock; ?>
                                            </td>
                                        </tr>
                                    </table>
                                    <table class="table table-bordered">
                                      
                                       
                                        <?php foreach ($attribute_groups as $attribute_group) { ?>
                                        <thead>
                                            <tr>
                                                <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                            <tr>
                                                <td>
                                                    <?php echo $attribute['name']; ?>
                                                </td>
                                                <td>
                                                    <?php echo $attribute['text']; ?>
                                                </td>
                                            </tr>
                                            <?php } ?>
                                        </tbody>
                                        <?php } ?>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <?php } ?>
                        

				<?php if($config_file_block_positions == 'file_block_position_after_tabs' and $file_to_product and !$config_file_block_custom_positions_block){ ?>
				  <?php echo $file_to_product; ?>
				<?php } ?>
			
                        <?php if ($products) { ?>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingFin">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFin" aria-expanded="false" aria-controls="collapseFin">
                                        <?php echo $text_related; ?>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseFin" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFin">
                                <div class="panel-body">

                                    <!-- Related START -->

                                    <?php foreach ($products as $product) { ?>

                                    <a class="finishes_links" href="<?php echo $product['href']; ?>">
                                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-4 text-center wrap_re_imgs">
                                            <img style="margin: 0 auto" src="<?php echo $product['thumb']; ?>" class="img-responsive" alt="<?php echo empty( $product['smp_alt_images'] ) ? $product['name'] : $product['smp_alt_images']; ?>" title="<?php echo $product['name']; ?>">
                                            <span class="name_fin"><?php echo $product['name']; ?></span>
                                        </div>
                                    </a>


                                    <?php } ?>

                                    <script>
                                        slo(getClass('finishes_links'))
                                    </script>
                                    <!-- Related END -->
                                </div>
                            </div>

                        </div>
                        <?php } ?>
                        
                        <?php if($products_true) { ?>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingFin">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTrueRel" aria-expanded="false" aria-controls="collapseFin">
                                        Related products 
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseTrueRel" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingFin">
                                <div class="panel-body">
 
                                    <!-- Related START -->

                                    <?php foreach ($products_true as $product) { ?>
                                    <a class="" href="<?php echo $product['href']; ?>">
                                        <div class="col-sm-6 col-xs-4 text-center wrap_re_imgs">
                                            <img style="margin: 0 auto" src="<?php echo $product['thumb']; ?>" class="img-responsive" alt="<?php echo empty( $product['smp_alt_images'] ) ? $product['name'] : $product['smp_alt_images']; ?>" title="<?php echo $product['name']; ?>">
                                            <span class="name_fin"><?php echo $product['name']; ?></span>
                                        </div>
                                    </a>


                                    <?php } ?>
                                    <!-- Related END -->
                                </div>
                            </div>

                        </div>
                        
                        <?php } ?>
                        
                        <?php if ($review_status) { ?>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingThree">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                        <?php echo $tab_review; ?>
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body">
                                    <form class="form-horizontal" id="form-review">
                                        <div id="review"></div>
                                        <h2>
                                            <?php echo $text_write; ?>
                                        </h2>
                                        <?php if ($review_guest) { ?>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                                                <input type="text" name="name" value="" id="input-name" class="form-control" />
                                            </div>
                                        </div>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                                                <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                                                <div class="help-block">
                                                    <?php echo $text_note; ?>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group required">
                                            <div class="col-sm-12">
                                                <label class="control-label"><?php echo $entry_rating; ?></label> &nbsp;&nbsp;&nbsp;
                                                <?php echo $entry_bad; ?>&nbsp;
                                                <input type="radio" name="rating" value="1" /> &nbsp;
                                                <input type="radio" name="rating" value="2" /> &nbsp;
                                                <input type="radio" name="rating" value="3" /> &nbsp;
                                                <input type="radio" name="rating" value="4" /> &nbsp;
                                                <input type="radio" name="rating" value="5" /> &nbsp;
                                                <?php echo $entry_good; ?>
                                            </div>
                                        </div>
                                        <?php echo $captcha; ?>
                                        <div class="buttons clearfix">
                                            <div class="pull-right">
                                                <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                                            </div>
                                        </div>
                                        <?php } else { ?>
                                        <?php echo $text_login; ?>
                                        <?php } ?>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <?php } ?>
                        
                        <div style="height: 5px;">
                            <span id="download_custom"></span>
                        </div>

				<?php if($config_file_block_positions == 'file_block_position_in_tabs' and $file_to_product and !$config_file_block_custom_positions_block){ ?>

                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingWar">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseWar" aria-expanded="false" aria-controls="collapseWar">
                                        <?php echo $tab_file; ?>
                                    </a>
                                </h4>
                            </div>

                            <div id="collapseWar" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingWar">
                                <div class="panel-body">
                                     <?php echo $file_to_product; ?>
                                </div>
                            </div>
                        </div>
				<?php } ?>
			


                    </div>
                    <!-- accordion tabs -->




                    <?php if ($price) { ?>
                    <ul class="list-unstyled product-price hidden">
                        <?php if (!$special) { ?>
                        <li>
                            <h2>
                                <?php echo $price; ?>
                            </h2>
                        </li>
                        <?php } else { ?>
                        <li>
                            <?php if ($special) { ?>
                            <?php } ?> </li>

                        <li>
                            <h2 class="price-new">
                                <?php echo $special; ?>
                            </h2>
                        </li>
                        <li><span class="price-old"><?php echo $price; ?></span></li>
                        <?php } ?>
                        <?php if ($tax) { ?>
                        <li class="product-tax">
                            <?php echo $text_tax; ?>
                            <?php echo $tax; ?>
                        </li>
                        <?php } ?>
                        <?php if ($points) { ?>
                        <li class="product-reward-points">
                            <?php echo $text_points; ?>
                            <?php echo $points; ?>
                        </li>
                        <?php } ?>
                        <?php if ($discounts) { ?>
                        <li>
                            <ul class="product-discounts">
                                <?php foreach ($discounts as $discount) { ?>
                                <li>
                                    <?php echo $discount['quantity']; ?>
                                    <?php echo $text_discount; ?>
                                    <?php echo $discount['price']; ?>
                                </li>
                                <?php } ?>
                            </ul>
                        </li>
                        <?php } ?>
                    </ul>
                    <?php } ?>

                    <!-- Product Options START -->
                    <div id="product" class="product-options">

				<?php if($config_file_block_positions == 'file_block_position_before_options' and $file_to_product and !$config_file_block_custom_positions_block) echo $file_to_product; ?>
			
                        <?php if ($options) { ?>

                        <h3>
                            <?php echo $text_option; ?>
                        </h3>
                        <?php foreach ($options as $option) { ?>
                        <?php if ($option['type'] == 'select') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'radio') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="radio">
                                    <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'checkbox') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="checkbox">
                                    <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'image') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>
                            <div id="input-option<?php echo $option['product_option_id']; ?>">
                                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                                <div class="radio">
                                    <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                                </div>
                                <?php } ?>
                            </div>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'text') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'textarea') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'file') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label"><?php echo $option['name']; ?></label>
                            <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
                            <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'date') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <div class="input-group date">
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'datetime') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <div class="input-group datetime">
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                        </div>
                        <?php } ?>
                        <?php if ($option['type'] == 'time') { ?>
                        <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                            <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                            <div class="input-group time">
                                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
                        </div>
                        <?php } ?>
                        <?php } ?>
                        <?php } ?>
                        <?php if ($recurrings) { ?>

                        <h3>
                            <?php echo $text_payment_recurring ?>
                        </h3>
                        <div class="form-group required">
                            <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
                            <div class="help-block" id="recurring-description"></div>
                        </div>
                        <?php } ?>
                        <div class="form-group product-quantity hidden">
                            <label class="control-label" for="input-quantity"><?php echo $entry_qty; ?></label>
                            <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
                            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                        </div>

                        <?php if ($minimum > 1) { ?>
                        <div class="alert alert-info"><i class="fa fa-info-circle"></i>
                            <?php echo $text_minimum; ?>
                        </div>
                        <?php } ?>
                    </div>
                    <!-- Product Options END -->
                </div>
                <!-- Product option details END -->

                <div class="col-xs-12 col-sm-9 product-images">


                    <?php if ($thumb || $images) { ?>
                    <!-- Product Image thumbnails START -->
                    <div class="thumbnails">

                        <div class="hidden"> 
                            <?php if ($thumb) { ?>

                            <div class="product-image"><a class="thumbnail" href="<?php echo $popup; ?>" title="<?php echo empty( $smp_title_images ) ? $heading_title : $smp_title_images; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo empty( $smp_title_images ) ? $heading_title : $smp_title_images; ?>" alt="<?php echo empty( $smp_alt_images ) ? $heading_title : $smp_alt_images; ?>" /><?php if ($special) { ?> <span class="product-sale-icon">Sale</span> <?php } ?></a></div>
                            <?php } ?>
                        </div>
                        <div class="additional-images-container">
                           
                            <?php if ($images) { ?>
                            <div class="additional-images">
                                <div id="gallery" style="">
                                    

                                    <?php foreach ($images as $image) { ?>


                                    <img alt="" src="<?php echo $image['thumb']; ?>" data-image="<?php echo $image['popup']; ?>" data-description="">



                                    <?php } ?>
                                </div>

                            </div>
                            <?php } ?>
                        </div>
                    </div>

                    <!-- Product Image thumbnails END -->
                    <?php } ?>
   <div class="soc-share product">
      <div class="share-thumb"><i class="fa fa-share-alt" aria-hidden="true"></i></div>
       <ul class="list-inline share-btns">
           <li><a href="https://www.facebook.com/sharer.php?src=pluso&u="><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
           <li><a href="https://twitter.com/intent/tweet?url="><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
           <li><a href="https://plus.google.com/share?url="><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
           <li><a href="https://www.linkedin.com/shareArticle?mini=true&url="><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
       </ul>
   </div>

                </div>

            </div>
            <!-- Product row END -->

        </div>

        <?php echo $column_right; ?>

        <!-- Product nav Tabs START -->
        <div class="col-sm-12 product-tabs hidden">

				<?php if($config_file_block_positions == 'file_block_position_before_tabs' and $file_to_product and !$config_file_block_custom_positions_block) echo $file_to_product;  ?>
			
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#tab-description" data-toggle="tab">
                        <?php echo $tab_description; ?>
                    </a>
                </li>
                <?php if ($attribute_groups) { ?>
                <li>
                    <a href="#tab-specification" data-toggle="tab">
                        <?php echo $tab_attribute; ?>
                    </a>
                </li>
                <?php } ?>
                <?php if ($review_status) { ?>
                <li>
                    <a href="#tab-review" data-toggle="tab">
                        <?php echo $tab_review; ?>
                    </a>
                </li>
                <?php } ?>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab-description">
                    <?php echo $description; ?>
                </div>
                <?php if ($attribute_groups) { ?>
                <div class="tab-pane" id="tab-specification">
                    <table class="table table-bordered">
                        <?php foreach ($attribute_groups as $attribute_group) { ?>
                        <thead>
                            <tr>
                                <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                            <tr>
                                <td>
                                    <?php echo $attribute['name']; ?>
                                </td>
                                <td>
                                    <?php echo $attribute['text']; ?>
                                </td>
                            </tr>
                            <?php } ?>
                        </tbody>
                        <?php } ?>
                    </table>
                </div>
                <?php } ?>
                <?php if ($review_status) { ?>
                <div class="tab-pane" id="tab-review">
                    <form class="form-horizontal" id="form-review">
                        <div id="review"></div>
                        <h2>
                            <?php echo $text_write; ?>
                        </h2>
                        <?php if ($review_guest) { ?>
                        <div class="form-group required">
                            <div class="col-sm-12">
                                <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                                <input type="text" name="name" value="" id="input-name" class="form-control" />
                            </div>
                        </div>
                        <div class="form-group required">
                            <div class="col-sm-12">
                                <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                                <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                                <div class="help-block">
                                    <?php echo $text_note; ?>
                                </div>
                            </div>
                        </div>
                        <div class="form-group required">
                            <div class="col-sm-12">
                                <label class="control-label"><?php echo $entry_rating; ?></label> &nbsp;&nbsp;&nbsp;
                                <?php echo $entry_bad; ?>&nbsp;
                                <input type="radio" name="rating" value="1" /> &nbsp;
                                <input type="radio" name="rating" value="2" /> &nbsp;
                                <input type="radio" name="rating" value="3" /> &nbsp;
                                <input type="radio" name="rating" value="4" /> &nbsp;
                                <input type="radio" name="rating" value="5" /> &nbsp;
                                <?php echo $entry_good; ?>
                            </div>
                        </div>
                        <?php echo $captcha; ?>
                        <div class="buttons clearfix">
                            <div class="pull-right">
                                <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary"><?php echo $button_continue; ?></button>
                            </div>
                        </div>
                        <?php } else { ?>
                        <?php echo $text_login; ?>
                        <?php } ?>
                    </form>
                </div>
                <?php } ?>
            </div>
        </div>
        <!-- Product nav Tabs END -->
        <script type="text/javascript">
            // Carousel Counter
            colsCarousel = $('#column-right, #column-left').length;
            if (colsCarousel == 2) {
                ci = 4;
            } else if (colsCarousel == 1) {
                ci = 4;
            } else {
                ci = 4;
            }

            $(".related-items").owlCarousel({
                items: ci,
                itemsDesktopSmall: [991, 3],
                itemsTablet: [767, 2],
                itemsMobile: [480, 1],
                navigation: true,
                pagination: false
            });
        </script>


        <?php echo $content_bottom; ?>
    </div>
</div>

<script type="text/javascript">
    <!--
    $('select[name=\'recurring_id\'], input[name="quantity"]').change(function() {
        $.ajax({
            url: 'index.php?route=product/product/getRecurringDescription',
            type: 'post',
            data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
            dataType: 'json',
            beforeSend: function() {
                $('#recurring-description').html('');
            },
            success: function(json) {
                $('.alert, .text-danger').remove();

                if (json['success']) {
                    $('#recurring-description').html(json['success']);
                }
            }
        });
    });
    //-->
</script>
<script type="text/javascript">
    <!--
    $('#button-cart').on('click', function() {
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
            success: function(json) {
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

                    if (json['error']['recurring']) {
                        $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
                    }

                    // Highlight any found errors
                    $('.text-danger').parent().addClass('has-error');
                }

                if (json['success']) {
                    $('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

                    $('#cart > button').html(' <i class="fa fa-shopping-cart"></i><span id="cart-total" class="cart-dot cart-dot-sub">' + json['total'] + '</span>');

                    $('html, body').animate({
                        scrollTop: 0
                    }, 'slow');

                    $('#cart > ul').load('index.php?route=common/cart/info ul li');
                }
            },
            error: function(xhr, ajaxOptions, thrownError) {
                alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
            }
        });
    });
    //-->
</script>
<script type="text/javascript">
    <!--
    $('.date').datetimepicker({
        pickTime: false
    });

    $('.datetime').datetimepicker({
        pickDate: true,
        pickTime: true
    });

    $('.time').datetimepicker({
        pickDate: false
    });

    $('button[id^=\'button-upload\']').on('click', function() {
        var node = this;

        $('#form-upload').remove();

        $('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

        $('#form-upload input[name=\'file\']').trigger('click');

        if (typeof timer != 'undefined') {
            clearInterval(timer);
        }

        timer = setInterval(function() {
            if ($('#form-upload input[name=\'file\']').val() != '') {
                clearInterval(timer);

                $.ajax({
                    url: 'index.php?route=tool/upload',
                    type: 'post',
                    dataType: 'json',
                    data: new FormData($('#form-upload')[0]),
                    cache: false,
                    contentType: false,
                    processData: false,
                    beforeSend: function() {
                        $(node).button('loading');
                    },
                    complete: function() {
                        $(node).button('reset');
                    },
                    success: function(json) {
                        $('.text-danger').remove();

                        if (json['error']) {
                            $(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
                        }

                        if (json['success']) {
                            alert(json['success']);

                            $(node).parent().find('input').attr('value', json['code']);
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
                    }
                });
            }
        }, 500);
    });
    //-->
</script>
<script type="text/javascript">
    <!--
    $('#review').delegate('.pagination a', 'click', function(e) {
        e.preventDefault();

        $('#review').fadeOut('slow');

        $('#review').load(this.href);

        $('#review').fadeIn('slow');
    });

    $('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

    $('#button-review').on('click', function() {
        $.ajax({
            url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
            type: 'post',
            dataType: 'json',
            data: $("#form-review").serialize(),
            beforeSend: function() {
                $('#button-review').button('loading');
            },
            complete: function() {
                $('#button-review').button('reset');

            },
            success: function(json) {
                $('.alert-success, .alert-danger').remove();

                if (json['error']) {
                    $('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
                }

                if (json['success']) {
                    $('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

                    $('input[name=\'name\']').val('');
                    $('textarea[name=\'text\']').val('');
                    $('input[name=\'rating\']:checked').prop('checked', false);
                }
            }
        });
    });

    $(document).ready(function() {
        $('.thumbnails').magnificPopup({
            type: 'image',
            delegate: 'a',
            gallery: {
                enabled: true
            }
        });


        $(".product-write-review,.product-total-review").click(function() {
            $('html, body').animate({
                scrollTop: $(".product-tabs").offset().top
            }, 2000);
        });


    });
    //-->
</script>

				<?php if($file and $config_file_block_custom_positions_block){ ?>
				  <script>
					$(document).ready(function(){
						$('<?php echo $config_file_block_custom_positions_block; ?>').<?php echo $config_file_block_custom_positions; ?>($('#files_block').html());
					});
				  </script>
				  <div id="files_block" style="display:none;"><?php echo $file_to_product; ?></div>
				<?php } ?>
			
<?php echo $footer; ?>