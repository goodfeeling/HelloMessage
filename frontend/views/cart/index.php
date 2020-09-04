<?php
use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '购物车';
$urlManager = Yii::$app->urlManager;
$identity = \Yii::$app->user->identity;
?>

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<div id="appCapsule">
    <div class="appContent">
        <div class="splashBlock" <?= $identity ? 'hidden':'' ?>>
            <div class="splashTitle text-primary">
                <div class="mb-3 mt-2">
                    <img src="fornt/img/sample/draw-5.png" alt="draw" class="img-fluid">
                </div>
            </div>

            <div class="sectionTitle text-center">
                <div class="title">
                    <h1>
                        你还未登录!
                    </h1>
                </div>
                <div class="lead">
                    请点击这里进行<a href="#">登录</a>或<a href="#">注册</a>账号，进行体验购物.
                </div>
            </div>
        </div>
        <div <?= $identity ? '' : 'hidden' ?>>
            <h3 class="mb-2 mt-2">购物清单</h3>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">图片</th>
                        <th scope="col">价格</th>
                        <th scope="col">数量</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="divider large mt-2 mb-2"></div>

            <div class="pull-right">
                <h4>优惠:100.00</h4>
                <h4>小计:100.00</h4>
                <h3 class="text-primary">合计:100.00</h3>
            </div>
            <button type="button" class="btn btn-outline-dark mr-1 mb-1 btn-lg btn-block">付款</button>
        </div>
    </div>
</div>
<!-- Sidebar Menu -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/sidebar.php'); ?>
<!-- * Sidebar Menu -->

<?php echo \Yii::$app->view->renderFile('@app/views/common/menu.php'); ?>
