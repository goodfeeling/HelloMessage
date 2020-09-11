<?php
use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '重置密码';
$urlManager = Yii::$app->urlManager;

\common\services\StaticServices::includeAppJsStatic('@web/js/login/password-reset.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);

?>

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<div id="appCapsule">
    <div class="appContent pb-0">

        <img src="fornt/img/sample/draw-1.png" alt="img" class="img-fluid mb-3 mt-3">

        <div class="sectionTitle text-center">
            <div class="title">
                <h1>修改密码</h1>
            </div>
            <div class="lead mb-3">输入您要修改的密码</div>
        </div>

        <div class="form-group">
            <input type="password" id="password" class="form-control" placeholder="输入密码">
        </div>

        <div class="form-group">
            <input type="password" id="repassword" class="form-control" placeholder="确认密码">
        </div>

        <div>
            <button type="submit" id="submit" class="btn btn-primary btn-lg btn-block">
                提交
            </button>
        </div>
    </div>
</div>
