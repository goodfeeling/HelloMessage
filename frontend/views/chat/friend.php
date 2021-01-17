<?php
use yii\helpers\Url;
use \common\services\StaticServices;
/* @var $this yii\web\View */

$this->title = '';
$urlManager = Yii::$app->urlManager;

StaticServices::includeAppJsStatic('@web/js/chat/friend.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);

?>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<!-- App Capsule -->
<div id="appCapsule">
    <div class="appContent">
        <div class="contentList">
            <img src="fornt/img/sample/avatar.jpg" alt="image" class="imageBlock large rounded">

            <div>
                <div class="text-muted">
                    <h4>
                        Aisa
                        <i class="icon ion-ios-female"></i>
                    </h4>
                    <small>微信号：21312313</small><br>
                    <small>地区：<i class="icon ion-ios-pin mr-1"></i>广东 广州</small>
                </div>
            </div>
            <div style="margin-right: 14rem"></div>
        </div>
        <div class="contentList">
            <div>
                设置备注和标签
            </div>
            <div>
                <div class="custom-control">
                    <i class="icon ion-ios-arrow-forward"></i>
                </div>
            </div>
        </div>

        <div class="contentList">
            <div>朋友权限</div>
            <div>
                <div class="custom-control">
                    <i class="icon ion-ios-arrow-forward"></i>
                </div>
            </div>
        </div>

        <div class="contentList">
            <div>朋友圈</div>
            <div>
                <div class="custom-control">
                    <i class="icon ion-ios-arrow-forward"></i>
                </div>
            </div>
        </div>

        <div class="contentList">
            <div>更多信息</div>
            <div>
                <div class="custom-control ">
                    <i class="icon ion-ios-arrow-forward"></i>
                </div>
            </div>
        </div>

        <a href="#" class="btn btn-outline-primary btn-lg btn-block mt-2">
            <i class="icon ion-ios-chatbubbles"></i>
            信息
        </a>
        <a href="#" class="btn btn-outline-primary btn-lg btn-block mt-2">
            <i class="icon ion-ios-camera"></i>
            视频
        </a>
    </div>
</div>
<!-- appCapsule -->