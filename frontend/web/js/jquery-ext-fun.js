//jQuery 应用扩展
jQuery.extend({
	triggerModalBox:function (msg, btn = '确定', callback = () => {}) {
	$('.wx-bd').text(msg);
	    $('.wx-main-btn').text(btn);
	    callback();
	    $('#simpleDialog').fadeIn(200);
	}
});