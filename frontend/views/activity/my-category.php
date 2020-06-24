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

        <div class="card mb-3 mt-2">

            <div class="card-header">
                Card Header
            </div>

            <div class="card-body">
                <h5 class="card-title">Card with Footer</h5>
                <p class="card-text">With supporting text below.</p>
                <button type="button" class="btn btn-primary shadowed mr-1 mb-1">付费</button>
                <button type="button" class="btn btn-secondary shadowed mr-1 mb-1">签到</button>
            </div>

            <div class="card-footer">

                <span class="badge badge-primary iconed mr-1 mb-1">
                    <i class="icon ion-ios-checkmark"></i>
                    未付费
                </span>

                <span class="badge badge-success iconed mr-1 mb-1">
                    <i class="icon ion-ios-close"></i>
                    未签到
                </span>

            </div>

        </div>

    </div>

</div>