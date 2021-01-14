<?php

use yii\helpers\Url;

?>

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
    BASE_URL = "<?= Yii::$app->request->hostInfo ?>";
    LOGIN = "<?= Url::toRoute('login/index', true) ?>"
    APPLY = "<?= Url::toRoute('post/apply', true) ?>"
    USER_PAY = "<?= Url::toRoute('post/user-pay', true) ?>"
    VERIFY_USER = "<?= Url::toRoute('post/verify-user', true) ?>"
    LOGIN_JUMP = "<?= Url::toRoute('login/jump-login-page', true) ?>"
    USER_INFO = "<?= Url::toRoute('user-info/index', true) ?>"
    COMMENT = "<?= Url::toRoute('post/comment', true) ?>"
    LINKES_INCREASE = "<?= Url::toRoute('post/likes-increase', true) ?>"
    SITE_INDEX = "<?= Url::toRoute('site/index', true) ?>"
    FEEDBACK = "<?= Url::toRoute('feedback/index', true) ?>"
    QRCODE = "<?= Url::toRoute('default/get-qr', true) ?>"
    REGISTER = "<?= Url::toRoute('login/register', true) ?>"
    SHARE = "<?= Url::toRoute('share/get-config', true) ?>"
    AVATAR = "<?= Url::toRoute('user-info/setting-avatar', true) ?>"
    FORGOT_PW = "<?= Url::toRoute('login/forgot-password', true) ?>"
    RESET_PW = "<?= Url::toRoute('login/password-reset', true) ?>"
    // 验证是否登录
    IDENTITY = <?= \Yii::$app->user->identity ? 0 : 1 ?>
</script>