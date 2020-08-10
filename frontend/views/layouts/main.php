<?php

/* @var $this View */

/* @var $content string */
use yii\helpers\Url;
use yii\helpers\Html;
use frontend\assets\AppAsset;
use frontend\assets\WebAsset;
use yii\web\View;

AppAsset::register($this);
WebAsset::register($this);

$pageTitle = '<img src="fornt/img/logo.png" alt="Bitter" class="image">';

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

    <?php $this->renderFile('@app/views/blocks/blocks.php') ?>

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

    <!--  script  -->
    <?php echo \Yii::$app->view->renderFile('@app/views/layouts/generator-script.php'); ?>
    <!--  script  -->

    <?php $this->endBody() ?>
</body>

</html>
<?php $this->endPage() ?>