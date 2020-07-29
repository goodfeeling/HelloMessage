<?php

/* @var $this \yii\web\View */

/* @var $content string */

use yii\helpers\Html;
use frontend\assets\AppAsset;

$pageTitle = '<img src="fornt/img/logo.png" alt="Bitter" class="image">';
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

    <?php $this->head() ?>

    <meta name="viewport" content="initial-scale=1, maximum-scale=1, width=device-width">
    <meta name="description" content="Bitter Mobile Template">
    <meta name="keywords" content="bootstrap, mobile template, cordova, phonegap, mobile, html, responsive" />
</head>

<body>
    <?php $this->beginBody() ?>

    <!-- Page loading -->
    <div class="loading">
        <div class="spinner-grow text-info"></div>
    </div>
    <!-- * Page loading -->

    <!--  components  -->
    <?php echo \Yii::$app->view->renderFile('@app/views/common/components.php'); ?>
    <!--  components  -->

    <!-- App Capsule -->
    <?= $content ?>
    <!-- * appCapsule -->

    <!-- ///////////// Js Files ////////////////////  -->
    <!-- Bootstrap-->
    <script src="fornt/js/lib/popper.min.js"></script>
    <script src="fornt/js/lib/bootstrap.min.js"></script>
    <!-- Owl Carousel -->
    <script src="fornt/js/plugins/owl.carousel.min.js"></script>
    <!-- Main Js File -->
    <script src="js/zepto.min.js"></script>
    <script src="fornt/js/app.js"></script>
    <script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script src="https://res.wx.qq.com/open/libs/weuijs/1.2.1/weui.min.js"></script>
    <?php $this->endBody() ?>
</body>

</html>
<?php $this->endPage() ?>