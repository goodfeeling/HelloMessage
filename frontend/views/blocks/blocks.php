<?php
/* @var $this yii\web\View */
use yii\helpers\Url;
?>
<?php $this->beginBlock('search'); ?>
<label for="searchInput" class="mb-0 icon toggleSearchbox">
    <i class="icon ion-ios-search"></i>
</label>
<?php $this->endBlock(); ?>


<?php $this->beginBlock('chat'); ?>
<label for="phoneInput" class="mb-0 icon">
    <i class="icon ion-ios-call"></i>
</label>
<?php $this->endBlock(); ?>

<?php $this->beginBlock('discover'); ?>
<label for="sendInput" class="mb-0 icon">
    <i class="icon ion-md-apps"></i>
</label>
<?php $this->endBlock(); ?>

<?php $this->beginBlock('login'); ?>
<a href="<?php echo Url::to(['login/register']) ?>" class="link">注册</a>
<?php $this->endBlock(); ?>

<?php $this->beginBlock('cart'); ?>
<a href="<?php echo Url::to(['login/register']) ?>" class="link">管理</a>
<?php $this->endBlock(); ?>
