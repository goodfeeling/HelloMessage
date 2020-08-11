<?php

use yii\bootstrap\ActiveForm;
use yii\helpers\Url;
use yii\captcha\Captcha;
use yii\helpers\Html;

/* @var $this yii\web\View */

$this->title = '登录';
$urlManager = Yii::$app->urlManager;

\common\services\StaticServices::includeAppJsStatic('@web/js/login/index.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);

$captcha_config = [
    'name' => 'captchaimg',
    'captchaAction' => 'login/captcha',
    'imageOptions' => [
        'id' => 'captchaimg',
        'title' => '换一个',
        'alt' => '换一个',
        'style' => ''
    ],
    'template' => '{image}'
];
?>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<div id="appCapsule">
    <div class="appContent">
        <div class="sectionTitle text-center mt-3">
            <div class="title">
                <h1>欢迎回来</h1>
            </div>
            <div class="lead mb-2">继续登录操作</div>
        </div>

        <?php $form = ActiveForm::begin([
            'id' => 'login-form',
        ]); ?>
        <div class="form-group mt-3 mb-3">
            <?= $form->field($model, 'uname')->textInput()->label('用户名') ?>
        </div>
        <div class="form-group mt-3 mb-3">
            <?= $form->field($model, 'password')->passwordInput()->label('密码') ?>
        </div>

        <div class="form-group mt-3 mb-3">
            <div style="position: relative">
                <input name="User[verifyCode]" id="captcha" type="text" class="form-control" placeholder="验证码"
                       style="width: 150px">
                <div style="height: 33px;width: 80px;float: right;cursor: pointer; position: absolute;right: 26px;top: 1px"><?php echo Captcha::widget($captcha_config); ?></div>
            </div>
        </div>
        <div class="form-group row mt-3 mb-3">
            <div class="col-6">
                <div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input" name="User[rememberme]" id="remember"/>
                    <label class="custom-control-label text-muted" for="remember">记住登录状态</label>
                </div>
            </div>
            <div class="col-6 text-right">
                <a href="<?php echo Url::to(['forgot-password']) ?>" class="text-muted">忘记密码?</a>
            </div>
        </div>
        <div>
            <button type="button" class="btn btn-primary btn-lg btn-block submit">登录</button>
        </div>
        <?php ActiveForm::end() ?>

        <div class="divider mt-3 mb-3" hidden></div>

        <div class=" other-login">
            <div class="text-muted mb-2" hidden>或者其它登录方式</div>
            <div class="col-6 wechat-login">
                <img src="images/icon48_wx_button.png" id="wechat-contr" alt="微信登陆">
            </div>
        </div>
    </div>
</div>