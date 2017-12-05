<?php echo $header; ?>
  <div class="row"><?php echo $column_left; ?>
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
			
			<?php echo $content_bottom; ?>    
    </div>
    
    <script>
     if(window.location.href === '<?php echo HTTP_SERVER; ?>' && document.getElementsByTagName('body')[0].clientWidth <= 767){
        let els = document.querySelectorAll('.owl-item .item');
         let vs = document.getElementsByClassName('overlay-video-slide');
        for (let i = 0;  i <= els.length-1; i++){
            els[i].style.height = document.getElementById('content').clientHeight + 'px';
            vs[i].style.height = document.getElementById('content').clientHeight + 'px';
        }
         window.onresize = function(){
            for (let i = 0;  i <= els.length-1; i++){
                els[i].style.height = document.getElementById('content').clientHeight + 'px';
                vs[i].style.height = document.getElementById('content').clientHeight + 'px';
            }
         }
    } 
      </script>
    <?php echo $column_right; ?></div>
<?php echo $footer; ?>