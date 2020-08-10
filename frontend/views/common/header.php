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
        <?php endif; ?>
    </div>
    <div class="pageTitle">
        <?= $this->title ?>
    </div>
    <div class="right">
        <?php if (isset($this->blocks['search'])): ?>
            <?= $this->blocks['search'] ?>
        <?php elseif(isset($this->blocks['chat'])): ?>
            <?= $this->blocks['chat'] ?>
        <?php elseif(isset($this->blocks['discover'])): ?>
            <?= $this->blocks['chat'] ?>
        <?php else: ?>

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
