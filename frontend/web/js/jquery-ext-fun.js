//jQuery 应用扩展
;(function ($) {
    $.extend({
        triggerModalBox: function (msg, btn = '确定', callback = () => {
        }) {
            $('.wx-bd').text(msg);
            $('.wx-main-btn').text(btn);
            callback();
            $('#simpleDialog').fadeIn(200);
        }
    });
})(jQuery);

// 关闭模态框
$('.weui-dialog__btn').on('click', function() {
    $('.js_dialog').fadeOut(200);
});

// 触发关闭分享图片
$("#shareit").on("click", function() {
    $("#shareit").hide();
});