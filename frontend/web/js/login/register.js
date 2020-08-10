$('#submit1').on('click', function (e) {
    var email = $('.email').val();
    var username = $('.username').val();
    var password = $('.password').val();
    var verifyPassword = $('.verifyPassword').val();
    if (password == verifyPassword) {
        var data = {
            'email': email,
            'username': username,
            'password': password,
            'verifyPassword':verifyPassword
        };
        $.ajax({
            url: REGISTER,
            type: 'post', //请问这里和method 有什么不同，是不是只是名称不一样呢？？
            dataType: 'json',
            data: data,
            success: function (data) {
                if (data['state'] == 201) {
                    $.triggerModalBox(data['msg'],'确定',LOGIN);
                } else {
                    $.triggerModalBox(data['msg']);
                }
            }
        });
    } else {
        $.triggerModalBox('两次密码输入不正确');
    }
});
$('.password1').on('change', function (e) {
    var password = $('.password').val();
    var password1 = $('.password1').val();

});
