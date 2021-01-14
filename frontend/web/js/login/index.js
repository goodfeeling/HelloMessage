$(document).on('click', '.wechat-contr', function () {
    $.ajax({
        url: LOGIN_JUMP,
        type: "GET",
        dataType:'json',
        success: function(res){
            window.location = res['data']
        }
    })
})

$('.submit').on('click', function (e) {
    var $form = $('#login-form');
    var data = $form.serialize();
    $.ajax({
        url: $form.attr('action'),
        type: 'POST',
        data: data,
        success: function (data) {
            $.triggerModalBox(data['msg']);
        },
        error: function (jqXHR, errMsg) {
        }
    });
    return false; // 防止默认提交
})