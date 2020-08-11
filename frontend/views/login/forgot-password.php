<?php
use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '忘记密码';
?>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->
<div id="appCapsule">
    <div class="appContent pb-0">

        <img src="fornt/img/sample/draw-1.png" alt="img" class="img-fluid mb-3 mt-3">

        <div class="sectionTitle text-center">
            <div class="title">
                <h1>填写您的邮箱</h1>
            </div>
            <div class="lead mb-3">输入您的邮箱地址</div>
        </div>

        <form action="index.html">
            <div class="form-group">
                <input type="email" class="form-control" placeholder="E-mail">
            </div>
            <div>
                <button type="submit" class="btn btn-primary btn-lg btn-block">
                    提交
                </button>
            </div>
        </form>

        <div class="mt-3 text-center">
            没有账号吗? <a href="<?php echo Url::to(['login/register']) ?>">注册</a>
        </div>

    </div>
</div>
