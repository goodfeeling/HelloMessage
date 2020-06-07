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
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>

</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <div class="container">
        <?= $content ?>
    </div>
</div>

<footer class="am-menu am-cf">
    <div class="am-menu-column index" id="index">
        <a href="<?php echo Url::home() ?>">
            <span>首页</span>
        </a>
    </div>
    <div class="am-menu-column explore" id="explore">
        <a href="<?php echo Url::to(['apply/view']) ?>">
            <span>申请</span>
        </a>
    </div>
    <div class="am-menu-column life" id="life">
        <a href="<?php echo Url::to(['divcover']) ?>">
            <span>发现</span>
        </a>
    </div>
    <div class="am-menu-column my" id="my">
        <a href="<?php echo Url::to(['my']) ?>">
            <span>我的</span>
        </a>
    </div>
</footer>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script>

</script>
