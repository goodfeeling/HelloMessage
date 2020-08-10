// 微信支付
$('#goPayPage').on('click', function (e) {

});

// 生成一个二维码
$('.signIn').on('click', function (e) {
    $('.qrcode-siginin-user').attr('src',QRCODE);
    $('.weui-msg-top').show();
});

$('#the-msg-back').on('click', function (e) {
    $('.weui-msg-top').hide();
})