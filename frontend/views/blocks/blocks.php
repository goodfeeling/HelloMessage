<?php
/* @var $this yii\web\View */
use yii\helpers\Url;
use yii\helpers\Html;

// 不显示回退按钮的页面
$no_back = ['site/index','discover/index','search/index','cart/index'];
?>
<!-- 公共头模块 -->
<?php $this->beginBlock('headCommonStart') ?>
    <div class="appHeader <?= $color_controller ?>">
        <div class="left">
            <?php if (!in_array($operation,$no_back)): ?>
                <?= Html::tag('a', Html::tag('i', '', ['class' => 'icon ion-ios-arrow-back']),
                    ['href' => 'javascript:;','class'=>'icon goBack' ]) ?>
            <?php endif; ?>
        </div>
        <?= Html::tag('div', Html::encode($title), ['class'=>'pageTitle' ]) ?>
        <div class="right">
<?php $this->endBlock(); ?>

<?php $this->beginBlock('commonEnd') ?>
        </div>
    </div>
<?php $this->endBlock() ?>
<!-- 公共头模块 -->

<!-- 默认头模块 -->
<?php $this->beginBlock('default'); ?>
<?= $this->blocks['headCommonStart'] ?>
<?= $this->blocks['commonEnd'] ?>
<?php $this->endBlock(); ?>
<!-- 默认头模块 -->

<!--搜索模块-->
<?php $this->beginBlock('search'); ?>
<?= $this->blocks['headCommonStart'] ?>
<?= Html::label(Html::tag('i', '', ['class' => 'icon ion-ios-search']),'searchInput',
    ['class'=>'mb-0 icon toggleSearchbox'])
?>
<?= $this->blocks['commonEnd'] ?>
<?php $this->endBlock(); ?>
<!--搜索模块-->

<!--聊天模块-->
<?php $this->beginBlock('chat'); ?>
<?= $this->blocks['headCommonStart'] ?>
<?= Html::label(Html::tag('i', '', ['class' => 'icon ion-ios-call']),'phoneInput',
    ['class'=>'"mb-0 icon'])
?>
<?= $this->blocks['commonEnd'] ?>
<?php $this->endBlock(); ?>
<!--聊天模块-->

<!--朋友圈模块-->
<?php $this->beginBlock('discover'); ?>
<?= $this->blocks['headCommonStart'] ?>
<?= Html::tag('a', '发动态', ['href' => Url::to(['discover/uploader']),'class'=>'link' ]) ?>
<?= $this->blocks['commonEnd'] ?>
<?php $this->endBlock(); ?>
<!--朋友圈模块-->

<!--登录模块-->
<?php $this->beginBlock('login'); ?>
<?= $this->blocks['headCommonStart'] ?>
<?= Html::tag('a', '注册', ['href' => Url::to(['login/register']),'class'=>'link' ]) ?>
<?= $this->blocks['commonEnd'] ?>
<?php $this->endBlock(); ?>
<!--登录模块-->

<!--我的好友模块-->
<?php $this->beginBlock('friend'); ?>
<?= $this->blocks['headCommonStart'] ?>
<?= Html::tag('a', '...', ['href' => Url::to(['chat/information-setting']),'class'=>'link' ]) ?>
<?= $this->blocks['commonEnd'] ?>
<?php $this->endBlock(); ?>
<!--我的好友模块-->
