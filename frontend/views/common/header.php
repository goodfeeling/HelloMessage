<?php
use yii\helpers\Url;
use yii\helpers\Html;
/* @var $this yii\web\View */
$controller = Yii::$app->controller->id;
$action = Yii::$app->controller->action->id;
$operation = $controller.'/'.$action;
$color_controller = in_array($operation,['chat/my-chat']) ? 'bg-success color-light' : '';
$identity = \Yii::$app->user->identity;
$param = [
    'color_controller'=>$color_controller,
    'operation'=>$operation,
    'title'=>$this->title
];
?>
<?php $this->render('@app/views/blocks/blocks.php',$param) ?>

<?php if (in_array($operation,['site/index'])): ?>
    <?= $this->blocks['search'] ?>
<?php elseif($operation == 'chat/chat-interface'): ?>
    <?= $this->blocks['chat'] ?>
<?php elseif( in_array($operation,['discover/index'])): ?>
    <?= $this->blocks['discover'] ?>
<?php elseif($controller == 'login' && $action =='index'): ?>
    <?= $this->blocks['login'] ?>
<?php elseif($operation == 'chat/friend'): ?>
    <?= $this->blocks['friend'] ?>
<?php else: ?>
    <?= $this->blocks['default'] ?>
<?php endif; ?>

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
