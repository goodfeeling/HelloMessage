<?php
use yii\helpers\Url;
/* @var $this yii\web\View */
$controller = Yii::$app->controller->id;
$action = Yii::$app->controller->action->id;
$operation = $controller.'/'.$action;
?>
<?php $this->render('@app/views/blocks/blocks.php') ?>

<div class="appHeader">
    <div class="left">
        <?php if (!in_array($operation,['site/index','discover/index','search/index'])): ?>
            <a href="javascript:;" class="icon goBack">
                <i class="icon ion-ios-arrow-back"></i>
            </a>
        <?php endif; ?>
    </div>
    <div class="pageTitle">
        <?= $this->title ?>
    </div>
    <div class="right">
        <?php if (isset($this->blocks['search']) && in_array($operation,['site/index'])): ?>
            <?= $this->blocks['search'] ?>
        <?php elseif(isset($this->blocks['chat']) && $operation == 'chat/my-chat'): ?>
            <?= $this->blocks['chat'] ?>
        <?php elseif(isset($this->blocks['discover'])  && $controller == 'discover'): ?>
            <?= $this->blocks['discover'] ?>
        <?php elseif(isset($this->blocks['login'])  && $controller == 'login' && $action =='index'): ?>
            <?= $this->blocks['login'] ?>
        <?php elseif(isset($this->blocks['cart'])  && $controller == 'cart' && $action =='index'): ?>
            <?= $this->blocks['cart'] ?>
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
