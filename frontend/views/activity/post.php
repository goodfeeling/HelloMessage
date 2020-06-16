<?php

use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '文章页面';
?>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/default-header.php'); ?>
<!-- * App Header -->
<div id="appCapsule">
    <div class="appContent">
        <!-- title -->
        <h1 class="title-lg mt-2 mb-2">
            The World's Largest Pillow Fight is Also a Festival
        </h1>
        <!-- * title -->

        <!-- post header -->
        <div class="postHeader mb-2">
            <div>
                <a href="#" class="badge badge-primary">TRAVEL</a>
            </div>
            <div>
                <img src="fornt/img/sample/avatar2.jpg" alt="avatar" class="avatar">
                25 Sep 2019
            </div>
        </div>
        <!-- * post header-->

        <!-- post body -->
        <div class="postBody">

            <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula efficitur, accumsan magna
                vitae, lobortis turpis.
            </p>

            <figure>
                <img src="fornt/img/sample/photo4.jpg" alt="image">
            </figure>

            <p>
                Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
                Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras a
                sem lacinia, cursus elit eu, tempor mi. Pellentesque nec semper nulla, in rhoncus metus. Etiam nisl
                nisi, fermentum eu massa sit amet, euismod iaculis tellus.
            </p>
            <p>
                Donec luctus, nibh id scelerisque mattis,
                nunc enim dignissim felis, et interdum urna magna non nibh. Mauris id mi et purus consequat laoreet.
                Aenean ullamcorper lobortis neque, non pulvinar purus. Aenean id feugiat orci. Nulla quis mattis
                erat. Aenean et consectetur purus. Nullam volutpat venenatis volutpat. Nulla facilisi.
            </p>

            <figure>
                <img src="fornt/img/sample/photo3.jpg" alt="image">
                <figcaption>
                    Aenean lorem odio, mollis sed consequat et, pellentesque id purus. Nunc sagittis malesuada
                    urna...
                </figcaption>
            </figure>

            <p>
                Aenean lorem odio, mollis sed consequat et, pellentesque id purus. Nunc sagittis malesuada urna,
                ultricies lacinia nisi varius vitae. Aliquam sit amet egestas sapien, nec mollis quam.
            </p>
            <a href="<?php echo Url::to(['activity/apply']) ?>" class="btn btn-primary btn-block mb-1">活动资格申请</a>
        </div>
        <!-- * post body -->

        <!-- author -->
        <div class="postAuthor mt-3">
            <img src="fornt/img/sample/avatar.jpg" alt="avatar" class="avatar">
            <div>
                <strong>Olivia Eklund</strong>
                <div class="text-muted">Tech Journalist</div>
            </div>
        </div>
        <!-- * author -->

        <!-- post buttons -->
        <div class="row mt-2">
            <div class="col-6">
                <a href="javascript:;" class="btn btn-primary btn-block">
                    <i class="icon ion-md-share"></i> 分享
                </a>
            </div>
            <div class="col-6">
                <a href="javascript:;" class="btn btn-danger btn-block">
                    <i class="icon ion-ios-heart"></i> 1.2k
                </a>
            </div>
        </div>
        <!-- * post buttons -->

        <div class="divider mt-2 mb-4"></div>

        <!-- related posts -->
        <div class="sectionTitle mb-2">
            <div class="title">
                <h1>最近的活动</h1>
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

        <div class="divider mt-4 mb-4"></div>

        <!-- comments -->
        <div class="sectionTitle mb-2">
            <div class="title">
                <h1>评论 <small>(2)</small></h1>
            </div>
        </div>

        <div class="comments">
            <div class="item">
                <div class="image">
                    <img src="fornt/img/sample/avatar2.jpg" alt="avatar" class="avatar">
                </div>
                <div class="content">
                    <strong>Homayoun Shakibaii</strong>
                    <div class="text">
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ligula efficitur,
                        accumsan magna vitae, lobortis turpis. Suspendisse gravida, augue et vestibulum ultricies,
                        tortor neque condimentum lacus, quis tincidunt nisl est sit amet diam.
                    </div>
                    <footer>25 Sep 2019</footer>
                </div>
            </div>
            <div class="item">
                <div class="image">
                    <img src="fornt/img/sample/avatar4.jpg" alt="avatar" class="avatar">
                </div>
                <div class="content">
                    <strong>Niek Bove</strong>
                    <div class="text">
                        Duis interdum suscipit ullamcorper. Proin purus mi, tincidunt eu eros tincidunt, tincidunt
                        pharetra diam. Etiam congue, massa quis facilisis euismod
                    </div>
                    <footer>25 Sep 2019</footer>
                </div>
            </div>
        </div>
        <!-- * comments -->

        <div class="divider mt-3 mb-3"></div>

        <!-- form -->
        <form>
            <div class="form-group">
                <textarea class="form-control" rows="4" placeholder="Write a comment..."></textarea>
            </div>
            <button type="button" class="btn btn-primary btn-large btn-block">
                提交
            </button>
        </form>
        <!-- * form -->
    </div>
</div>