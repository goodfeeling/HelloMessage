<?php
use yii\helpers\Url;
/* @var $this yii\web\View */
$controller = Yii::$app->controller->id;
$action = Yii::$app->controller->action->id;
?>
<?php $this->render('@app/views/blocks/blocks.php') ?>

<div class="appHeader">
    <div class="left">
        <?php if (!in_array($controller,['site','discover','search'])): ?>
            <a href="javascript:;" class="icon goBack">
                <i class="icon ion-ios-arrow-back"></i>
            </a>
        <?php endif; ?>
    </div>
    <div class="pageTitle">
        <?= $this->title ?>
    </div>
    <div class="right">
        <?php if (isset($this->blocks['search']) && in_array($controller,['site'])): ?>
            <?= $this->blocks['search'] ?>
        <?php elseif(isset($this->blocks['chat']) && $controller == 'chat'): ?>
            <?= $this->blocks['chat'] ?>
        <?php elseif(isset($this->blocks['discover'])  && $controller == 'discover'): ?>
            <?= $this->blocks['discover'] ?>
        <?php elseif(isset($this->blocks['login'])  && $controller == 'login' && $action =='index'): ?>
            <?= $this->blocks['login'] ?>
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
