<?php
use yii\helpers\Url;
use common\services\StaticServices;
/* @var $this yii\web\View */

$this->title = '资料设置';
$urlManager = Yii::$app->urlManager;

StaticServices::includeAppJsStatic('@web/js/chat/infoSetting.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);

?>

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<!-- App Capsule -->
<div id="appCapsule">
    <div class="appContent">
        <div class="contentList">
            <div>设置备注和标签</div>
            <div>
                <div class="custom-control">
                    <i class="icon ion-ios-arrow-forward"></i>
                </div>
            </div>
        </div>

        <div class="contentList">
            <div>朋友权限</div>
            <div>
                <div class="custom-control">
                    <i class="icon ion-ios-arrow-forward"></i>
                </div>
            </div>
        </div>

        <div class="contentList">
            <div>设为星标朋友</div>
            <div>
                <div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" id="customSwitch11" checked />
                    <label class="custom-control-label" for="customSwitch11"></label>
                </div>
            </div>
        </div>

        <div class="contentList">
            <div>加入黑名单</div>
            <div>
                <div class="custom-control custom-switch">
                    <input type="checkbox" class="custom-control-input" id="customSwitch12">
                    <label class="custom-control-label" for="customSwitch12"></label>
                </div>
            </div>
        </div>

    </div>
</div>
<!-- appCapsule -->
