<?php
use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '';
$urlManager = Yii::$app->urlManager;
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
                <div class="custom-control">
                    <h4>
                        Aisa
                        <i class="icon ion-ios-male"></i>
                    </h4>
                    <h6>微信号：21312313</h6>
                    <h6>地区：广东 广州</h6>
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