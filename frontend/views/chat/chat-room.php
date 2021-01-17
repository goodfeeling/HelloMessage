<?php
use yii\helpers\Url;
use \common\services\StaticServices;

/* @var $this yii\web\View */

$this->title = '我的聊天室';
$urlManager = Yii::$app->urlManager;

StaticServices::includeAppJsStatic('@web/js/chat/chatRoom.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);

?>

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<!-- App Capsule -->
<div id="appCapsule">

    <div class="appContent">


        <!-- listview -->
        <div class="listView detailed">
            <a href="<?= Url::to(['chat/chat-interface']) ?>" class="listItem">
                <div class="image">
                    <img src="fornt/img/sample/avatar.jpg" alt="avatar">
                </div>
                <div class="text">
                    <div>
                        <strong>Carmen Beltrán</strong>
                        <div class="text-muted">
                            <i class="icon ion-ios-pin mr-1"></i>
                            New York City
                        </div>
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
                        <div class="text-muted">
                            <i class="icon ion-ios-pin mr-1"></i>
                            London
                        </div>
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
                        <div class="text-muted">
                            <i class="icon ion-ios-pin mr-1"></i>
                            Paris
                        </div>
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
                        <div class="text-muted">
                            <i class="icon ion-ios-pin mr-1"></i>
                            Kiew
                        </div>
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
                        <div class="text-muted">
                            <i class="icon ion-ios-pin mr-1"></i>
                            Monterrey
                        </div>
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
                        <div class="text-muted">
                            <i class="icon ion-ios-pin mr-1"></i>
                            Oslo
                        </div>
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
                        <div class="text-muted">
                            <i class="icon ion-ios-pin mr-1"></i>
                            Florence
                        </div>
                    </div>
                </div>
            </a>
            <a href="#" class="listItem">
                <div class="image">
                    <img src="fornt/img/sample/avatar8.jpg" alt="avatar">
                </div>
                <div class="text">
                    <div>
                        <strong>Malin Quist</strong>
                        <div class="text-muted">
                            <i class="icon ion-ios-pin mr-1"></i>
                            Tokyo
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <!-- * listview -->

    </div>

</div>
<!-- appCapsule -->
