<?php
use yii\helpers\Url;
use common\services\StaticServices;
/* @var $this yii\web\View */

$this->title = '我的好友';
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
        <!-- listview -->
        <div class="listView">
            <a href="<?= Url::to(['chat/friend']) ?>" class="listItem">
                <div class="image">
                    <img src="fornt/img/sample/avatar.jpg" alt="avatar">
                </div>
                <div class="text">
                    <div>
                        <strong>Carmen Beltrán</strong>
                    </div>
                </div>
            </a>
            <a href="#" class="listItem">
                <div class="image">
                    <img src="fornt/img/sample/avatar2.jpg" alt="avatar">
                </div>
                <div class="text">
                    <div>
                        <strong>Furmaan Bharyar</strong>
                    </div>
                </div>
            </a>
            <a href="#" class="listItem">
                <div class="image">
                    <img src="fornt/img/sample/avatar3.jpg" alt="avatar">
                </div>
                <div class="text">
                    <div>
                        <strong>Kari Granleese</strong>
                    </div>
                </div>
            </a>
            <a href="#" class="listItem">
                <div class="image">
                    <img src="fornt/img/sample/avatar4.jpg" alt="avatar">
                </div>
                <div class="text">
                    <div>
                        <strong>Jurriaan van der Broek</strong>
                    </div>
                </div>
            </a>
            <a href="#" class="listItem">
                <div class="image">
                    <img src="fornt/img/sample/avatar5.jpg" alt="avatar">
                </div>
                <div class="text">
                    <div>
                        <strong>Homayoun Shakibaii</strong>
                    </div>
                </div>
            </a>
            <a href="#" class="listItem">
                <div class="image">
                    <img src="fornt/img/sample/avatar6.jpg" alt="avatar">
                </div>
                <div class="text">
                    <div>
                        <strong>Stephanus Huggins</strong>
                    </div>
                </div>
            </a>
            <a href="#" class="listItem">
                <div class="image">
                    <img src="fornt/img/sample/avatar7.jpg" alt="avatar">
                </div>
                <div class="text">
                    <div>
                        <strong>Adhraaa Al Azimi</strong>
                    </div>
                </div>
            </a>
            <a href="#" class="listItem">
                <div class="image">
                    <div class="iconBox">
                        <i class="icon ion-ios-pulse"></i>
                    </div>
                </div>
                <div class="text">
                    <div>
                        <strong>Health</strong>
                    </div>
                </div>
            </a>
            <a href="#" class="listItem">
                <div class="image">
                    <div class="iconBox bg-danger">
                        <i class="icon ion-ios-car"></i>
                    </div>
                </div>
                <div class="text">
                    <div>
                        <strong>Connected Vehicles</strong>
                    </div>
                </div>
            </a>
            <a href="#" class="listItem">
                <div class="image">
                    <div class="iconBox bg-success">
                        <i class="icon ion-ios-paw"></i>
                    </div>
                </div>
                <div class="text">
                    <div>
                        <strong>Turn off</strong>
                    </div>
                </div>
            </a>
        </div>
        <!-- * listview -->
    </div>
</div>
<!-- appCapsule -->