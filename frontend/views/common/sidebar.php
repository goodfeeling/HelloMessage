<?php
use yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = '首页';
?>

<div class="sidebarWrapper">
    <div class="overlay toggleSidebar"></div>
    <nav class="sidebar">
        <div class="profilebox">
            <img src="fornt/img/sample/avatar.jpg" alt="avatar" class="avatar">
            <h2 class="title">小明</h2>
            <h5 class="lead">
                <i class="icon ion-ios-pin mr-1"></i>
                广州
            </h5>
            <div class="button">
                <a href="#">
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
                    <a href="social-chat.html">
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
                    <a href="blog-home.html">
                        <i class="icon ion-ios-book"></i>导航</a>
                </li>
                <li>
                    <a href="<?php echo Url::to(['login/index']) ?>">
                        <i class="icon ion-ios-lock"></i>登录</a>
                </li>
            </ul>
        </div>

    </nav>
</div>

