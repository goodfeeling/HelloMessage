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