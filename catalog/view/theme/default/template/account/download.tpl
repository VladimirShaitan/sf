<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li>
            <a href="<?php echo $breadcrumb['href']; ?>">
                <?php echo $breadcrumb['text']; ?>
            </a>
        </li>
        <?php } ?>
    </ul>
    <div class="row acc">
        <h1 class="text-center">
            <?php echo $heading_title; ?>
        </h1>
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-10'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>">
            <?php echo $content_top; ?>
            <?php if ($downloads) { ?>
            <div class="downloads_wrapper">
                <?php foreach ($downloads as $download) { ?>
                <div class="col-sm-4">
                    <div class="dw-cont-wrapper">
                        <img src="<?php echo IMG_PATH . $download['image']; ?>" class="img-responsive" alt="">
                        <div class="dw_name">
                            <?php echo $download['name']; ?>
                        </div>
                        <div class="">
                            <a href="<?php echo $download['href']; ?>" data-toggle="tooltip" class="btn btn-primary">
                                <?php echo $button_download; ?> (
                                <?php echo $download['size']; ?>)</a>
                        </div>
                    </div>
                </div>


                <?php } ?>
            </div>


            <div class="row">
                <div class="col-sm-6 text-left">
                    <?php echo $pagination; ?>
                </div>
<!--
                <div class="col-sm-6 text-right">
                    <?php echo $results; ?>
                </div>
-->
            </div>
            <?php } else { ?>
            <p>
                <?php echo $text_empty; ?>
            </p>
            <?php } ?>
            <!--
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
-->
            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<?php echo $footer; ?>