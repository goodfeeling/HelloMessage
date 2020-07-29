$('#submit1').on('click', function (e) {
    var email = $('.email').val();
    var nickname = $('.nickname').val();
    var password = $('.password').val();
    var password1 = $('.password1').val();
    if (password == password1) {
        var data = {
            'email': email,
            'nickname': nickname,
            'password': password,
        };
        $.ajax({
            url: APPLY,
            type: 'post', //请问这里和method 有什么不同，是不是只是名称不一样呢？？
            dataType: 'json',
            data: data,
            success: function (data) {
                console.log(data);
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
