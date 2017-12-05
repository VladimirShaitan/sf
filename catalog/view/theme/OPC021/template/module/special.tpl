<div class="container">
<div class="special-carousel products-list small_product">
<div class="box-heading"><h3><?php echo $heading_title; ?></h3></div>
<div class="special-items products-carousel row">
	<?php 
	$cnt_spe = 1;
	$tcnt_spe = count($products);
	//echo $tcnt_spe;
	?>
  <?php foreach ($products as $product) { ?>
  			<?php
				if($tcnt_spe >= 6) {
				if($cnt_spe % 2 != 0) {
					echo "<div class='single-column'>";
				}
				}
	  		?>
    <div class="product-layouts">
	  <div class="product-thumb transition">
      <div class="image col-sm-5 col-xs-5">
	  	<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
		<?php if ($product['special']) { ?>
		  <div class="sale-icon">Sale</div>
		<?php } ?>
	  </div>
	  <div class="thumb-description col-sm-7 col-xs-7">
      <div class="caption">
	    <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
		 <!--<p class="description"><?php echo $product['description']; ?></p>-->
		 <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
		<div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star off fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
       	 </div>
        <div class="button-group">
        <button class="btn-cart" data-toggle="tooltip" title="<?php echo $button_cart; ?>" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span>
		</button>
        <button class="btn-wishlist" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i>
		</button>
        <button class="btn-compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i>
		</button>
      </div>
	  </div>
	  </div>
    </div>
		<?php
				if($tcnt_spe >= 6) {
				if($cnt_spe % 2 == 0) {
					echo '</div>';
				}
				}

				$cnt_spe++;
	  		?>
		
	
  <?php } //For Each End  
  		  $cnt_spe = 1;
		  if($tcnt_spe >= 6) { if($tcnt_spe % 2 != 0) { echo '</div>'; } }
  ?> 
</div>
</div>
</div>
<script	 type="text/javascript">
// product Carousel
var bannerproduct = $(".special-items.products-carousel");
    bannerproduct.owlCarousel({
	items:3,
    itemsDesktop : [1170,3],
    itemsDesktopSmall : [991,2],
    itemsTablet: [767,2],
    itemsMobile : [480,1],
	pagination: false,
	navigation: true
      });
</script>