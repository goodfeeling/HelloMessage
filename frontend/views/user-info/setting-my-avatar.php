<?php
use yii\helpers\Url;

/* @var $this yii\web\View */
$this->title = '上传个人头像';
$urlManager = Yii::$app->urlManager;
\common\services\StaticServices::includeAppJsStatic('@web/js/user-info/index.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);
?>