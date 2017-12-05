<div class="slideshow-panel">
    <div class="ttloading-bg ttloader"></div>
    <div id="slideshow<?php echo $module; ?>" class="slideshow-main owl-carousel" style="opacity: 1;">
        <?php foreach ($banners as $banner) { ?>
        <div class="item" style="height: calc(100vh - 120px); width: 100%">
            <?php if($banner['choose'] === 'video') { ?>
            <?php if ($banner['link']) { ?>
            <a href="<?php echo $banner['link']; ?>">
                 <iframe frameborder="0" width="100%" allowfullscreen="" mozallowfullscreen="" webkitallowfullscreen="" src="<?php echo $banner['video_link']; ?>" class="video-frame"></iframe>
                <div class="overlay-video-slide"> 
                    <div class="secondary">
                       <?php if($banner['videoLogo']){ ?>
                            <div class="video-logo"><?php echo html_entity_decode($banner['videoLogo']); ?></div> 
                        <?php } ?>
                        <?php if($banner['videoDesc']){ ?>
                        <div class="video-desk"><?php echo html_entity_decode($banner['videoDesc']); ?></div>
                        <?php } ?>
                    </div>
                </div>
                </a>
            <?php } else { ?>
            <iframe frameborder="0" width="100%" allowfullscreen="" mozallowfullscreen="" webkitallowfullscreen="" src="<?php echo $banner['video_link']; ?>" class="video-frame"></iframe>
            <div class="overlay-video-slide">
                <div class="secondary">
                    <?php if($banner['videoLogo']){ ?>
                    <div class="video-logo">
                        <?php echo html_entity_decode($banner['videoLogo']); ?>
                    </div>
                    <?php } ?>
                    <?php if($banner['videoDesc']){ ?>
                    <div class="video-desk">
                        <?php echo html_entity_decode($banner['videoDesc']); ?>
                    </div>
                    <?php } ?>
                </div>
            </div>
            <?php } ?>
            <?php } else { ?>
            <?php if ($banner['link']) { ?>
            <a href="<?php echo $banner['link']; ?>">
               <div class="image_item_slider" style="background-image: url(<?php echo IMG_PATH . $banner['image']; ?>)"></div> 
                  <div class="overlay-video-slide"> 
                    <div class="secondary">
                       <?php if($banner['videoLogo']){ ?>
                            <div class="video-logo"><?php echo html_entity_decode($banner['videoLogo']); ?></div> 
                        <?php } ?>
                        <?php if($banner['videoDesc']){ ?>
                        <div class="video-desk"><?php echo html_entity_decode($banner['videoDesc']); ?></div>
                        <?php } ?>
                    </div>
                </div>
            </a>
            <?php } else { ?>
             <div class="image_item_slider" style="background-image: url(<?php echo IMG_PATH . $banner['image']; ?>)"></div> 
               <div class="overlay-video-slide"> 
                    <div class="secondary">
                       <?php if($banner['videoLogo']){ ?>
                            <div class="video-logo"><?php echo html_entity_decode($banner['videoLogo']); ?></div> 
                        <?php } ?>
                        <?php if($banner['videoDesc']){ ?>
                        <div class="video-desk"><?php echo html_entity_decode($banner['videoDesc']); ?></div>
                        <?php } ?>
                    </div>
                </div>
            <?php } ?>

            <?php } ?>
        </div>
        <?php } ?>
    </div>
</div>


<script type="text/javascript">
    $('#slideshow<?php echo $module; ?>').owlCarousel({
        items: 6,
        autoPlay: false,
        lazyLoad: true,
        singleItem: true,
        navigation: true,
        navigationText: ['<i class="fa fa-arrow-left fa-1x"></i>', '<i class="fa fa-arrow-right fa-1x"></i>'],
        pagination: true
    });
</script>