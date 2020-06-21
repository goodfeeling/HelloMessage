<?php
use yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = '首页';

?>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->
    <div id="appCapsule">
        <div class="appContent">
            <!-- Card Overlay Carousel -->
            <div class="cardOverlayCarousel owl-carousel mt-2 mb-4">
                <?php foreach ($recomment as $key=>$value) : ?>
                <!-- item -->
                <div class="item">
                    <a href="<?php echo Url::to(['activity/post','id' => $value['id']]) ?>" class="card card-overlay text-white">
                        <img src="<?= $value['img_url'] ?>" class="card-img img-fluid" alt="image">
                        <div class="card-img-overlay">
                            <div class="header row">
                                <div class="col-8"><?= $value['keyword'] ?></div>
                                <div class="col-4 text-right">
                                    <i class="icon ion-ios-eye"></i> <?= $value['views'] ?>
                                </div>
                            </div>
                            <div class="content">
                                <h1><?= $value['name'] ?></h1>
                                <footer>
                                    <div class="author">
                                        <img src="<?= $value['avatar_url'] ?>" alt="avatar">
                                        <?= $value['nickname'] ?>
                                    </div>
                                    <div class="date">
                                        <?= $value['addtime'] ?>
                                    </div>
                                </footer>
                            </div>
                        </div>
                    </a>
                </div>
                <!-- * item -->
                <?php endforeach ?>
            </div>
            <!-- * Card Overlay Carousel -->

            <div class="divider mt-4 mb-4"></div>

            <div class="sectionTitle mb-2">
                <div class="text-muted">Lastest</div>
                <div class="title">
                    <h1>热门活动</h1>
                    <a href="<?php echo Url::to(['activity/category']) ?>">查看全部</a>
                </div>
            </div>

            <!-- post list -->
            <div class="row">
            <?php foreach ($model as $key=>$value) : ?>
                <!-- item -->
                <div class="col-6">
                    <a href="<?php echo Url::to(['activity/post','id' => $value['id']]) ?>" class="postItem">
                        <div class="imageWrapper">
                            <img src="<?= $value['img_url'] ?>" alt="image" class="image">
                            <div class="badge badge-warning"><?= $value['keyword'] ?></div>
                        </div>
                        <h2 class="title"><?= $value['name'] ?></h2>
                        <footer>
                            <img src="<?= $value['img_url'] ?>" alt="avatar" class="avatar">
                            <?= $value['addtime'] ?>
                        </footer>
                    </a>
                </div>
                <!-- * item -->
                <?php endforeach ?>
            </div>

        </div>
    </div>
            <!-- Sidebar Menu -->
    <?php echo \Yii::$app->view->renderFile('@app/views/common/sidebar.php',['userInfo'=>$userInfo,'is_login'=>empty($userInfo) ? '0':'1']); ?>
    <!-- * Sidebar Menu -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/menu.php'); ?>