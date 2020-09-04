<?php

use yii\helpers\Url;

/* @var $this yii\web\View */
$identity = \Yii::$app->user->identity;
$avatar_url = (new \frontend\service\UserService())->generaterUrl($this->params['user_info']['avatar_url'] ?? '');
$nickname = !empty($identity) ? $this->params['user_info']['nickname'] : '请点击头像进行登录';
$city = !empty($identity) ? $this->params['user_info']['city'] : '未知';

\common\services\StaticServices::includeAppJsStatic('@web/js/common/sidebar.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);
?>

<div class="sidebarWrapper">
    <div class="overlay toggleSidebar"></div>
    <nav class="sidebar">
        <div class="profilebox">
            <img src="<?= $avatar_url ?>" alt="avatar" class="avatar">
            <h2 class="title"><?= $nickname ?? '未设置' ?></h2>
            <h5 class="lead">
                <i class="icon ion-ios-pin mr-1"></i>
                <?= $city ?? '未知' ?>
            </h5>
            <div class="button">
                <a href="<?php echo Url::to(['site/setting']) ?>">
                    <i class="icon ion-ios-settings"></i>
                </a>
            </div>
        </div>
        <div class="sidebarGroup">
            <ul class="sidebarMenu">
                <li>
                    <a href="<?php echo Url::to(['discover/my-lists']) ?>">
                        <i class="icon ion-ios-aperture"></i>
                        我的动态
                    </a>
                </li>
                <li>
                    <a href="<?php echo Url::to(['chat/index']) ?>">
                        <i class="icon ion-ios-people"></i>
                        我的好友
                    </a>
                </li>
                <li>
                    <a href="<?php echo Url::to(['my-activity/index']) ?>">
                        <i class="icon ion-ios-chatboxes"></i>
                        我的活动
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
                <li>
                    <a href="<?php echo Url::to(['site/faq']) ?>">
                        <i class="icon ion-ios-navigate"></i>FAQ</a>
                </li>
                <li <?php echo $identity ? '' : 'hidden' ?>>
                    <a href="<?php echo Url::to(['login/logout']) ?>">
                        <i class="icon ion-ios-unlock"></i>
                        退出登录
                    </a>
                </li>
            </ul>
        </div>
        <div class="sidebarGroup">
            <ul class="sidebarMenu">
                <li class="title">消息</li>
                <li>
                    <a href="<?php echo Url::to(['chat/my-chat']) ?>">
                        <img src="fornt/img/sample/avatar3.jpg" alt="avatar" class="avatar">
                        Kita Chihoko
                        <span class="badge badge-primary">100</span>
                    </a>
                </li>
            </ul>
        </div>
<!--        --><?php //echo \Yii::$app->view->renderFile('@app/views/common/copyright.php'); ?>
    </nav>
</div>