<?php

use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '活动详情';
$urlManager = Yii::$app->urlManager;
?>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/default-header.php'); ?>
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
            <div>
                <?= $data['describe'] ?>
            </div>

            <a href="<?php echo Url::to(['activity/apply']) ?>" class="btn btn-primary btn-block mb-1">活动资格申请</a>
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
            <div class="col-6">
                <a href="javascript:;" class="btn btn-primary btn-block">
                    <i class="icon ion-md-share"></i> 分享
                </a>
            </div>
            <div class="col-6">
                <a href="javascript:;" class="btn btn-danger btn-block" id="likes">
                    <i class="icon ion-ios-heart"></i><?= $data['likes'] ?>
                </a>

            </div>
        </div>
        <!-- * post buttons -->

        <div class="divider mt-2 mb-4"></div>

        <!-- related posts -->
        <!-- <div class="sectionTitle mb-2">
            <div class="title">
                <h1>最近的活动</h1>
            </div>
        </div> -->
        <!-- <div class="postCarousel owl-carousel">
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
        </div> -->
        <!-- * related posts -->

        <!-- <div class="divider mt-4 mb-4"></div> -->

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
                    <strong>ccc</strong>
                    <div class="text">
                        很棒的一个活动
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

<script>    
    $('#likes').on('click', function(e) {
        $.ajax({
            url: "<?= $urlManager->createUrl(['activity/likes-increase']) ?>",
            type: "POST",
            dataType: 'json',
            data: {
                id: <?= Yii::$app->request->getQueryParam('id') ?>
            },
            success: function(res) {
                if (res['state'] == 1) {
                    $('.weui-dialog__bd').html = res['msg'];
                    $('#myDialog').fadeIn(200);
                }
            }
        })
    });
</script>