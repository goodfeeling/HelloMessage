<?php

use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '注册账号';

\common\services\StaticServices::includeAppJsStatic('@web/js/login/register.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);
?>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

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
            <label for="exampleInputFile">上传您的头像</label>
            <input type="file" id="inputFile">
            <img id="showimg" src="" class="img-circle" style="display: none;margin-top: 10px"/>
            <p class="help-block">点击按钮即可上传.</p>
        </div>

        <div class="form-group">
            <input type="email" class="form-control email" placeholder="邮箱地址">
        </div>

        <div class="form-group">
            <input type="text" class="form-control username" placeholder="昵称">
        </div>

        <div class="form-group">
            <input type="password" class="form-control password" placeholder="登录密码">
        </div>

        <div class="form-group">
            <input type="password" class="form-control verifyPassword" placeholder="确认密码">
        </div>

        <button type="submit" class="btn btn-primary btn-lg btn-block" id="submit1">
            提交
        </button>

    </div>
</div>