<?php

use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '搜索';
$urlManager = Yii::$app->urlManager;
?>

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<!-- App Capsule -->
<div id="appCapsule">

    <div class="appContent">

        <div class="searchBlock mt-3">
            <form>
                    <span class="inputIcon">
                        <i class="icon ion-ios-search"></i>
                    </span>
                <input type="text" class="form-control" id="searchInput" placeholder="Search...">
            </form>
        </div>

        <div class="sectionTitle mb-1 mt-4">
            <div class="text-muted">POPULAR</div>
            <div class="title">
                <h1>主题</h1>
            </div>
        </div>

        <!-- listview -->
        <div class="listView textView">
            <a href="#" class="listItem">
                <div class="text">
                    <div>
                        <strong>How to upload a photo?</strong>
                    </div>
                </div>
            </a>
            <a href="#" class="listItem">
                <div class="text">
                    <div>
                        <strong>Change profile picture</strong>
                    </div>
                </div>
            </a>
            <a href="#" class="listItem">
                <div class="text">
                    <div>
                        <strong>Notification</strong>
                    </div>
                </div>
            </a>
            <a href="#" class="listItem">
                <div class="text">
                    <div>
                        <strong>Charge status</strong>
                    </div>
                </div>
            </a>
            <a href="#" class="listItem">
                <div class="text">
                    <div>
                        <strong>Sounds</strong>
                    </div>
                </div>
            </a>
        </div>
        <!-- * listview -->

        <div class="sectionTitle mt-4 mb-0">
            <div class="text-muted">POPULAR</div>
            <div class="title">
                <h1>热门搜索</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-6 mt-2">
                <a href="#" class="btn btn-primary btn-block">
                    <i class="icon ion-ios-paper"></i>
                    热点
                </a>
            </div>
            <div class="col-6 mt-2">
                <a href="#" class="btn btn-dark btn-block">
                    <i class="icon ion-logo-game-controller-b"></i>
                    游戏
                </a>
            </div>
            <div class="col-6 mt-2">
                <a href="#" class="btn btn-danger btn-block">
                    <i class="icon ion-ios-musical-notes"></i>
                    音乐
                </a>
            </div>
            <div class="col-6 mt-2">
                <a href="#" class="btn btn-warning btn-block">
                    <i class="icon ion-ios-camera"></i>
                    视频
                </a>
            </div>
            <div class="col-6 mt-2">
                <a href="#" class="btn btn-info btn-block">
                    <i class="icon ion-ios-pulse"></i>
                    健康
                </a>
            </div>
            <div class="col-6 mt-2">
                <a href="#" class="btn btn-success btn-block">
                    <i class="icon ion-ios-bulb"></i>
                    社交
                </a>
            </div>
        </div>

    </div>

</div>
<!-- appCapsule -->

    <!-- Sidebar Menu -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/sidebar.php'); ?>
    <!-- * Sidebar Menu -->

<?php echo \Yii::$app->view->renderFile('@app/views/common/menu.php'); ?>