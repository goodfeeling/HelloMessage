<?php

use yii\helpers\Url;

/* @var $this yii\web\View */
$identity = \Yii::$app->user->identity;

?>

<div class="sidebarWrapper">
    <div class="overlay toggleSidebar"></div>
    <nav class="sidebar">
        <div class="profilebox">
            <img src="<?= empty($identity) ? $this->user_info->avatar_url : 'images/未登录头象.png'?>" alt="avatar" class="avatar">
            <h2 class="title"><?= empty($isGuest) ? $this->user_info->nickname :'请点击头像进行登录' ?></h2>
            <div class="button">
                <a href="<?php echo Url::to(['site/setting']) ?>">
                    <i class="icon ion-ios-settings"></i>
                </a>
            </div>
        </div>
        <div class="sidebarGroup">
            <ul class="sidebarMenu">
                <li hidden>
                    <a href="social-home.html">
                        <i class="icon ion-ios-people"></i>
                        我的动态
                    </a>
                </li>
                <li>
                    <a href="<?php echo Url::to(['activity/my-category']) ?>">
                        <i class="icon ion-ios-chatboxes"></i>
                        我的活动
                    </a>
                </li>
                <li hidden>
                    <a href="pages.html">
                        <i class="icon ion-ios-apps"></i>
                        我的关注
                    </a>
                </li>
                <li>
                    <a href="<?php echo Url::to(['feedback/index']) ?>">
                        <i class="icon ion-ios-analytics"></i>意见反馈</a>
                </li>
                <li>
                    <a href="<?php echo Url::to(['site/guidance']) ?>">
                        <i class="icon ion-ios-book"></i>导航</a>
                </li>
                <!--                <li>-->
                <!--                    <a href="--><?php //echo Url::to(['login/index']) ?><!--">-->
                <!--                        <i class="icon ion-ios-lock"></i>登录</a>-->
                <!--                </li>-->
            </ul>
        </div>
        <?php echo \Yii::$app->view->renderFile('@app/views/common/copyright.php'); ?>
    </nav>
</div>

<script>
    var is_login = <?= empty($identity) ? 0 : 1 ?>;
    // var is_login = 1;
    window.onload = function () {
        $('.avatar').on('click', function (e) {
            if (!is_login) {
                window.location.href = "<?php echo Url::toRoute(['login/index'], true) ?>";
            } else {
                window.location.href = "<?php echo Url::toRoute(['user-info/index'], true) ?>";
            }
        })
    }
</script>