<?php

use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '我的活动';
?>

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/default-header.php'); ?>
<!-- * App Header -->

<!-- App Capsule -->
<div id="appCapsule">

    <div class="appContent">
        <?php foreach ($data as $key => $value) : ?>
            <div class="card mb-3 mt-2">

                <div class="card-header">
                    <small>活动时间：</small>
                    <small><?= $value['addtime'] . '~' . $value['endtime'] ?></small>
                </div>

                <div class="card-body">
                    <h5 class="card-title"><?= $value['name'] ?></h5>
                    <p class="card-text"><?= $value['theme'] ?></p>
                    <?php if (!$value['is_pay']): ?>
                        <button type="button" id="goPayPage" class="btn btn-primary shadowed mr-1 mb-1">付费</button>
                    <?php endif; ?>

                    <?php if (!$value['is_join']): ?>
                        <a href="#msg_text_primary"  class="btn btn-secondary shadowed mr-1 mb-1 signIn">签到</a>
                    <?php endif; ?>
                </div>

                <div class="card-footer">
                    <?php if ($value['is_pay']): ?>
                        <span class="badge badge-success iconed mr-1 mb-1">
                                    <i class="icon ion-ios-checkmark"></i>
                                    已付费
                                </span>
                    <?php else: ?>
                        <span class="badge badge-primary iconed mr-1 mb-1">
                                     <i class="icon ion-ios-close"></i>
                                    未付费
                                </span>
                    <?php endif; ?>

                            <?php if ($value['is_join']): ?>
                                <span class="badge badge-success iconed mr-1 mb-1">
                                    <i class="icon ion-ios-checkmark"></i>
                                    已签到
                                </span>
                            <?php else: ?>
                                <span class="badge badge-primary iconed mr-1 mb-1">
                                     <i class="icon ion-ios-close"></i>
                                    未签到
                                </span>
                            <?php endif; ?>
                </div>
            </div>
        <?php endforeach ?>
    </div>

</div>

<script>
    // 微信支付
    $('#goPayPage').on('click',function (e) {

    });

    // 生成一个二维码
    $('.signIn').on('click',function (e) {


        $('.weui-msg-top').show();
    });
    $('#the-msg-back').on('click',function (e) {
        $('.weui-msg-top').hide();
    })
</script>