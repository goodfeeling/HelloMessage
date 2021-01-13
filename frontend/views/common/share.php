<?php

use yii\helpers\Url;

/* @var $this yii\web\View */

$urlManager = Yii::$app->urlManager;

\common\services\StaticServices::includeAppJsStatic('@web/js/common/share.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);

?>
<script src="http://res.wx.qq.com/open/js/jweixin-1.6.0.js"></script>

<div class="col-6" id="share_btn">
    <a href="javascript:;" class="btn btn-primary btn-block">
        <i class="icon ion-md-share"></i> 分享
    </a>
</div>