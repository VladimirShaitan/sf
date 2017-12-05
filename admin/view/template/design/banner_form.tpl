<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-banner" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>

  <script>
                    function d(el) {return document.getElementById(el);}
                    function c(el){return document.getElementsByClassName(el)[0]}
</script>
  <div class="container-fluid">
     <div style="display: inline-block; padding: 10px; margin: 0 0 10px; border: 2px dashed #ccc;">
     Here you can find or create your own video for slider: <a style="padding: 3px 9px; display: inline-block; background: rgba(0, 0, 0, 0.73); color: white; margin-bottom: 8px;" href="https://vimeo.com/">VIMEO</a> <br>
     Default link for video <br>
     <a href="//player.vimeo.com/video/109094695?title=0&amp;byline=0&amp;portrait=0&amp;autoplay=1&amp;loop=1">//player.vimeo.com/video/109094695?title=0&amp;byline=0&amp;portrait=0&amp;autoplay=1&amp;loop=1</a>
  </div>
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-banner" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <table id="images" class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <td class="text-left"><?php echo $entry_title; ?></td>
                <td class="text-left"><?php echo $entry_link; ?></td>
                <td id="himg" class="text-left"><?php echo $entry_image; ?></td>
                <td>Video or image</td>
                <td class="text-right"><?php echo $entry_sort_order; ?></td>
                <td></td>
              </tr>
            </thead>
            <tbody>
              <?php $image_row = 0; ?>
              <?php foreach ($banner_images as $banner_image) { ?>
              <tr id="image-row<?php echo $image_row; ?>">
                <td class="text-left" style="width: 15%"><?php foreach ($languages as $language) { ?>
                  <div class="input-group pull-left"><span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> </span>
                    <input type="text" name="banner_image[<?php echo $image_row; ?>][banner_image_description][<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($banner_image['banner_image_description'][$language['language_id']]) ? $banner_image['banner_image_description'][$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_title; ?>" class="form-control" />
                  </div>
                  <?php if (isset($error_banner_image[$image_row][$language['language_id']])) { ?>
                  <div class="text-danger"><?php echo $error_banner_image[$image_row][$language['language_id']]; ?></div>
                  <?php } ?>
                  <?php } ?></td>
                <td class="text-left" style="width: 30%;">
                    <input type="text" name="banner_image[<?php echo $image_row; ?>][link]" value="<?php echo $banner_image['link']; ?>" placeholder="<?php echo $entry_link; ?>" class="form-control" />
                    
                    <input type="text" name="banner_image[<?php echo $image_row; ?>][videoLogo]" value="<?php echo $banner_image['videoLogo']; ?>" placeholder="Inscription" class="form-control" />
                    
                    
                    <textarea name="banner_image[<?php echo $image_row; ?>][videoDesc]" id="" placeholder="Decription" cols="10" class="form-control" rows="5"><?php echo $banner_image['videoDesc']; ?></textarea>
                    
                    
<!--                    <input type="text" name="banner_image[<?php echo $image_row; ?>][videoDesc]" value="<?php echo $banner_image['videoDesc']; ?>" placeholder="Decription" class="form-control" />-->
                </td>
                
                <td class="text-left">
                 <a href="" style="width: 110px; height: 110px" id="thumb-image<?php echo $image_row; ?>" data-toggle="image" class="img-thumbnail a-<?php echo $image_row; ?>">
                     <img id="img-sl-th<?php echo $image_row; ?>" src="<?php echo $banner_image['thumb']; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" />
                 </a>
                 
                <input type="hidden" name="banner_image[<?php echo $image_row; ?>][image]" value="<?php echo $banner_image['image']; ?>" id="input-image<?php echo $image_row; ?>"  class="form-control"/>
                
                <input id="input-video<?php echo $image_row; ?>" type="hidden" class="form-control" name="banner_image[<?php echo $image_row; ?>][video_link]" value="<?php echo $banner_image['video_link']; ?>" placeholder="video link">
                 </td>
                  
                <td class="text-left" style="width: 10%;">                    
                    <select name="banner_image[<?php echo $image_row; ?>][choose]" class="form-control" id="s-<?php echo $image_row; ?>">
                        <option value="image" <?php if($banner_image["choose"] === "image") {echo "selected";} elseif(!isset($banner_image["choose"])) {echo "selected";} ?>>Image</option>
                        <option value="video" <?php if($banner_image["choose"] === "video") {echo "selected";} ?>>Video</option>
                    </select>
                </td>
                  
                <script>
                        if(d("s-<?php echo $image_row; ?>")[1].selected === true){
                            c("a-<?php echo $image_row; ?>").style.display = "none";
                            d("img-sl-th<?php echo $image_row; ?>").src = "";
                            d("input-video<?php echo $image_row; ?>").type = "text";
                            d("input-image<?php echo $image_row; ?>").value = "catalog/novalue.png";
                        } else {
                            c("a-<?php echo $image_row; ?>").style.display = "block";
                            d("input-video<?php echo $image_row; ?>").type = "hidden";
                            d("input-video<?php echo $image_row; ?>").value = "";
                        }
                    
                    d("s-<?php echo $image_row; ?>").onchange = function() {
                        if(d("s-<?php echo $image_row; ?>")[1].selected === true){
                            c("a-<?php echo $image_row; ?>").style.display = "none";
                            d("img-sl-th<?php echo $image_row; ?>").src = d("img-sl-th<?php echo $image_row; ?>").getAttribute("data-placeholder");
                            d("input-video<?php echo $image_row; ?>").type = "text";
                            d("input-image<?php echo $image_row; ?>").value = "catalog/novalue.png"; 
                        } else {
                            c("a-<?php echo $image_row; ?>").style.display = "block";
                            d("input-video<?php echo $image_row; ?>").type = "hidden";
                            d("input-video<?php echo $image_row; ?>").value = "";
                        }
                    }
                </script>  
                  
                <td class="text-right" style="width: 10%;"><input type="text" name="banner_image[<?php echo $image_row; ?>][sort_order]" value="<?php echo $banner_image['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>
                <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>, .tooltip').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button>
              </tr>
              <?php $image_row++; ?>
              <?php } ?>
            </tbody>
            <tfoot>
              <tr>
                <td colspan="5"></td>
                <td class="text-left" style="width: 1%"><button type="button" onclick="addImage();" data-toggle="tooltip" title="<?php echo $button_banner_add; ?>" class="btn btn-primary"><i class="fa fa-plus-circle"></i></button></td>
              </tr>
            </tfoot>
          </table>
        </form>
      </div>
    </div>
  </div>
  <script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
	html  = '<tr id="image-row' + image_row + '">';
    html += '  <td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '    <div class="input-group">';
	html += '      <span class="input-group-addon"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /></span><input type="text" name="banner_image[' + image_row + '][banner_image_description][<?php echo $language['language_id']; ?>][title]" value="" placeholder="<?php echo $entry_title; ?>" class="form-control" />';
    html += '    </div>';
	<?php } ?>
	html += '  </td>';	
	html += '  <td class="text-left" style="width: 30%;"><input type="text" name="banner_image[' + image_row + '][link]" value="" placeholder="<?php echo $entry_link; ?>" class="form-control" />';
    html+= '<input type="text" name="banner_image[' + image_row + '][videoLogo]" value="" placeholder="Inscription" class="form-control" />'               
    html+= '<textarea name="banner_image[' + image_row + '][videoDesc]" id="" placeholder="Decription" cols="10" class="form-control" rows="5"></textarea>'
    html+= '</td>'
	html += '  <td class="text-left"><a href="" style="width: 110px; height: 110px" id="thumb-image' + image_row + '" data-toggle="image" class="img-thumbnail a-' + image_row + '"><img id="img-sl-th' + image_row + '" src="<?php echo $placeholder; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a><input type="hidden" class="form-control" name="banner_image[' + image_row + '][image]" value="" id="input-image' + image_row + '" /><input id="input-video' + image_row + '" class="form-control" type="hidden" name="banner_image[' + image_row + '][video_link]" value="" placeholder="video link"></td>';
    html+='<td class="text-left" style="width: 10%;">  '                  
    html+='<select name="banner_image[' + image_row + '][choose]" class="form-control" id="s-' + image_row + '">'
    html+='<option value="image">Image</option>'
    html+='<option value="video">Video</option>'
    html+='</select>'
    html+='</td>'
    html+='<script>'
    html+= 'd("s-' + image_row + '").onchange = function() {'
    html+= 'if(d("s-' + image_row + '")[1].selected === true){'
    html+=  'c("a-' + image_row + '").style.display = "none";'
    html+=  'd("img-sl-th' + image_row + '").src = d("img-sl-th' + image_row + '").getAttribute("data-placeholder");'
    html+=  'd("input-video' + image_row + '").type = "text";'
    html+=  'd("input-image' + image_row + '").value = "catalog/novalue.png";'
    html+=  '} else {'
    html+=  'c("a-' + image_row + '").style.display = "block";'
    html+=  'd("input-video' + image_row + '").type = "hidden";'
    html+=  'd("input-video' + image_row + '").value = "";'
    html+=  '}'
    html+=  '}'
    html+= '</'
    html+= 'script>'
	html += '  <td class="text-right" style="width: 10%;"><input type="text" name="banner_image[' + image_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
	html += '</tr>';
	
	$('#images tbody').append(html);
	
	image_row++;
}
//--></script></div>
<?php echo $footer; ?>
