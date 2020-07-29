<?php

/* @var $this \yii\web\View */

/* @var $content string */
use yii\helpers\Url;
use yii\helpers\Html;
use frontend\assets\AppAsset;
use frontend\assets\WebAsset;

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

    <script>
        // 关闭模态框
        $('.weui-dialog__btn').on('click', function() {
            $('.js_dialog').fadeOut(200);
        });

        // 触发关闭分享图片
        $("#shareit").on("click", function() {
            $("#shareit").hide();
        });

        // 统一生成url
        BASE_URL = "<?= Url::base() ?>";
        LOGIN = "<?= Url::toRoute('login/index', true) ?>"
        APPLY = "<?= Url::toRoute('activity/apply', true) ?>"
        USER_PAY = "<?= Url::toRoute('activity/user-pay', true) ?>"
        VERIFY_USER = "<?= Url::toRoute('activity/verify-user', true) ?>"
        LOGIN_JUMP = "<?= Url::toRoute('login/jump-login-page', true) ?>"
        USER_INFO = "<?= Url::toRoute('user-info/index', true) ?>"
        COMMENT = "<?= Url::toRoute('activity/comment', true) ?>"
        LINKES_INCREASE = "<?= Url::toRoute('activity/likes-increase', true) ?>"

        IDENTITY = <?= \Yii::$app->user->identity ? 0 : 1 ?>
    </script>
    <?php $this->endBody() ?>
</body>

</html>
<?php $this->endPage() ?>