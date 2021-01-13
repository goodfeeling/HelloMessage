<?php
use yii\helpers\Url;

/* @var $this yii\web\View */
$this->title = '上传个人头像';
$urlManager = Yii::$app->urlManager;
\common\services\StaticServices::includeAppJsStatic('@web/js/user-info/setting-avatar.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);
$avatar_url = (new \frontend\service\UserService())->generaterUrl($this->params['user_info']['avatar_url'] ?? '');
?>
<style>
    .upload_person_img {
        margin: 20px auto 0;
    }
</style>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->

<div id="appCapsule">
    <div class="appContent">
        <img id="showimg" src="<?= $avatar_url ?? '' ?>" class="imageBlock img-fluid"/>
        <div class="divider mt-4 mb-4"></div>
        <p class="help-block">点击按钮即可上传.</p>
        <input type="file" id="inputFile">
        <div class="divider mt-4 mb-4"></div>
        <button type="submit" class="btn btn-outline-dark mr-1 mb-1 btn-lg btn-block" id="submit">
            上传
        </button>
    </div>
</div>