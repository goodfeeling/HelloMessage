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
        <p>...</p>
    </div>
    <div class="list-group">
      <a href="<?php echo Url::to(['my-activity']) ?>" class="list-group-item glyphicon glyphicon-heart active"> 参加过的活动</a>
      <a href="<?php echo Url::to(['my-detail']) ?>" class="list-group-item glyphicon glyphicon-list-alt"> 个人信息</a>
      <a href="<?php echo Url::to(['my-phone']) ?>" class="list-group-item glyphicon glyphicon-phone"> 绑定手机号</a>
      <a href="<?php echo Url::to(['help-center']) ?>" class="list-group-item glyphicon glyphicon-phone-alt"> 帮助中心</a>
      <a href="<?php echo Url::to(['my-setting']) ?>" class="list-group-item glyphicon glyphicon-cog"> 设置</a>
    </div>
    <button type="button" class="btn btn-danger logout">退出登录</button>
</div>