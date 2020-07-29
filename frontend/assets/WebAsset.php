<?php


namespace frontend\assets;


use yii\web\AssetBundle;

class WebAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [

    ];
    public $js = [
        'fornt/js/lib/popper.min.js',
        'fornt/js/lib/bootstrap.min.js',
        'fornt/js/plugins/owl.carousel.min.js',
        'js/zepto.min.js',
        'js/jweixin-1.0.0.js',
        'js/weui.min.js',
        'fornt/js/app.js'
    ];
    public $depends = [

    ];

    /**
     * @inheritdoc
     */
    public $jsOptions = [
        'position' => \yii\web\View::POS_END,   // 这是设置所有js放置的位置
    ];
}