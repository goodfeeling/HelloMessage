<?php

use yii\bootstrap\ActiveForm;
use yii\helpers\Url;
use yii\captcha\Captcha;

/* @var $this yii\web\View */

$this->title = '登录页面';
?>
<!-- App Header -->
<div class="appHeader">
    <div class="left">
        <a href="javascript:;" class="icon goBack">
            <i class="icon ion-ios-arrow-back"></i>
        </a>
    </div>
    <div class="pageTitle">
        <?= $this->title ?>
    </div>
    <div class="right">
        <a href="<?php echo Url::to(['login/register']) ?>" class="link">注册</a>
    </div>
</div>
<!-- * App Header -->
<div id="appCapsule">
    <div class="appContent">
        <div class="sectionTitle text-center mt-3">
            <div class="title">
                <h1>欢迎回来</h1>
            </div>
            <div class="lead mb-2">继续登录操作</div>
        </div>

        <form action="index.html">
            <div class="form-group mt-3 mb-3">
                <input type="email" class="form-control" placeholder="邮箱地址">
            </div>
            <div class="form-group mt-3 mb-3">
                <input type="password" class="form-control" placeholder="密码">
            </div>
            <div class="form-group mt-3 mb-3">
                <div style="position: relative">
                    <input name="captcha" id="captcha" type="text" class="form-control" placeholder="验证码" style="width: 150px">
                    <div style="height: 33px;width: 80px;float: right;cursor: pointer; position: absolute;right: 26px;top: 1px"><?php echo Captcha::widget(
    [
                                                            'name' => 'captchaimg',
                                                            'captchaAction' => 'login/captcha',
                                                            'imageOptions' => [
                                                                'id' => 'captchaimg',
                                                                'title' => '换一个',
                                                                'alt' => '换一个',
                                                                'style' => ''
                                                            ],
                                                            'template' => '{image}'
                                                        ]
); ?></div>
                </div>

            </div>
            <div class="form-group row mt-3 mb-3">
                <div class="col-6">
                    <div class="custom-control custom-checkbox">
                        <input type="checkbox" class="custom-control-input" id="remember" />
                        <label class="custom-control-label text-muted" for="remember">记住登录状态</label>
                    </div>
                </div>
                <div class="col-6 text-right">
                    <a href="<?php echo Url::to(['forgot-password']) ?>" class="text-muted">忘记密码?</a>
                </div>
            </div>
            <div>
                <button type="submit" class="btn btn-primary btn-lg btn-block">
                    登录
                </button>
            </div>
        </form>
        <div class="divider mt-3 mb-3"></div>

        <div class="text-muted text-center mb-2">或者其它登录方式</div>
        <div class="row">
            <!--        <div class="col-6">-->
            <!--            <button type="button" class="btn btn-facebook btn-block">-->
            <!--                <i class="icon ion-logo-facebook"></i>-->
            <!--                Facebook-->
            <!--            </button>-->
            <!--        </div>-->
            <div class="col-12 wechat-login">
                <a href="">
                    <img src="images/icon48_wx_button.png" alt="123">
                </a>
            </div>
        </div>
    </div>
</div>