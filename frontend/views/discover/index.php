<?php

use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '发现';
$urlManager = Yii::$app->urlManager;
?>

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<!-- App Capsule -->
<div id="appCapsule">

    <div class="appContent">

        <!-- Button Carousel -->
        <div class="buttonCarousel owl-carousel mt-2 mb-2">
            <div class="item active">
                <a href="#">
                    <div class="imgWrapper">
                        <img src="fornt/img/sample/avatar.jpg" alt="image">
                    </div>
                    <strong>Diego</strong>
                </a>
            </div>

            <div class="item active">
                <a href="#">
                    <div class="imgWrapper">
                        <img src="fornt/img/sample/avatar2.jpg" alt="image">
                    </div>
                    <strong>Yogarasa</strong>
                </a>
            </div>
            <div class="item active">
                <a href="#">
                    <div class="imgWrapper">
                        <img src="fornt/img/sample/avatar3.jpg" alt="image">
                    </div>
                    <strong>Edward</strong>
                </a>
            </div>
            <div class="item">
                <a href="#">
                    <div class="imgWrapper">
                        <img src="fornt/img/sample/avatar4.jpg" alt="image">
                    </div>
                    <strong>Amelia</strong>
                </a>
            </div>
            <div class="item">
                <a href="#">
                    <div class="imgWrapper">
                        <img src="fornt/img/sample/avatar5.jpg" alt="image">
                    </div>
                    <strong>Thomas</strong>
                </a>
            </div>
            <div class="item">
                <a href="#">
                    <div class="imgWrapper">
                        <img src="fornt/img/sample/avatar6.jpg" alt="image">
                    </div>
                    <strong>Dominik</strong>
                </a>
            </div>
            <div class="item">
                <a href="#">
                    <div class="imgWrapper">
                        <img src="fornt/img/sample/avatar7.jpg" alt="image">
                    </div>
                    <strong>Charles</strong>
                </a>
            </div>
        </div>
        <!-- Button Carousel -->


        <!-- post -->
        <div class="photoPost">
            <header>
                <div class="user">
                    <a href="<?= Url::to(['chat/friend']) ?>">
                        <img src="fornt/img/sample/avatar3.jpg" alt="avatar" class="avatar">
                        <strong>Thomas Durrad</strong>
                    </a>
                </div>
                <div class="right">
                    <div class="lead">5 mins ago</div>
                </div>
            </header>
            <div class="image">
                <a href="social-post.html">
                    <img src="fornt/img/sample/photo8.jpg" alt="photo" class="img-fluid">
                </a>
            </div>
            <footer class="row">
                <div class="col-8">
                    <button class="btn btn-sm mr-2"><i class="icon ion-ios-heart text-danger"></i>52</button>
                    <button class="btn btn-sm"><i class="icon ion-ios-text text-primary"></i>3</button>
                </div>
                <div class="col-4 text-right">
                    <button class="btn btn-sm mr-2"><i class="icon ion-ios-bookmark text-secondary"></i></button>
                    <button class="btn btn-sm"><i class="icon ion-ios-share-alt text-secondary"></i></button>
                </div>
            </footer>
        </div>
        <!-- post -->

        <div class="divider mt-2 mb-2"></div>

    </div>

</div>
<!-- appCapsule -->

<!-- Sidebar Menu -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/sidebar.php'); ?>
<!-- * Sidebar Menu -->

<?php echo \Yii::$app->view->renderFile('@app/views/common/menu.php'); ?>
