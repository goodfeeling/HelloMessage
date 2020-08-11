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
            debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
            appId: res['appId'], // 必填，公众号的唯一标识
            timestamp: res['timestamp'], // 必填，生成签名的时间戳
            nonceStr: res['nonceStr'], // 必填，生成签名的随机串
            signature: res['signature'],// 必填，签名
            jsApiList: res['jsApiList'] // 必填，需要使用的JS接口列表
        });
    }
})

//立即分享到微信朋友圈点击事件
$("#share_btn").on("click", function() {
    $("#shareit").show();
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

wx.error(function(res){
    // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
    console.log(res)
});