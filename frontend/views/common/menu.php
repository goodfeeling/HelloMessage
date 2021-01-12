<?php
use yii\helpers\Url;

/* @var $this yii\web\View */
?>

<!-- App Bottom Menu -->
<div class="appBottomMenu">
    <div class="item" id="home">
        <a href="<?php echo Url::home() ?>">
            <p>
                <i class="icon ion-ios-home"></i>
                <span>首页</span>
            </p>
        </a>
    </div>
    <div class="item" id="discover">
        <a href="<?php echo Url::to(['discover/index']) ?>">
            <p>
                <i class="icon ion-ios-aperture"></i>
                <span>发现</span>
            </p>
        </a>
    </div>
    <div class="item" id="search">
        <a href="<?php echo Url::to(['search/index']) ?>">
            <p>
                <i class="icon ion-ios-search"></i>
                <span>搜索</span>
            </p>
        </a>
    </div>

    <div class="item" id="sidebar">
        <a href="javascript:;" class="icon toggleSidebar">
            <p>
                <i class="icon ion-ios-menu"></i>
                <span>我的</span>
            </p>
        </a>
    </div>
</div>
<!-- * App Bottom Menu -->
