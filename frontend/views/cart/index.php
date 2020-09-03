<?php
use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '购物车';
$urlManager = Yii::$app->urlManager;
?>

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<div id="appCapsule">
    <div class="appContent">
        <h3 class="mb-2 mt-2">购物清单</h3>
        <div class="table-responsive">
            <table class="table table-dark">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Last</th>
                    <th scope="col">Tag</th>
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
                </tbody>
            </table>
        </div>
        <div class="divider large mt-2 mb-2"></div>
        <p>小计:100.00</p>
        <button type="button" class="btn btn-primary btn-lg btn-block mb-1">付款</button>
    </div>
</div>
<!-- Sidebar Menu -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/sidebar.php'); ?>
<!-- * Sidebar Menu -->

<?php echo \Yii::$app->view->renderFile('@app/views/common/menu.php'); ?>
