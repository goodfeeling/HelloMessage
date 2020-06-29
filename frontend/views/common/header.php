<?php
use yii\helpers\Url;
/* @var $this yii\web\View */
?>

<div class="appHeader">
    <div class="left">
        <a href="javascript:;" class="icon toggleSidebar">
            <i class="icon ion-ios-menu"></i>
        </a>
    </div>
    <div class="pageTitle">
        <?= $this->title ?>
    </div>
    <div class="right">
        <label for="searchInput" class="mb-0 icon toggleSearchbox">
<!--            <i class="icon ion-ios-search"></i>-->
        </label>
    </div>
</div>
<!-- searchBox -->
<div class="searchBox">
    <form>
            <span class="inputIcon">
                <i class="icon ion-ios-search"></i>
            </span>
        <input type="text" class="form-control" id="searchInput" placeholder="Search...">
        <a href="javascript:;" class="toggleSearchbox closeButton">
            <i class="icon ion-ios-close-circle"></i>
        </a>
    </form>
</div>
<!-- * searchBox -->
