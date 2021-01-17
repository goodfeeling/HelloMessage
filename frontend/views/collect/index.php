<?php
use yii\helpers\Url;
use \common\services\StaticServices;
/* @var $this yii\web\View */

$this->title = '我的收藏';
$urlManager = Yii::$app->urlManager;

StaticServices::includeAppJsStatic('@web/js/collect/index.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);

?>

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<!-- App Capsule -->
<div id="appCapsule">

    <div class="appContent">

        <ul class="nav nav-tabs size3 iconed" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab">
                    <i class="icon ion-ios-home"></i>
                    Home
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab">
                    <i class="icon ion-ios-person"></i>
                    Profile
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab">
                    <i class="icon ion-ios-podium"></i>
                    Contact
                </a>
            </li>
        </ul>

        <div class="divider mt-3 mb-3"></div>

        <div class="tab-content mt-3" id="myTabContent">
            <div class="tab-pane fade show active" id="home" role="tabpanel">
                Home Tab
            </div>
            <div class="tab-pane fade" id="profile" role="tabpanel">
                Profile Tab
            </div>
            <div class="tab-pane fade" id="contact" role="tabpanel">
                Contact Tab
            </div>
        </div>
    </div>
</div>
<!-- appCapsule -->