<?php

use yii\helpers\Url;

/* @var $this yii\web\View */
$urlManager = Yii::$app->urlManager;
?>
<script src="http://res.wx.qq.com/open/js/jweixin-1.6.0.js"></script>

<div class="col-6 shareBtn">
    <a href="javascript:;" class="btn btn-primary btn-block">
        <i class="icon ion-md-share"></i> 分享
    </a>
</div>

<script>
    // 获取参数
    //$.ajax({
    //    url: "<?//= $urlManager->createUrl(['activity/verify-user']) ?>//",
    //    type: "GET",
    //    dataType: 'json',
    //    data: {
    //        url: window.location.href
    //    },
    //    success: function(res) {
    //        wx.config({
    //            debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
    //            appId: res.data['appId'], // 必填，公众号的唯一标识
    //            timestamp: res.data['timestamp'], // 必填，生成签名的时间戳
    //            nonceStr: res.data['nonceStr'], // 必填，生成签名的随机串
    //            signature: res.data['signature'],// 必填，签名
    //            jsApiList: res.data['jsApiList'] // 必填，需要使用的JS接口列表
    //        });
    //    }
    //})

    // 分享
    $('.shareBtn').on('click',function (e) {
        $('#theShare').fadeIn(200);
    });
</script>
