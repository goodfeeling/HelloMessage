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
    BASE_URL = "<?= Url::base() ?>";
    LOGIN = "<?= Url::toRoute('login/index', true) ?>"
    APPLY = "<?= Url::toRoute('activity/apply', true) ?>"
    USER_PAY = "<?= Url::toRoute('activity/user-pay', true) ?>"
    VERIFY_USER = "<?= Url::toRoute('activity/verify-user', true) ?>"
    LOGIN_JUMP = "<?= Url::toRoute('login/jump-login-page', true) ?>"
    USER_INFO = "<?= Url::toRoute('user-info/index', true) ?>"
    COMMENT = "<?= Url::toRoute('activity/comment', true) ?>"
    LINKES_INCREASE = "<?= Url::toRoute('activity/likes-increase', true) ?>"
    SITE_INDEX = "<?= Url::toRoute('site/index', true) ?>"
    // 验证是否登录
    IDENTITY = <?= \Yii::$app->user->identity ? 0 : 1 ?>

</script>