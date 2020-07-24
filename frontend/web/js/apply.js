function triggerModalBox(msg, btn = '确定', callback = () => {
}) {
    $('.wx-bd').text(msg);
    $('.wx-main-btn').text(btn);
    callback();
    $('#simpleDialog').fadeIn(200);

}