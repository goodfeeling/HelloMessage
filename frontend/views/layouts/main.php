<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use common\widgets\Alert;
use yii\helpers\Url;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!doctype html>
<html lang="<?= Yii::$app->language ?>">

<head>
    <meta charset="<?= Yii::$app->charset ?>" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <link rel="stylesheet" href="fornt/css/style.css">
    <?php $this->head() ?>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, width=device-width">
    <meta name="description" content="Bitter Mobile Template">
    <meta name="keywords" content="bootstrap, mobile template, cordova, phonegap, mobile, html, responsive" />
</head>
<body>
<?php $this->beginBody() ?>

<!-- Page loading -->
<div class="loading">
    <div class="spinner-grow"></div>
</div>
<!-- * Page loading -->

<!-- App Header -->
<div class="appHeader">
    <div class="left">
        <a href="javascript:;" class="icon toggleSidebar">
            <i class="icon ion-ios-menu"></i>
        </a>
    </div>
<!--    <div class="pageTitle">-->
<!--        <img src="fornt/img/logo.png" alt="Bitter" class="image">-->
<!--    </div>-->
    <div class="right">
        <label for="searchInput" class="mb-0 icon toggleSearchbox">
            <i class="icon ion-ios-search"></i>
        </label>
    </div>
</div>
<!-- searchBox -->
<div class="searchBox">
    <form>
            <span class="inputIcon">
                <i class="icon ion-ios-search"></i>
            </span>
        <input type="text" class="form-control" id="searchInput" placeholder="Search...">
        <a href="javascript:;" class="toggleSearchbox closeButton">
            <i class="icon ion-ios-close-circle"></i>
        </a>
    </form>
</div>
<!-- * searchBox -->
<!-- * App Header -->

<!-- App Capsule -->
<div id="appCapsule">
    <?= $content ?>
</div>
<!-- * appCapsule -->

<!-- App Bottom Menu -->
<div class="appBottomMenu">
    <div class="item" id="home">
        <a href="<?php echo Url::home() ?>">
            <p>
                <i class="icon ion-ios-home"></i>
                <span>首页</span>
            </p>
        </a>
    </div>
    <!-- <div class="item" id="discover">
        <a href="<?php //echo Url::to(['discover/index']) ?>">
            <p>
                <i class="icon ion-ios-eye"></i>
                <span>发现</span>
            </p>
        </a>
    </div> -->
    <div class="item" id="sidebar">
        <a href="javascript:;" class="icon toggleSidebar">
            <p>
                <i class="icon ion-ios-menu"></i>
                <span>我的</span>
            </p>
        </a>
    </div>
</div>
<!-- * App Bottom Menu -->

<!-- Sidebar Menu -->
<div class="sidebarWrapper">
    <div class="overlay toggleSidebar"></div>
    <nav class="sidebar">
        <div class="profilebox">
            <img src="fornt/img/sample/avatar.jpg" alt="avatar" class="avatar">
            <h2 class="title">Gaspar Antunes</h2>
            <h5 class="lead">
                <i class="icon ion-ios-pin mr-1"></i>
                Chicago
            </h5>
            <div class="button">
                <a href="#">
                    <i class="icon ion-ios-settings"></i>
                </a>
            </div>
        </div>
        <div class="sidebarGroup">
            <ul class="sidebarMenu">
                <!-- <li>
                    <a href="social-home.html">
                        <i class="icon ion-ios-people"></i>
                        我的动态
                    </a>
                </li> -->
                <li>
                    <a href="social-chat.html">
                        <i class="icon ion-ios-chatboxes"></i>
                        我的活动
                    </a>
                </li>
                <!-- <li>
                    <a href="pages.html">
                        <i class="icon ion-ios-apps"></i>
                        我的收藏
                    </a>
                </li> -->
                <li>
                    <a href="<?php echo Url::to(['feedback/index']) ?>">
                        <i class="icon ion-ios-analytics"></i>意见反馈</a>
                </li>
                <li>
                    <a href="blog-home.html">
                        <i class="icon ion-ios-book"></i>导航</a>
                </li>
                 <li>
                   <a href="<?php echo Url::to(['login/index']) ?>">
                    <i class="icon ion-ios-lock"></i>登录</a>
                </li>
            </ul>
        </div>

    </nav>
</div>
<!-- * Sidebar Menu -->

<!-- ///////////// Js Files ////////////////////  -->
<!-- Jquery -->
<script src="fornt/js/lib/jquery-3.4.1.min.js"></script>
<!-- Bootstrap-->
<script src="fornt/js/lib/popper.min.js"></script>
<script src="fornt/js/lib/bootstrap.min.js"></script>
<!-- Owl Carousel -->
<script src="fornt/js/plugins/owl.carousel.min.js"></script>
<!-- Main Js File -->
<script src="fornt/js/app.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

