<?php
use \common\services\StaticServices;
use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '活动导航';
StaticServices::includeAppJsStatic('@web/js/site/guidance.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);
?>
<style type="text/css">
    html,
    body {
        margin: 0;
        padding: 0;
    }

    .iw_poi_title {
        color: #CC5522;
        font-size: 14px;
        font-weight: bold;
        overflow: hidden;
        padding-right: 13px;
        white-space: nowrap
    }

    .iw_poi_content {
        font: 12px arial, sans-serif;
        overflow: visible;
        padding-top: 4px;
        white-space: -moz-pre-wrap;
        word-wrap: break-word
    }
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->
<!--百度地图容器-->
<div style="min-height:100vh;display:flex;border:#ccc solid 1px;" id="appCapsule"></div>
