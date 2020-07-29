$('#submit').click(function(e) {
    var data = {
        'title': $('#title').val(),
        'email': $('#email').val(),
        'content': $('#content').val(),
    };
    $.ajax({
        url: "<?= $urlManager->createUrl(['feedback/index']) ?>",
        type: 'post', //请问这里和method 有什么不同，是不是只是名称不一样呢？？
        dataType: 'json',
        data: data,
        success: function(data) {
            if (data['state'] == 0) {
                $('.wx-bd').text(data['msg']);
                $('#simpleDialog').fadeIn(300);
                if (data['state'] == 0 ) {
                    $('.weui-dialog__ft').on('click',function(e){
                        window.location.href = "<?= Url::toRoute('feedback/index', true) ?>";
                    });
                }
            } else {
                $('.wx-bd').text(res['msg']);
                $('.wx-main-btn').text("确定");
                $('#simpleDialog').fadeIn(200);
            }
        }
    });
});