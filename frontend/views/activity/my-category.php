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
                    活动时间：<?= $value['addtime'] . '~' . $value['endtime'] ?>
                </div>

                <div class="card-body">
                    <h5 class="card-title"><?= $value['name'] ?></h5>
                    <p class="card-text"><?= $value['theme'] ?></p>
                    <?php if (!$value['is_pay']): ?>
                        <button type="button" id="goPayPage" class="btn btn-primary shadowed mr-1 mb-1">付费</button>
                    <?php endif; ?>

                    <?php if (!$value['is_join']): ?>
                        <button type="button" id="signIn" class="btn btn-secondary shadowed mr-1 mb-1">签到</button>
                    <?php endif; ?>
                </div>

                <div class="card-footer">
                        <span class="badge badge-primary iconed mr-1 mb-1">
                            <?php if ($value['is_pay']): ?>
                                    <i class="icon ion-ios-checkmark"></i>
                                    已付费
                            <?php else: ?>
                                    <i class="icon ion-ios-close"></i>
                                    未付费
                            <?php endif; ?>
                        </span>

                        <span class="badge badge-success iconed mr-1 mb-1">
                            <?php if ($value['is_join']): ?>
                                    <i class="icon ion-ios-checkmark"></i>
                                    已签到
                            <?php else: ?>
                                    <i class="icon ion-ios-close"></i>
                                    未签到
                            <?php endif; ?>
                        </span>
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
    $('#signIn').on('click',function (e) {

    });
</script>