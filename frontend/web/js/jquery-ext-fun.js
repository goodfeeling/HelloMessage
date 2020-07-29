//jQuery 应用扩展
;(function ($) {
    $.extend({
        triggerModalBox: function (msg, btn = '确定', url = '') {
            $('.wx-bd').text(msg);
            $('.wx-main-btn').text(btn);
            $('.wx-main-btn').on('click', function (e) {
                window.location.href = url;
            });
            $('#simpleDialog').fadeIn(200);
        },

        getUrlParam: function (name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(r[2]);
            return null;
        }
    });
})(jQuery);

