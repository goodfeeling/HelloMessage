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
    <meta charset="<?= Yii::$app->charset ?>" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <link rel="stylesheet" href="fornt/css/style.css">
    <link rel="stylesheet" href="css/site.css">
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

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<!-- App Capsule -->
<?= $content ?>
<!-- * appCapsule -->

<!-- Sidebar Menu -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/sidebar.php'); ?>
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

