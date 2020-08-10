<?php

use yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = '首页';
$is_search = 1;
?>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<div id="appCapsule">
    <div class="appContent">
        <!-- Card Overlay Carousel -->
        <div class="cardOverlayCarousel owl-carousel mt-2 mb-4">
            <?php foreach ($recomment as $key => $value) : ?>
                <!-- item -->
                <div class="item">
                    <a href="<?php echo Url::to(['activity/post', 'id' => $value['id']]) ?>" class="card card-overlay text-white">
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

        <!-- Post Carousel -->
        <div class="sectionTitle mb-2">
            <div class="text-muted">NEWS</div>
            <div class="title">
                <h1>今天</h1>
                <a href="blog-category.html">查看全部</a>
            </div>
        </div>

        <div class="postCarousel owl-carousel">
            <div class="item">
                <a href="blog-post.html">
                    <img src="fornt/img/sample/photo13.jpg" alt="image" class="image">
                    <h2 class="title">Can you spot the difference in this scene</h2>
                </a>
            </div>
            <div class="item">
                <a href="blog-post.html">
                    <img src="fornt/img/sample/photo2.jpg" alt="image" class="image">
                    <h2 class="title">20 Presents That Actually Won't Get Re-Gifted</h2>
                </a>
            </div>
            <div class="item">
                <a href="blog-post.html">
                    <img src="fornt/img/sample/photo3.jpg" alt="image" class="image">
                    <h2 class="title">Is Orange Juice the Enemy of the Disease?</h2>
                </a>
            </div>
            <div class="item">
                <a href="blog-post.html">
                    <img src="fornt/img/sample/photo4.jpg" alt="image" class="image">
                    <h2 class="title">Best Selling Furniture of This Year</h2>
                </a>
            </div>
            <div class="item">
                <a href="blog-post.html">
                    <img src="fornt/img/sample/photo12.jpg" alt="image" class="image">
                    <h2 class="title">What is the best gift to buy for your husband?</h2>
                </a>
            </div>
        </div>
        <!-- * Post Carousel -->


        <div class="divider mt-4 mb-2"></div>


        <!-- Button Carousel -->
        <div class="buttonCarousel owl-carousel">
            <div class="item">
                <a href="#">
                    <div class="imgWrapper">
                        <img src="fornt/img/sample/product1.jpg" alt="image">
                    </div>
                    <strong>Headphones</strong>
                </a>
            </div>
            <div class="item">
                <a href="#">
                    <div class="imgWrapper">
                        <img src="fornt/img/sample/product2.jpg" alt="image">
                    </div>
                    <strong>Furniture</strong>
                </a>
            </div>
            <div class="item">
                <a href="#">
                    <div class="imgWrapper">
                        <img src="fornt/img/sample/product3.jpg" alt="image">
                    </div>
                    <strong>Watch</strong>
                </a>
            </div>
            <div class="item">
                <a href="#">
                    <div class="imgWrapper">
                        <img src="fornt/img/sample/product4.jpg" alt="image">
                    </div>
                    <strong>Camera</strong>
                </a>
            </div>
            <div class="item">
                <a href="#">
                    <div class="imgWrapper">
                        <img src="fornt/img/sample/product5.jpg" alt="image">
                    </div>
                    <strong>Computer</strong>
                </a>
            </div>
            <div class="item">
                <a href="#">
                    <div class="imgWrapper">
                        <img src="fornt/img/sample/product6.jpg" alt="image">
                    </div>
                    <strong>Fruits</strong>
                </a>
            </div>
            <div class="item">
                <a href="#">
                    <div class="imgWrapper">
                        <img src="fornt/img/sample/product7.jpg" alt="image">
                    </div>
                    <strong>Pencil</strong>
                </a>
            </div>
        </div>
        <!-- Button Carousel -->

        <div class="divider mt-2 mb-4"></div>

        <div class="sectionTitle mb-2">
            <div class="text-muted">Overview</div>
            <div class="title">
                <h1>产品</h1>
                <a href="blog-category.html">查看全部</a>
            </div>
            <div class="lead">
                Bitter is using modern design style. Simple and elegant design lines.
            </div>
        </div>

        <!-- item list -->
        <div class="itemList">
            <div class="item">
                <div class="image">
                    <img src="fornt/img/sample/photo14.jpg" alt="image">
                </div>
                <div class="text">
                    <h4 class="title">Pinky Glasses</h4>
                    <div class="text-muted">Simple and elegant design line and has stunning looks</div>
                </div>
            </div>
            <div class="item">
                <div class="image">
                    <img src="fornt/img/sample/photo13.jpg" alt="image">
                </div>
                <div class="text">
                    <h4 class="title">Yellowish Headphone</h4>
                    <div class="text-muted">Perfect spacing and perfect color sheme.</div>
                </div>
            </div>
            <div class="item">
                <div class="image">
                    <img src="fornt/img/sample/photo4.jpg" alt="image">
                </div>
                <div class="text">
                    <h4 class="title">Hybrid</h4>
                    <div class="text-muted">Just what you need for perfect hybrid app design.</div>
                </div>
            </div>
        </div>
        <!-- * item list -->

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
            <?php foreach ($model as $key => $value) : ?>
                <!-- item -->
                <div class="col-6">
                    <a href="<?php echo Url::to(['activity/post', 'id' => $value['id']]) ?>" class="postItem">
                        <div class="imageWrapper">
                            <img src="<?= $value['img_url'] ?>" alt="image" class="image">
                            <div class="badge badge-warning"><?= $value['keyword'] ?></div>
                        </div>
                        <h2 class="title"><?= $value['name'] ?></h2>
                        <footer>
                            <img src="<?= $value['avatar_url'] ?>" alt="avatar" class="avatar">
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
<?php echo \Yii::$app->view->renderFile('@app/views/common/sidebar.php'); ?>
<!-- * Sidebar Menu -->

<?php echo \Yii::$app->view->renderFile('@app/views/common/menu.php'); ?>