<?php

use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '注册账号';
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

<script>
    window.onload = function () {
        $('#submit1').on('click',function(e){
            var email = $('.email').val();
            var nickname = $('.nickname').val();
            var password = $('.password').val();
            var password1 = $('.password1').val();
            if (password == password1) {
                var data = {
                    'email': email,
                    'nickname': nickname,
                    'password': password,
                };
                $.ajax({
                    url: 'index.php?r=site/apply',
                    type: 'post', //请问这里和method 有什么不同，是不是只是名称不一样呢？？
                    dataType: 'json',
                    data: data,
                    success: function (data) {
                        console.log(data);
                    }
                });
            } else {
                $.triggerModalBox('两次密码输入不正确');
            }
        });
        $('.password1').on('change',function(e){
            var password = $('.password').val();
            var password1 = $('.password1').val();

        });
    }
</script>