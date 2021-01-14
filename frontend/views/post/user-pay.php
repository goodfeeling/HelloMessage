<?php

use yii\helpers\Url;
use \common\services\StaticServices;

/* @var $this yii\web\View */

$this->title = '参加成功';
$urlManager = Yii::$app->urlManager;

StaticServices::includeAppJsStatic('@web/js/post/user-pay.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);

?>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<!-- App Capsule -->
<div id="appCapsule">
    <div class="appContent">
        <div class="splashBlock">
            <div class="splashIcon text-primary mt-3 mb-3">
                <i class="icon ion-ios-checkmark"></i>
            </div>

            <div class="sectionTitle text-center">
                <div class="title">
                    <h1>非常感谢 <br>您的参加!</h1>
                </div>
                <div class="lead">
                    请您支付活动报名相关费用。
                </div>
            </div>

            <footer>
                <div class="row">
                    <div class="col-6">
                        <button type="button" class="btn btn-secondary btn-block">再想想</button>
                    </div>
                    <div class="col-6">
                        <button type="button" id="goPay" class="btn btn-primary btn-block">去支付</button>
                    </div>
                </div>
            </footer>
        </div>
    </div>
</div>
<!-- appCapsule -->
