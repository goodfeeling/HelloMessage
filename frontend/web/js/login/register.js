$('#submit1').on('click', function (e) {
    var password = $('.password').val();
    var verifyPassword = $('.verifyPassword').val();
    if ( !(password == verifyPassword)) {
        $.triggerModalBox('两次密码输入不正确');
        return false;
    }
    if(!$('#inputFile')[0].files[0]) {
        $.triggerModalBox('请上传头像文件');
        return false;
    }
    var formData = new FormData();
    formData.append('imageFile',$('#inputFile')[0].files[0]);
    formData.append('email',$('.email').val());
    formData.append('username',$('.username').val());
    formData.append('password',password);
    formData.append('verifyPassword',verifyPassword);
    $.ajax({
        url: REGISTER,
        type: 'post', //请问这里和method 有什么不同，是不是只是名称不一样呢？？
        dataType: 'json',
        data: formData,
        async: false, //异步
        processData: false, //很重要，告诉jquery不要对form进行处理
        contentType: false, //很重要，指定为false才能形成正确的Content-Type
        success: function (data) {
            if (data['state'] == 201) {
                $.triggerModalBox(data['msg'], '确定', LOGIN);
            } else {
                $.triggerModalBox(data['msg']);
            }
        }
    });

});

// 获取上传文件信息
$('#inputFile').on('change', function () {
    var file = this.files[0];
    if (window.FileReader) {
        var fr = new FileReader();
        fr.readAsDataURL(file);
        fr.onload = function (e) {
            $("#showimg").attr('src', this.result); // 图片可显示出来
            $("#showimg").show()
        };
    } else {
        $.triggerModalBox('暂不支持FileReader')
    };
});
