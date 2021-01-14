<?php

use yii\helpers\Url;

/* @var $this yii\web\View */

$this->title = '活动列表';
?>

<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->
<!-- App Capsule -->
<div id="appCapsule">

    <div class="appContent">
        <!-- post list -->
        <div class="row mt-2">
            <?php foreach ($models as $key => $value) : ?>
                <!-- item -->
                <div class="col-6">
                    <a href="<?php echo Url::to(['post/index', 'id' => $value['id']]) ?>" class="postItem">
                        <div class="imageWrapper">
                            <img src="<?= $value['img_url'] ?>" alt="image" class="image">
                        </div>
                        <h2 class="title"><?= $value['name'] ?></h2>
                    </a>
                </div>
                <!-- * item -->
            <?php endforeach ?>
        </div>
        <!-- * post list -->

        <div class="mt-2 mb-2">
            <?php echo \yii\widgets\LinkPager::widget([
                'pagination' => $pages,
            ]); ?>
        </div>
    </div>
</div>
<!-- * appCapsule -->
    
