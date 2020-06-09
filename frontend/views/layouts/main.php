<?php

/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use common\widgets\Alert;
use yii\helpers\Url;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>

</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
    <div class="container">
        <?= $content ?>
    </div>
</div>

<footer class="am-menu am-cf">
    <div class="am-menu-column index" id="index">
        <a class="glyphicon glyphicon-home btn btn-default" href="<?php echo Url::home() ?>">
            <!-- <span>首页</span> -->
        </a>
    </div>
    <div class="am-menu-column explore" id="explore">
        <a class="glyphicon glyphicon-comment btn btn-default" href="<?php echo Url::to(['apply']) ?>">
            <!-- <span>申请</span> -->
        </a>
    </div>
    <div class="am-menu-column life" id="life">
        <a class="glyphicon glyphicon-map-marker btn btn-default" href="<?php echo Url::to(['discover']) ?>">
            <!-- <span>发现</span> -->
        </a>
    </div>
    <div class="am-menu-column my" id="my">
        <a class="glyphicon glyphicon-user btn btn-default" href="<?php echo Url::to(['my']) ?>">
            <!-- <span>我的</span> -->
        </a>
    </div>
</footer>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<script type="text/javascript">
    window.onload = function(){
        (function ($) {
                $.getUrlParam = function (name) {
                    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
                    var r = window.location.search.substr(1).match(reg);
                    if (r != null) return unescape(r[2]); return null;
                }
            })(jQuery);
        var str = $.getUrlParam('r');
        if (str.search('apply') != -1){
            $('#apply>a').addClass('btn-primary')
        } else if(str.search('discover') != -1){
            $('#discover>a').removeClass('btn-default').addClass('btn-primary')
        } else if(str.search('my') != -1){
            $('#my>a').removeClass('btn-default').addClass('btn-primary')
        } else {
            $('#index>a').removeClass('btn-default').addClass('btn-primary')
        }

        $('#index>a').mouseover(function(e){
            $(e).removeClass('btn-default').addClass('btn-primary')
        })
    }
</script>
