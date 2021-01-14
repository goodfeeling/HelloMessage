<?php
/* @var $this yii\web\View */
use yii\helpers\Url;
use yii\helpers\Html;
?>

<?php $this->beginBlock('headCommonStart') ?>
    <div class="appHeader <?= $color_controller ?>">
        <div class="left">
            <?php if (!in_array($operation,['site/index','discover/index','search/index','cart/index'])): ?>
                <a href="javascript:;" class="icon goBack">
                    <i class="icon ion-ios-arrow-back"></i>
                </a>
            <?php endif; ?>
        </div>
        <div class="pageTitle">
            <?= Html::encode($title) ?>
        </div>
        <div class="right">
<?php $this->endBlock(); ?>

<?php $this->beginBlock('commonEnd') ?>
        </div>
    </div>
<?php $this->endBlock() ?>

<?php $this->beginBlock('default'); ?>
<?= $this->blocks['headCommonStart'] ?>
<?= $this->blocks['commonEnd'] ?>
<?php $this->endBlock(); ?>

<?php $this->beginBlock('search'); ?>
<?= $this->blocks['headCommonStart'] ?>
<label for="searchInput" class="mb-0 icon toggleSearchbox">
    <i class="icon ion-ios-search"></i>
</label>
<?= $this->blocks['commonEnd'] ?>
<?php $this->endBlock(); ?>

<?php $this->beginBlock('chat'); ?>
<?= $this->blocks['headCommonStart'] ?>
<label for="phoneInput" class="mb-0 icon">
    <i class="icon ion-ios-call"></i>
</label>
<?= $this->blocks['commonEnd'] ?>
<?php $this->endBlock(); ?>

<?php $this->beginBlock('discover'); ?>
<?= $this->blocks['headCommonStart'] ?>
    <a href="<?php echo Url::to(['discover/uploader']) ?>" class="link">发动态</a>
<?= $this->blocks['commonEnd'] ?>
<?php $this->endBlock(); ?>

<?php $this->beginBlock('login'); ?>
<?= $this->blocks['headCommonStart'] ?>
    <a href="<?php echo Url::to(['login/register']) ?>" class="link">注册</a>
<?= $this->blocks['commonEnd'] ?>
<?php $this->endBlock(); ?>

<?php $this->beginBlock('friend'); ?>
<?= $this->blocks['headCommonStart'] ?>
    <a href="<?php echo Url::to(['chat/information-setting']) ?>" class="link">...</a>
<?= $this->blocks['commonEnd'] ?>
<?php $this->endBlock(); ?>