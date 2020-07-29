<?php

use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '注册账号';

\common\services\StaticServices::includeAppJsStatic('@web/js/login/register.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);
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
    </div>
</div>
<div id="appCapsule">
    <div class="appContent">
        <img src="fornt/img/sample/draw-2.png" alt="img" class="img-fluid mt-3 mb-3">

        <div class="sectionTitle text-center">
            <div class="title">
                <h1>欢迎注册账号</h1>
            </div>
            <div class="lead mb-3">填写以下信息注册</div>
        </div>

        <div class="form-group">
            <input type="email" class="form-control email" placeholder="邮箱地址">
        </div>
        <div class="form-group">
            <input type="text" class="form-control nickname" placeholder="昵称">
        </div>
        <div class="form-group">
            <input type="password" class="form-control password" placeholder="登录密码">
        </div>
        <div class="form-group">
            <input type="password" class="form-control password1" placeholder="确认密码">
        </div>
        <button type="submit" class="btn btn-primary btn-lg btn-block" id="submit1">
            提交
        </button>

    </div>
</div>