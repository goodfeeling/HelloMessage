<?php
use yii\helpers\Url;
use yii\helpers\Html;
/* @var $this yii\web\View */
$controller = Yii::$app->controller->id;
$action = Yii::$app->controller->action->id;
$operation = $controller.'/'.$action;
$color_controller = in_array($operation,['chat/my-chat']) ? 'bg-success color-light' : '';
?>
<?php $this->render('@app/views/blocks/blocks.php') ?>

<div class="appHeader <?= $color_controller ?>">
    <div class="left">
        <?php if (!in_array($operation,['site/index','discover/index','search/index','cart/index'])): ?>
            <a href="javascript:;" class="icon goBack">
                <i class="icon ion-ios-arrow-back"></i>
            </a>
        <?php endif; ?>
    </div>
    <div class="pageTitle">
        <?= Html::encode($this->title) ?>
    </div>
    <div class="right">
        <?php if (isset($this->blocks['search']) && in_array($operation,['site/index'])): ?>
            <?= $this->blocks['search'] ?>
        <?php elseif(isset($this->blocks['chat']) && $operation == 'chat/my-chat'): ?>
            <?= $this->blocks['chat'] ?>
        <?php elseif(isset($this->blocks['discover']) && in_array($operation,['discover/index'])): ?>
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
