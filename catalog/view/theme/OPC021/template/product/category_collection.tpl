<?php echo $header; ?>
<div class="container product-category">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li>
            <a href="<?php echo $breadcrumb['href']; ?>">
                <?php echo $breadcrumb['text']; ?>
            </a>
        </li>
        <?php } ?>
    </ul>
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
            <!-- Category Description START -->
            <h1 class="category-name">
                <?php echo $heading_title; ?>
            </h1>
            <?php if ($description) { ?>
            <div class="category-description">
                <div class="row">

                </div>
            </div>
            <?php } ?>
            <!-- Category Description END -->

            <!-- Category listing START -->
            <?php if ($categories) { ?>
            <div class="row">
                <?php foreach ($categories as $category) { ?>


                <!--
                    <div class="col-lg-3 col-sm-4">
                        <div class="class-list-item clearfix">

                            <a href="<?php echo $category['href']; ?>">
                                <?php if(!empty($category['thumb'])) {?>
                                <div class="rel_cat_img_holder"><img src="<?php echo './image/'. $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></div>
                                <?php } ?>
                                <span class="related_cat_name"><?php echo $category['name']; ?></span>
                            </a>
                        </div>
                    </div>
--> 


                <div class="product-layout product-list two-per-row col-sm-6 col-xs-12">
                    <div class="product-thumb row">


                        <div class="thumb-description col-sm-12">
                            <div class="caption">


                                <h4 class="text-center">
                                    <a href="<?php echo $category['href']; ?>">
                                        <?php echo $category['name']; ?>
                                        <!--                                           <?php echo $category['id']; ?>-->

                                    </a>
                                </h4>

<!--
                                <div class="rel_cat_description description text-justify">
                                    <?php // echo html_entity_decode($category['description']); ?>
                                </div>
-->

                               
                               

                                
                                
                            </div>



                            <!--
<pre>
                                <?php print_r($category['categ_2']); ?>
                            </pre>
-->
                        </div>
                        <div class="">
                            <a href="<?php echo $category['href']; ?>"><img src="<?php echo './image/'. $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" /></a>
                        </div>
                             <?php if ($category['ch_products']) { ?>
                                <div class="finishes-cat-block colect-block ch_cat ch_hid clearfix">
<!--                                    <h4>Child products</h4> -->
                                        <ul class="list-inline multiple-cats-collect" style="width: calc(100% - 5px);">
                                            <?php foreach ($category['ch_products'] as $ch_prod) { ?>
                                            <li>
                                                <a class="finCatLink" href="<?php echo $ch_prod['href']; ?>">
                                 <img src="<?php echo $ch_prod['image']; ?>" class="img-responsive" style="margin: 0 auto" alt="<?php echo $ch_prod['name']; ?>" title="<?php echo $ch_prod['name']; ?>">  
                                 <div class="text-center">
                                     <?php echo $ch_prod['name']; ?>
                                 </div>
                               </a>
                                            </li>
                                            <?php } ?>
                                        </ul>

                                </div>
                                <?php } elseif($category['categ_2']) { ?>

                                <div class="finishes-cat-block colect-block ch_cat ch_hid clearfix">
<!--                                    <h4>Child categories</h4>-->
                                        <ul class="list-inline multiple-cats-collect" style="width: calc(100% - 5px);"> 
                                            <?php foreach ($category['categ_2'] as $child_cat) { ?>
                                            <li>
                                                <a class="finCatLink" href="<?php echo $child_cat['href']; ?>">
                                 <img src="<?php echo $child_cat['image']; ?>" class="img-responsive" style="margin: 0 auto" alt="<?php echo $child_cat['name']; ?>" title="<?php echo $child_cat['name']; ?>">  
                                 <div class="text-center">
                                     <?php echo $child_cat['name']; ?>
                                 </div>
                               </a>
                                            </li>
                                            <?php } ?>
                                        </ul>

                                </div>
                                <?php } ?>
                    </div>
                </div>


                <?php } ?>

            </div>
            <?php } ?>
            <!-- Category listing END -->






            <?php if ($products) { ?>

            <!-- Category filter START -->
            <p class="category-compare hidden">
                <a href="<?php echo $compare; ?>" id="compare-total">
                    <?php echo $text_compare; ?>
                </a>
            </p>
            <div class="category-filter hidden">
                <!-- Grid-List Buttons -->
                <div class="col-md-2 filter-grid-list">
                    <div class="btn-group">
                        <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>
                        <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>
                    </div>
                </div>
                <!-- Show Products Selection -->
                <div class="filter-show">
                    <div class="col-md-4 text-right filter-text">
                        <label class="control-label" for="input-limit"><?php echo $text_limit; ?></label>
                    </div>
                    <div class="col-md-8 text-right filter-selection">
                        <select id="input-limit" class="form-control" onchange="location = this.value;">
					<?php foreach ($limits as $limits) { ?>
					<?php if ($limits['value'] == $limit) { ?>
					<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
                    </div>
                </div>
                <!-- Sort By Selection -->
                <div class="filter-sort-by">
                    <div class="col-md-3 text-right filter-text">
                        <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
                    </div>
                    <div class="col-md-9 text-right filter-selection">
                        <select id="input-sort" class="form-control" onchange="location = this.value;">
					<?php foreach ($sorts as $sorts) { ?>
					<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
					<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
					<?php } ?>
					<?php } ?>
				  </select>
                    </div>
                </div>
            </div>
            <!-- Category filter END -->

            <!-- Category products START -->
            <div class="category-products">
                <div class="row">
                    <?php foreach ($products as $product) { ?>
                    <div class="product-layout product-list col-xs-12">
                        <!--
<pre>
                    <?php print_r($product['related']) ?>
                </pre>
-->

                        <div class="product-thumb row">


                            <div class="thumb-description col-sm-4">
                                <div class="caption">


                                    <h4>
                                        <a href="<?php echo $product['href']; ?>">
                                            <?php echo $product['name']; ?>
                                        </a>
                                    </h4>
                                    <div class="size_cat">
                                        <?php echo floor($product['length']); ?>w X
                                        <?php echo floor($product['width']); ?>d X
                                        <?php echo floor($product['height']); ?>h
                                    </div>

                                    <!--
                                    <mark class="hidden"><?php echo $product['product_id']; ?></mark>
                                    <mark class="hidden"><pre class="" style="height: 300px; overflow: scroll"><?php print_r($product['related']); ?></pre></mark>
-->



                                    <div class="rating hidden">
                                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                                        <?php if ($product['rating'] < $i) { ?>
                                        <span class="fa fa-stack"><i class="fa fa-star off fa-stack-2x"></i></span>
                                        <?php } else { ?>
                                        <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i></span>
                                        <?php } ?>
                                        <?php } ?>
                                    </div>
                                    <p class="description">
                                        <?php echo $product['description']; ?>
                                    </p>

                                    <?php if ($product['related']) { ?>
                                    <div class="finishes-cat-block ch_hid">
                                        <h4>Finishes Available</h5>
                                            <ul class="list-inline fin_list multiple-items" id="" style="width: 330px">
                                                <?php foreach ($product['related'] as $releted) { ?>
                                                <li>
                                                    <a class="finCatLink" href="<?php echo $releted['href']; ?>">
                                 <img src="<?php echo $releted['image']; ?>" class="img-responsive" alt="<?php echo $releted['name']; ?>" title="<?php echo $releted['name']; ?>">
                               </a>
                                                </li>
                                                <?php } ?>
                                            </ul>
                                            <script>
                                                slo(getClass('finCatLink'))
                                            </script>
                                    </div>
                                    <?php } ?>



                                    <!--
                                    <?php if ($product['price']) { ?>
                                    <div class="price hidden">
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
-->
                                </div>
                                <div class="button-group hidden">
                                    <button class="btn-cart" type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i>
		<span class="hidden-xs hidden-sm hidden-md"><?php echo $button_cart; ?></span>
		<span class="tooltip-cart"><?php echo $button_cart; ?></span>
		</button>
                                    <button class="btn-wishlist" title="<?php echo $button_wishlist; ?>" data-toggle="tooltip" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i>
		</button>
                                    <button class="btn-compare" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i>
		</button>
                                </div>
                            </div>
                            <div class="image col-sm-8">
                                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
                                <?php if ($product['special']) { ?>
                                <div class="sale-icon">Sale</div>
                                <?php } ?>
                            </div>
                        </div>
                    </div>
                    <?php } ?>

                </div>
            </div>
            <!-- Category products END -->

            <!-- Category pagination START -->
            <div class="category-pagination">
                <div class="col-xs-6 text-left">
                    <?php echo $results; ?>
                </div>
                <div class="col-xs-6 text-right">
                    <?php echo $pagination; ?>
                </div>
            </div>
            <!-- Category pagination END -->

            <?php } ?>

            <?php if (!$categories && !$products) { ?>
            <p class="text-empty">
                <?php echo $text_empty; ?>
            </p>
            <div class="buttons">
                <div class="pull-right">
                    <a href="<?php echo $continue; ?>" class="btn btn-primary">
                        <?php echo $button_continue; ?>
                    </a>
                </div>
            </div>
            <?php } ?>
            <!--            <?php echo $content_bottom; ?>-->
        </div>
        <?php if ($description) { ?>
        <div class="col-sm-12 category-content">
            <?php echo $description; ?>
        </div>
        <?php } ?>
        <!--        <pre><?php echo $category_type; ?></pre>-->

        <?php echo $column_right; ?>
    </div>
</div>

<?php echo $footer; ?>