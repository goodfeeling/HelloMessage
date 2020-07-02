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

$pageTitle = '<img src="fornt/img/logo.png" alt="Bitter" class="image">';

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
    <!doctype html>
    <html lang="<?= Yii::$app->language ?>">

    <head>
        <meta charset="<?= Yii::$app->charset ?>"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <?= Html::csrfMetaTags() ?>
        <title><?= Html::encode($this->title) ?></title>
        <link rel="stylesheet" href="fornt/css/style.css">
        <link rel="stylesheet" href="css/site.css">
        <link rel="stylesheet" href="css/weui.min.css"/>
        <!--    --><?php //$this->head()
        ?>
        <meta name="viewport" content="initial-scale=1, maximum-scale=1, width=device-width">
        <meta name="description" content="Bitter Mobile Template">
        <meta name="keywords" content="bootstrap, mobile template, cordova, phonegap, mobile, html, responsive"/>
        <!-- Jquery -->
        <script src="fornt/js/lib/jquery-3.4.1.min.js"></script>
    </head>

    <body>
    <?php $this->beginBody() ?>

    <!-- Page loading -->
    <div class="loading">
        <div class="spinner-grow text-info"></div>
    </div>
    <!-- * Page loading -->

    <!--BEGIN dialog3-->
    <div class="js_dialog" id="simpleDialog" style="display: none;">
        <div class="weui-mask"></div>
        <div class="weui-dialog weui-skin_android">
            <div class="weui-dialog__hd"><strong class="weui-dialog__title">提示</strong></div>
            <div class="weui-dialog__bd wx-bd">
                发生错误了，请联系管理员！
            </div>
            <div class="weui-dialog__ft">
                <a href="javascript:" class="weui-dialog__btn weui-dialog__btn_default">关闭</a>
                <a class="weui-dialog__btn weui-dialog__btn_primary wx-main-btn">确定</a>
            </div>
        </div>
    </div>
    <!--END dialog3-->

    <div id="shareit" style="display: none;">
        <img src="https://oscimg.oschina.net/oscnet/fd2170a448e37826ae9f4d7088f287b8f24.jpg">
    </div>

    <!-- App Capsule -->
    <?= $content ?>
    <!-- * appCapsule -->

    <!-- ///////////// Js Files ////////////////////  -->

    <script>
        $('.weui-dialog__btn').on('click', function () {
            $('.js_dialog').fadeOut(200);
        });

        $("#shareit").on("click", function () {
            $("#shareit").hide();
        });
    </script>

    <!-- Bootstrap-->
    <script src="fornt/js/lib/popper.min.js"></script>
    <script src="fornt/js/lib/bootstrap.min.js"></script>
    <!-- Owl Carousel -->
    <script src="fornt/js/plugins/owl.carousel.min.js"></script>
    <!-- Main Js File -->
    <script src="fornt/js/app.js"></script>
    <script src="js/zepto.min.js"></script>
    <script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script src="https://res.wx.qq.com/open/libs/weuijs/1.2.1/weui.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <?php $this->endBody() ?>
    </body>

    </html>
<?php $this->endPage() ?>