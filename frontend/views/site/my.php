<?php

use yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = '个人中心';

?>

<style>
    .jumbotron>a>img {
        width: 100px;
        height: 100px;
        object-fit: cover;
    }
    .logout {
        width: 100%;
    }
</style>
<div class="site-index">
    <div class="jumbotron center-block">
        <a href="#">
            <img class="media-object img-circle " src="<?=Url::base()?>/images/touxiang.jpg" alt="...">
        </a>
        <h1>My name</h1>
    </div>
    <ul class="nav nav-pills nav-stacked">
        <li role="presentation" class="active"><a href="#">个人信息</a></li>
        <li role="presentation"><a href="#">绑定手机号</a></li>
        <li role="presentation"><a href="#">联系客服</a></li>
    </ul>
    <button type="button" class="btn btn-danger logout">退出登录</button>
</div>