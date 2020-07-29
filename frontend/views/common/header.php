<?php
use yii\helpers\Url;
/* @var $this yii\web\View */
?>

<div class="appHeader">
    <div class="left">
        <?php if (!empty($is_chat)): ?>
            <a href="javascript:;" class="icon goBack">
                <i class="icon ion-ios-arrow-back"></i>
            </a>
        <?php else: ?>
            <a href="javascript:;" class="icon toggleSidebar">
                <i class="icon ion-ios-menu"></i>
            </a>
        <?php endif; ?>
    </div>
    <div class="pageTitle">
        <?= $this->title ?>
    </div>
    <div class="right">
        <?php if (empty($is_chat)): ?>
            <label for="searchInput" class="mb-0 icon toggleSearchbox">
                <i class="icon ion-ios-search"></i>
            </label>
        <?php else: ?>
            <a href="#" class="icon">
                <i class="icon ion-ios-call"></i>
            </a>
        <?php endif; ?>
    </div>
</div>

<!-- searchBox -->
<div class="searchBox">
    <form>
            <span class="inputIcon">
                <i class="icon ion-ios-search"></i>
            </span>
        <input type="text" class="form-control" id="searchInput" placeholder="搜索...">
        <a href="javascript:;" class="toggleSearchbox closeButton">
            <i class="icon ion-ios-close-circle"></i>
        </a>
    </form>
</div>
<!-- * searchBox -->
