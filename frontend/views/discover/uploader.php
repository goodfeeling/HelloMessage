<?php
use yii\helpers\Url;

/* @var $this yii\web\View */
$this->title = '上传动态';
$urlManager = Yii::$app->urlManager;
\common\services\StaticServices::includeAppJsStatic('@web/js/discover/uploader.js',
    ['position' => \yii\web\View::POS_END, 'depends' => [\frontend\assets\WebAsset::className()]]);
?>
<!-- App Header -->
<?php echo \Yii::$app->view->renderFile('@app/views/common/header.php'); ?>
<!-- * App Header -->
<!-- App Capsule -->
<div id="appCapsule">

    <div class="appContent">
        <div class="card mt-2 mb-3">
            <div class="card-body">
                <h5 class="card-title">动态发表</h5>
                <div class="form-group">
                    <textarea rows="3" class="form-control" placeholder="Textarea"></textarea>
                </div>
                <div class="weui-cells weui-cells_form">
                    <div class="weui-cell  weui-cell_uploader">
                        <div class="weui-cell__bd">
                            <div class="weui-uploader">
                                <div class="weui-uploader__hd">
                                    <p class="weui-uploader__title">图片上传</p>
                                    <div class="weui-uploader__info">0/2</div>
                                </div>
                                <div class="weui-uploader__bd">
                                    <ul class="weui-uploader__files" id="uploaderFiles">
                                        <li class="weui-uploader__file" style="background-image: url(./images/pic_160.png);"></li>
                                        <li class="weui-uploader__file" style="background-image: url(./images/pic_160.png);"></li>
                                        <li class="weui-uploader__file" style="background-image: url(./images/pic_160.png);"></li>
                                        <li class="weui-uploader__file weui-uploader__file_status" style="background-image: url(./images/pic_160.png);">
                                            <div class="weui-uploader__file-content">
                                                <i class="weui-icon-warn"></i>
                                            </div>
                                        </li>
                                        <li class="weui-uploader__file weui-uploader__file_status" style="background-image: url(./images/pic_160.png);">
                                            <div class="weui-uploader__file-content">50%</div>
                                        </li>
                                    </ul>
                                    <div class="weui-uploader__input-box">
                                        <input id="uploaderInput" class="weui-uploader__input" type="file" accept="image/*" multiple/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button" class="btn btn-primary">Send</button>
            </div>
        </div>


    </div>
</div>

