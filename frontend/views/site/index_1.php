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
                <?php foreach ($recomment as $key=>$value) ?>
                <!-- item -->
                <div class="item">
                    <a href="<?php echo Url::to(['activity/post']) ?>" class="card card-overlay text-white">
                        <img src="fornt/img/sample/photo8.jpg" class="card-img img-fluid" alt="image">
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
                                        <img src="<?= $value['img_url'] ?>" alt="avatar">
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
                <?php endforeach; ?>
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
                <!-- item -->
                <div class="col-6">
                    <a href="<?php echo Url::to(['activity/post']) ?>" class="postItem">
                        <div class="imageWrapper">
                            <img src="fornt/img/sample/photo11.jpg" alt="image" class="image">
                            <div class="badge badge-warning">SPORT</div>
                        </div>
                        <h2 class="title">Juxon praises Peri’s resilience after testing week</h2>
                        <footer>
                            <img src="fornt/img/sample/avatar.jpg" alt="avatar" class="avatar">
                            25 Sep 2019
                        </footer>
                    </a>
                </div>
                <!-- * item -->
                <!-- item -->
                <div class="col-6">
                    <a href="<?php echo Url::to(['activity/post']) ?>" class="postItem">
                        <div class="imageWrapper">
                            <img src="fornt/img/sample/photo8.jpg" alt="image" class="image">
                            <div class="badge badge-success">TRAVEL</div>
                        </div>
                        <h2 class="title">Top 10 Travel Bloggers You Should Follow</h2>
                        <footer>
                            <img src="fornt/img/sample/avatar2.jpg" alt="avatar" class="avatar">
                            21 Sep 2019
                        </footer>
                    </a>
                </div>
                <!-- * item -->
                <!-- item -->
                <div class="col-6">
                    <a href="<?php echo Url::to(['activity/post']) ?>" class="postItem">
                        <div class="imageWrapper">
                            <img src="fornt/img/sample/photo3.jpg" alt="image" class="image">
                            <div class="badge badge-danger">FOODS</div>
                        </div>
                        <h2 class="title">Is Orange Juice the Enemy of the Disease?</h2>
                        <footer>
                            <img src="fornt/img/sample/avatar.jpg" alt="avatar" class="avatar">
                            15 Sep 2019
                        </footer>
                    </a>
                </div>
                <!-- * item -->
                <!-- item -->
                <div class="col-6">
                    <a href="<?php echo Url::to(['activity/post']) ?>" class="postItem">
                        <div class="imageWrapper">
                            <img src="fornt/img/sample/photo4.jpg" alt="image" class="image">
                            <div class="badge badge-info">HEALTH</div>
                        </div>
                        <h2 class="title">Check the Best Selling Furniture of This Year</h2>
                        <footer>
                            <img src="fornt/img/sample/avatar.jpg" alt="avatar" class="avatar">
                            12 Sep 2019
                        </footer>
                    </a>
                </div>
                <!-- * item -->
            </div>

        </div>
    </div>
            <!-- Sidebar Menu -->
    <?php echo \Yii::$app->view->renderFile('@app/views/common/sidebar.php',['userInfo'=>$userInfo,'is_login'=>empty($userInfo) ? '0':'1']); ?>
    <!-- * Sidebar Menu -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/menu.php'); ?>