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
    $.ajax({
       url: "<?= $urlManager->createUrl(['share/get-config']) ?>",
       type: "GET",
       dataType: 'json',
       data: {
           url: window.location.href
       },
       success: function(res) {
           wx.config({
               debug: true, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
               appId: res['appId'], // 必填，公众号的唯一标识
               timestamp: res['timestamp'], // 必填，生成签名的时间戳
               nonceStr: res['nonceStr'], // 必填，生成签名的随机串
               signature: res['signature'],// 必填，签名
               jsApiList: res['jsApiList'] // 必填，需要使用的JS接口列表
           });
       }
    })

    
    $('.shareBtn').on('click', function(e) {
        $('#theShare').fadeIn(200);
    });

    wx.ready(function() { //需在用户可能点击分享按钮前就先调用
        wx.updateAppMessageShareData({
            title: 'test', // 分享标题
            desc: 'test', // 分享描述
            link: window.location.href, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: '', // 分享图标
            success: function() {
                // 设置成功
            }
        })

        wx.updateTimelineShareData({
            title: 'test', // 分享标题
            link: window.location.href, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: '', // 分享图标
            success: function() {
                // 设置成功
            }
        })
    });

    // 分享
    $('#shareClickEvent').on('click', '.ShareBox', function(e) {
        var chil = $(this).children();
        var type = $(chil[0]).attr('type');
    })
</script>