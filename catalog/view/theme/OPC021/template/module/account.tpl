<?php if ($logged) { ?>

<div class="panel panel-default account-list">
    <div class="panel-heading acc_mod">
        <?php echo $heading_title; ?>
    </div>
    <div class="list-group">
        <!--
        <?php // if (!$logged) { ?>
                <a href="<?php echo $download; ?>" class="list-group-item">
            <?php // echo $text_download; ?>
        </a>
        <a href="<?php echo $account; ?>" class="list-group-item">
            <?php // echo $text_account; ?>
        </a>
        <a href="<?php echo $login; ?>" class="list-group-item">
            <?php // echo $text_login; ?>
        </a>
        <a href="<?php echo $register; ?>" class="list-group-item">
            <?php // echo $text_register; ?>
        </a>
        <a href="<?php echo $forgotten; ?>" class="list-group-item">
            <?php // echo $text_forgotten; ?>
        </a>
        <?php // } ?>
-->


        <a href="<?php echo $download; ?>" class="list-group-item">
            <?php echo $text_download; ?>
        </a>
        <a href="<?php echo $account; ?>" class="list-group-item">
            <?php echo $text_account; ?>
        </a>
        <a href="<?php echo $edit; ?>" class="list-group-item">
            <?php echo $text_edit; ?>
        </a>
        <a href="<?php echo $password; ?>" class="list-group-item">
            <?php echo $text_password; ?>
        </a>
        <a href="<?php echo $address; ?>" class="list-group-item">
            <?php echo $text_address; ?>
        </a>
        <!--
        <a href="<?php echo $order; ?>" class="list-group-item">
            <?php // echo $text_order; ?>
        </a>
-->
        <a href="<?php echo $transaction; ?>" class="list-group-item">
            <?php echo $text_transaction; ?>
        </a>
        <!--
        <a href="<?php echo $newsletter; ?>" class="list-group-item">
            <?php // echo $text_newsletter; ?>
        </a>
-->
        <a href="<?php echo $logout; ?>" class="list-group-item">
            <?php echo $text_logout; ?>
        </a>


        <!--
        <a href="<?php echo $wishlist; ?>" class="list-group-item">
            <? //php echo $text_wishlist; ?>
        </a>
-->

        <!--
        <a href="<? //php echo $recurring; ?>" class="list-group-item">
            <?php echo $text_recurring; ?>
        </a>

        <a href="<?php echo $reward; ?>" class="list-group-item">
            <? //php echo $text_reward; ?>
        </a>

        <a href="<?//php echo $return; ?>" class="list-group-item">
            <?php echo $text_return; ?>
        </a>


        <?php // if ($logged) { ?>

        <?php // } ?>
-->
    </div>
</div>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Request Form
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width: 100%">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Sample Request Form</h4>
            </div>
            <div class="modal-body">
                <div class="col-xs-12">
                    <div id="success_msg" style="display:none">
                        Your message has been sent
                    </div>
                </div>
                <form action method="post" class="clearfix" id="feedback">
                    <div class="form-group col-xs-6 pull-left">
                        <input placeholder="Name*" style="margin-bottom: 10px" type="text" required name="name" required value="" class="form-control">
                        <input type="text" placeholder="Second name*" required name="secname" required value="" class="form-control">
                    </div>
                    <div class="form-group col-xs-6 pull-right">
                        <input type="tel" style="margin-bottom: 10px" placeholder="Phone*" required name="phone" value="" class="form-control">
                        <input type="email" placeholder="Email*" required name="email" value="" class="form-control">
                    </div>

                    <div class="form-group col-xs-12">

                        <textarea name="company" placeholder="Company*" required class="form-control" rows="6"></textarea>
                    </div>

                </form>


            </div>
            <div class="modal-footer">
                <div class="form-group col-xs-12">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <input type="submit" name="submit" form="feedback" value="Send request" class="btn btn-success" />
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function() {
        $("#feedback").submit(function() {
            var form = $(this);
            var error = false;
            form.find('input, textarea').each(function() {
                if ($(this).val() == '') {
                    alert('Зaпoлнитe пoлe "' + $(this).attr('placeholder') + '"!');
                    error = true;
                }
            });
            if (!error) {
                var data = form.serialize();
                $.ajax({
                    type: 'POST',
                    url: '/send.php',
                    dataType: 'json',
                    data: data,
                    beforeSend: function(data) {
                        form.find('input[type="submit"]').attr('disabled', 'disabled');
                    },
                    success: function(data) {
                        if (data['error']) {
                            alert(data['error']);
                        } else {
                            $("#success_msg").show();
                            document.getElementById("feedback").reset();
                        }
                    },
                    error: function(xhr, ajaxOptions, thrownError) {
                        alert(xhr.status);
                        alert(thrownError);
                    },
                    complete: function(data) {
                        form.find('input[type="submit"]').prop('disabled', false);
                    }

                });
            }
            return false; // вырубaeм стaндaртную oтпрaвку фoрмы
        });
    });
</script>



<?php } ?>