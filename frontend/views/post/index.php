<?php

use yii\helpers\Url;
use yii\helpers\Html;

/* @var $this yii\web\View */

$this->title = '帖子详情';
$urlManager = Yii::$app->urlManager;

\common\services\StaticServices::includeAppJsStatic('@web/js/post/index.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);

?>

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<div id="appCapsule">
    <div class="appContent">
        <!-- title -->
        <h1 class="title-lg mt-2 mb-2">
            <?= $data['name'] ?>
        </h1>
        <!-- * title -->
        <!-- post header -->
        <div class="postHeader mb-2">
            <div>
                <a href="#" class="badge badge-primary"><?= $data['keyword'] ?></a>
            </div>
            <div>
                <img src="<?= $data['avatar_url'] ?>" alt="avatar" class="avatar">
                <?= $data['addtime'] ?>
            </div>
        </div>
        <!-- * post header-->

        <!-- post body -->
        <div class="postBody">
            <?= $data['describe'] ?>
<!--            <button id="applyBtn" class="btn btn-primary btn-block mb-1">活动资格申请</button>-->
        </div>
        <!-- * post body -->

        <!-- author -->
        <div class="postAuthor mt-3">
            <img src="<?= $data['avatar_url'] ?>" alt="avatar" class="avatar">
            <div>
                <strong><?= $data['nickname'] ?></strong>
                <div class="text-muted"><?= $data['nickname'] ?></div>
            </div>
        </div>
        <!-- * author -->

        <!-- post buttons -->
        <div class="row mt-2">
            <?php echo \Yii::$app->view->renderFile('@app/views/common/share.php'); ?>
            <div class="col-6">
                <a href="javascript:" class="btn btn-danger btn-block" id="likes">
                    <i class="icon ion-ios-heart"></i><?= $data['likes'] ?>
                </a>
            </div>
        </div>
        <!-- * post buttons -->

        <div class="divider mt-2 mb-4"></div>

        <!-- related posts -->
        <div class="sectionTitle mb-2">
            <div class="title">
                <h1>最近的帖子</h1>
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
        <!-- * related posts -->
        <div class="divider mt-2 mb-4"></div>
        <!-- <div class="divider mt-4 mb-4"></div> -->
        <?php echo \Yii::$app->view->renderFile('@app/views/common/comment.php'); ?>
    </div>
</div>